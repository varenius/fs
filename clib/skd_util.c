#include <stdio.h>	/* standard I/O header file */
#include <errno.h>	/* error number definitions */
#include <limits.h>
#include <signal.h>
#include <sys/types.h>	/* standard data types definitions */
#include <sys/ipc.h>	/* interprocess communications (IPC) header file */
#include <sys/msg.h>	/* message IPC header file */
#include <sys/shm.h>    /* shared memory IPC header file */
#include <memory.h>    /* shared memory IPC header file */
#include <ctype.h>

#define  MAX_BUF       256

struct skd_buf {
	long	mtype;
        struct {
	    long    ip[5];
	    long    rtype;
	    int     dad;
	    char arg[MAX_BUF+1];
        } messg;

} ;

static int msqid;
static long rtype=0;
static int dad=0;
static char prog_name[5];
static long save_ip[5];
static char arg[MAX_BUF+1];
static char *argv[(MAX_BUF+1)/2];
static int  argc = -1;

static long mtype();
static void nullfcn();
void skd_end();

int skd_get( key, size)
key_t key;
int size;
{
struct msqid_ds	str_msqid;  /* message queue id struct */

/* create a message queue */
msqid = msgget( key, ( IPC_CREAT | 0666 ));
if ( msqid == -1 ) {
    perror("skd_get: getting queue");
    return( -1);
}

/* set the queue size */
if (-1== msgctl( msqid, IPC_STAT, &str_msqid )) {
    perror("skd_get: getting status");
    return( -1);
}

str_msqid.msg_qbytes = size;
if(-1 == msgctl( msqid, IPC_SET, &str_msqid )) {
    perror("skd_get: setting size");
    return( -1);
}
fprintf( stdout,"skd_get: id %d\n",msqid);

return( 0);
}

void skd_ini( key)
key_t key;
{
struct skd_buf sched;
int status;

msqid = msgget( key, 0);

if ( msqid == -1 ) {
    perror("skd_ini: translating key");
    exit( -1);
}

waitr:
status = msgrcv( msqid, (struct msgbuf *) &sched, sizeof( sched.messg),
                -LONG_MAX,IPC_NOWAIT|MSG_NOERROR);

if (status != -1)
  goto waitr;
else {
  if (errno == EINTR)
    goto waitr;
  else if (errno != ENOMSG) {
    perror("skd_ini: error cleaning skd queue\n");
    exit( -1);
  }
}
}

void skd_att( key)
key_t key;
{
    msqid = msgget( key, 0);
    if ( msqid == -1 ) {
        perror("skd_att: translating key");
        exit( -1);
    }
}

void skd_run( name, w, ip)
char    name[5], w;
long    ip[5];
{
	    void skd_run_arg();
	    char arg[]= "";
	    
	    skd_run_arg( name, w, ip, arg);
}


void skd_run_arg( name, w, ip, arg)
char	name[5], w, *arg;	
long	ip[5];
{
int	status, i, n;
struct skd_buf sched;

sched.mtype=mtype(name);

for (i=0;i<5;i++) {
   sched.messg.ip[i]=ip[i];
}
if( w == 'w') sched.messg.rtype=(1<<30)|getpid();
else          sched.messg.rtype=0;

sched.messg.dad=getpid();

n=strlen(arg)+1;
n = n > MAX_BUF + 1 ? MAX_BUF + 1: n;
strncpy(sched.messg.arg,arg,n);

waits:
status = msgsnd(msqid, (struct msgbuf *) &sched,
		  sizeof(sched.messg)+strlen(sched.messg.arg)-(MAX_BUF+1), 0 );

if (status == -1) {
  if(errno == EINTR)
    goto waits;
  else {
    fprintf( stderr,"skd_run: msqid %d,",msqid);
    perror(" sending schedule message");
    exit( -1);
  }
}

if(w != 'w') return;

waitr:
status = msgrcv( msqid, (struct msgbuf *) &sched, sizeof(sched.messg),
		 sched.messg.rtype, 0);

if(status == -1) {
  if(errno == EINTR)
    goto waitr;
  else {
    perror("skd_run: receiving return message");
    exit( -1);
  }
}

for (i=0;i<5;i++)
    save_ip[i]=sched.messg.ip[i];

}
void skd_par( ip)
long ip[5];
{
int i;

for (i=0;i<5;i++)
    ip[i]=save_ip[i];

}
void skd_arg(n,buff,len)
char *buff;
int  n,len;
{
  char *ptr;
  int n1;

  if (argc < 0) {
    argc = 0;
    ptr = strtok(arg," ");
    while ( NULL != (argv[argc++] = ptr) ) {
      ptr = strtok(NULL," ");
    }
  }

  if (n < argc && argv[n] != NULL) {
    n1=strlen(argv[n])+1;
    n1 = n1 > len? len: n1;
    strncpy(buff,argv[n],n1);
    if(n1==n && len > 0)
      buff[n-1]='\0';
  } else if (len > 0)
    buff[0]='\0';

}

int skd_chk( name, ip)
char    name[ 5];
long	ip[5];
{
int	status,i;
struct skd_buf	sched;
long    type;
char *s1;


skd_end(ip);

type=mtype(name);
s1=memcpy(prog_name,name,5);

waitr:
status = msgrcv( msqid, (struct msgbuf *) &sched, sizeof( sched.messg),
		type, IPC_NOWAIT);

if(status == -1) {
  if(errno == EINTR)
    goto waitr;
  else if (errno == ENOMSG)
    return 0;
  else {
    perror("skd_chk: receiving message");
    exit( -1);
  }
}

for (i=0;i<5;i++)
    ip[i]=sched.messg.ip[i];

rtype=sched.messg.rtype;

if (getpid() == sched.messg.dad)
  dad=0;
else
  dad=sched.messg.dad;

strcpy(arg,sched.messg.arg);
argc=-1;

return 1;
}

void skd_wait( name, ip, centisec)
char    name[ 5];
unsigned centisec;
long	ip[5];
{
int	status,i;
struct skd_buf	sched;
long    type;
char *s1;


skd_end(ip);

type=mtype(name);
s1=memcpy(prog_name,name,5);

if(centisec !=0) {
  if(signal(SIGALRM,nullfcn) == SIG_ERR){
     fprintf( stderr,"skd_wait: setting up signals\n");
     exit(-1);
  }
  rte_alarm( centisec);
}

waitr:
status = msgrcv( msqid, (struct msgbuf *) &sched, sizeof( sched.messg),
		type, 0);

if (centisec !=0) {
   rte_alarm((unsigned) 0);
   if(signal(SIGALRM,SIG_DFL) == SIG_ERR){
     fprintf( stderr,"skd_wait: setting default signals\n");
     exit(-1);
   }
  centisec=0;
}

if (status == -1) {
  if(errno == EINTR)
    goto waitr;
  else {
    perror("skd_wait: receiving message");
    exit( -1);
  }
}

for (i=0;i<5;i++)
    ip[i]=sched.messg.ip[i];

rtype=sched.messg.rtype;

if (getpid() == sched.messg.dad)
  dad=0;
else
  dad=sched.messg.dad;

strcpy(arg,sched.messg.arg);
argc=-1;

}
void skd_end(ip)
long ip[5];
{
  int i, status;
  struct skd_buf sched;

  if( rtype != 0) {
    for (i=0;i<5;i++) {
      sched.messg.ip[i]=ip[i];
    }
    sched.mtype=rtype;
  waits:
    status = msgsnd( msqid, (struct msgbuf *) &sched, sizeof( sched.messg),
		      0 );
    if (status == -1) {
      if(errno == EINTR)
	goto waits;
      else {
	perror("skd_end: sending termination message");
	exit( -1);
      }
    }
    rtype = 0;
  }
}
void skd_clr( name)
char    name[ 5];
{
int	status;
struct skd_buf	sched;
long    type;
char *s1;

type=mtype(name);

waitr:
status = msgrcv( msqid, (struct msgbuf *) &sched, sizeof( sched.messg),
		type, IPC_NOWAIT);

if(status!=-1)
  goto waitr;
else if(errno == EINTR)
  goto waitr;
else if (errno != ENOMSG) {
  perror("skd_clr: receiving message");
  exit( -1);
}
}

int skd_rel( )
{
int status;
/* release specified shared memory segment */
if(-1==msgctl( msqid, IPC_RMID, 0 )) {
   perror("skd_rel: releasing skd id");
   return( -1);
}
return( 0);
}

static long mtype(name)
char name[5];
{
    int i;
    long val;

    val=0;
    for (i=0;i<5;i++) {
       if(name[i] != ' ' && name[i] != 0 ) {
           val+=(tolower(name[i])-'a')<<(5*i);
       }
    }
    return(val);
}
static void nullfcn(sig)
int sig;
{
    long ip[5];
    int i;
    void skd_run();

    if(signal(sig,SIG_IGN) == SIG_ERR ) {
      perror("nullfcn: error ignoring signal");
      exit(-1);
    }
    for (i=0;i<5;i++) ip[i]=0;

    skd_run(prog_name,'n',ip);

    return;
}
int dad_pid()
{
return(dad);
}
