/*
 * Copyright (c) 2020 NVI, Inc.
 *
 * This file is part of VLBI Field System
 * (see http://github.com/nvi-inc/fs).
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program. If not, see <http://www.gnu.org/licenses/>.
 */
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/types.h>
#include <unistd.h>

#include <getopt.h>

#ifdef __APPLE__
#include <util.h>
#elif __linux__
#include <pty.h>
#include <utmp.h>
#elif __unix__ // all unices not caught above
#include <util.h>
#elif defined(_POSIX_VERSION)
// POSIX
#else
#error "Unknown compiler"
#endif

#include <sys/ioctl.h>
#include <termios.h>

#include <errno.h>
#include <fcntl.h>
#include <signal.h>
#include <sys/stat.h>
#include <sys/time.h>
#include <sys/wait.h>

#include <nng/compat/nanomsg/nn.h>
#include <nng/compat/nanomsg/pubsub.h>
#include <nng/compat/nanomsg/reqrep.h>
#include <pthread.h>

#include "msg.h"

const int heartbeat_millis = 500;
const int shutdown_heartbeat_millis = 200;

uint64_t seq          = 0; // Next message sequence ID to send
size_t msg_buffer_len = 1024;
msg_t *msg_buffer     = NULL; // Ring buffer of messages
pthread_mutex_t msg_buffer_lock;

static volatile int terminate = 0;
void term_handler(int i) {
	terminate = i;
}

void fatal(const char *msg, int err) {
	if (err != 0)
		fprintf(stderr, "spub error %s: %s\n", msg, nn_strerror(err));
	else
		fprintf(stderr, "spub error %s\n", msg);
	exit(EXIT_FAILURE);
}

// Thread to manange out-of-band sync rep socket recieves the sequence numer it
// last saw and replies with all messages after that in the buffer
void *sync_manager(void *arg) {
	int fd = (intptr_t)arg;

	void *buf;
	for (;;) {
		int rc = nn_recv(fd, &buf, NN_MSG, 0);
		if (rc < 0) {
			if (nn_errno() == EBADF) {
				return NULL; // Socket closed by another thread.
			}
			/*  Any error here is unexpected. */
			fatal("in sync_manager recv", errno);
		}
		uint64_t req_seq;
		int n = uint64_unmarshal_le(&req_seq, buf, rc);
		nn_freemsg(buf);
		if (n < 0) {
			fprintf(stderr, "spub: bad msg");
			continue;
		}

		if (pthread_mutex_lock(&msg_buffer_lock) < 0) {
			fatal("locking msgs for read", errno);
			continue;
		}

		if (seq == 0 || req_seq >= seq) {
			nn_send(fd, "", 1, 0);
			goto unlock;
		}

		// Cache of msgs,
		// Find the first message requested
		int first = seq % msg_buffer_len; // oldest message
		if (msg_buffer[first].data == NULL)
			first = 0; // if buffer hasn't filled yet
		while (msg_buffer[first].seq < req_seq) {
			first = (first + 1) % msg_buffer_len;
		}

		size_t rep_msg_size = 0;

		// NB (seq-1) is the last seq posted
		for (int j = first;; j = (j + 1) % msg_buffer_len) {
			rep_msg_size += msg_marshaled_len(&msg_buffer[j]);
			if (msg_buffer[j].seq == seq - 1)
				break;
		}

		uint8_t *rep_msg = nn_allocmsg(rep_msg_size, 0);
		if (!rep_msg) {
			fatal("allocating reply msg", errno);
		}

		uint8_t *rep_ptr = rep_msg;
		size_t msg_len   = 0;

		for (int j = first;; j = (j + 1) % msg_buffer_len) {
			n = msg_marshal(&msg_buffer[j], rep_ptr, rep_msg_size - msg_len);
			if (n < 0) {
				fatal("marshaling msg", 0);
			}
			rep_ptr += n;
			msg_len += n;

			if (msg_buffer[j].seq == seq - 1)
				break;
		}

		if (msg_len != rep_msg_size) {
			fatal("msg smaller than anticipated", 0);
		}

		rc = nn_send(fd, &rep_msg, NN_MSG, 0);

	unlock:
		if (pthread_mutex_unlock(&msg_buffer_lock) < 0) {
			fatal("error unlocking msgs from read", 0);
		}
	}
	return NULL;
}

ssize_t send_msg(int nnsock, msg_t *m) {
	ssize_t pub_len  = msg_marshaled_len(m);
	uint8_t *pub_buf = nn_allocmsg(pub_len, 0);

	if (pub_buf == NULL) {
		return -1;
	}
	if (msg_marshal(m, pub_buf, pub_len) < 0) {
		return -1;
	}
	if (nn_send(nnsock, &pub_buf, NN_MSG, 0) < 0) {
		return -1;
	};

	return pub_len;
}

// clang-format off
static const char *usage_short_str =
"Usage: %s [-h] [-b length] [-w seconds] [pubaddr syncaddr]\n";
static const char *usage_long_str =
"Usage: %s [-h] [-b length] [-w seconds] [pubaddr syncaddr]\n"
"create to a reliable pubsub stream\n"
"  pubaddr, syncaddr    nanomsg addresses of publish and resync sockets\n"
"  -b, --buffer         number of previous messages (usually lines) to keep\n"
"  -w, --wait           number of seconds to wait for after stream closes (default 0.5) \n";


static struct option long_options[] = {
    {"help",   no_argument,       NULL, 'h'},
    {"buffer", required_argument, NULL, 'b'},
    {"wait",   required_argument, NULL, 'w'},
    {NULL, 0, NULL, 0}
};
// clang-format on

int main(int argc, char *argv[]) {
	char *pubaddr      = "tcp://*:4444";
	char *repaddr      = "tcp://*:4445";
	float wait_seconds = 0.5;

	int opt;
	int option_index;
	while ((opt = getopt_long(argc, argv, "hb:w:", long_options, &option_index)) != -1) {
		switch (opt) {
		case 0:
			// All long options are handled by their short form
			break;
		case 'h':
			printf(usage_long_str, argv[0]);
			exit(EXIT_SUCCESS);
			break;
		case 'b':
			msg_buffer_len = atoi(optarg);
			if (!msg_buffer_len)
				fatal("buffer length must be greater than 0", 0);
			break;
		case 'w':
			wait_seconds = atof(optarg);
			if (wait_seconds < 0)
				fatal("wait can not be negative", 0);
			break;
		default: /* '?' */
			fprintf(stderr, usage_short_str, argv[0]);
			exit(EXIT_FAILURE);
		}
	}

	// Read the rest of the command line
	int nargs = argc - optind;
	if (nargs > 0) {
		if (nargs < 2) {
			fatal("pub address specified without rep address", 0);
		}
		pubaddr = argv[optind];
		repaddr = argv[optind + 1];
	}

	msg_buffer = calloc(msg_buffer_len, sizeof(msg_t));

	if (!msg_buffer) {
		fatal("allocating msg buffer", errno);
	}

	if (signal(SIGTERM, term_handler) == SIG_ERR || signal(SIGINT, term_handler) == SIG_ERR) {
		fatal("setting signal handler", errno);
	}

	int pub = nn_socket(AF_SP, NN_PUB);
	if (nn_bind(pub, pubaddr) < 0) {
		fatal("binding publish socket", errno);
	}

	int rep  = nn_socket(AF_SP, NN_REP);
	int prio = 1;
	nn_setsockopt(rep, NN_SOL_SOCKET, NN_SNDPRIO, &prio, sizeof(prio));
	if (nn_bind(rep, repaddr) < 0) {
		fatal("binding reply socket", errno);
	}

	pthread_mutex_init(&msg_buffer_lock, NULL);

	pthread_t rep_thread;
	if (pthread_create(&rep_thread, NULL, sync_manager, (void *)(intptr_t)rep) < 0) {
		fatal("creating reply thread", errno);
	}

	fd_set rfds;
	struct timeval tv;
	char buf[8192];
	ssize_t n;

	for (;;) {
		FD_ZERO(&rfds);
		FD_SET(STDIN_FILENO, &rfds);
		tv.tv_sec  = heartbeat_millis / 1000;
		tv.tv_usec = (heartbeat_millis % 1000) * 1000;

		int retval = select(STDIN_FILENO + 1, &rfds, NULL, NULL, &tv);

		if (terminate) {
			signal(SIGINT, SIG_DFL);
			signal(SIGQUIT, SIG_DFL);
			signal(SIGTERM, SIG_DFL);
			break;
		}

		if (retval < 0) {
			fatal("on select", errno);
		}

		if (retval == 0) {
			msg_t m = {HEARTBEAT, seq, 0, NULL};
			if (send_msg(pub, &m) < 0) {
				fatal("sending HEARTBEAT", errno);
			}
			continue;
		}

		if ((n = read(STDIN_FILENO, buf, sizeof(buf))) <= 0) {
			break;
		}

		if (pthread_mutex_lock(&msg_buffer_lock) < 0) {
			fatal("locking rwlock for write", errno);
		}

		size_t i = seq % msg_buffer_len;

		if (msg_buffer[i].data != NULL) {
			free(msg_buffer[i].data);
			msg_buffer[i].data = NULL;
		}

		char *data = malloc(n);
		if (data == NULL) {
			fatal("allocating msg", errno);
		}

		msg_buffer[i].type = DATA;
		msg_buffer[i].data = memcpy(data, buf, n);
		msg_buffer[i].len  = n;
		msg_buffer[i].seq  = seq++;

		if (send_msg(pub, &msg_buffer[i]) < 0) {
			fatal("sending msg", errno);
		}

		if (pthread_mutex_unlock(&msg_buffer_lock) < 0) {
			fatal("error unlocking rwlock", errno);
		}
	}

	msg_t m = {END_OF_SESSION, seq, 0, NULL};

	for (;;) {
		if (send_msg(pub, &m) < 0)
			fatal("sending end of transmission message", errno);
		if (wait_seconds <= 0.0)
			break;
		tv.tv_sec  = shutdown_heartbeat_millis / 1000;
		tv.tv_usec = (shutdown_heartbeat_millis % 1000) * 1000;
		select(0, NULL, NULL, NULL, &tv);
		wait_seconds -= shutdown_heartbeat_millis / 1000.0;
	}

	nn_close(pub);
	nn_close(rep);
	nn_term();

	for (size_t i = 0; i < msg_buffer_len; i++) {
		if (msg_buffer[i].data != NULL)
			free(msg_buffer[i].data);
	}
	free(msg_buffer);
	pthread_mutex_destroy(&msg_buffer_lock);
	pthread_join(rep_thread, NULL);
	return EXIT_SUCCESS;
}
