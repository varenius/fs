#Per shell, not just login shell, commands go here in ~/.bashrc
#bash specifc login shell commands go in ~/.bashrc_profile
#Most login shell commands go in ~/.profile
#
# Not group or world writeable by default for AUID
umask 022
# use physical directories
set -o physical
set -o noclobber
set -o ignoreeof
#no aliases for non-interactive shells
[ -z "$PS1" ] && return
alias a=alias
a una=unalias
a cls=clear
a h=history
a j=jobs
a lo=logout
a lower='tr "[A-Z]" "[a-z]"'
a lsf='ls -CF'
a ll='ls -l'
lt() {
  ls -lt "$@"|less
}
last() {
  ls -lt "$@"|head
}
a psall='ps aux | egrep -v "^(root|Debian-\+ |message\+ |daemon|rtkit|ntp|colord|lp)"'
a pu=pushd
a po=popd
a d=dirs
a cp='cp -i'
a mv='mv -i'
a rm='rm -i'
a rl='. ~/.bash_profile'
a rp='. ~/.profile'
a rc='. ~/.bashrc'
a rlxr='xrdb -merge ~/.Xresources'
