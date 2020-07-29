# Last two dirs (not working on new versions of bash)
# export MYPS='$(echo -n "${PWD/#$HOME/~}" | awk -F "/" '"'"'{
#   if (length($0) > 14) {
#     if (NF>2)
#       print  ".../" $(NF-1) "/" $NF;
#     else print $1 "/.../" $NF;
#     }
#   else print $0;
# }'"'"')'
#
# PS1='$(eval "echo ${MYPS}") $ '
function short_path() {
  local IFS=/ P=${PWD#?} F
  for F in $P; do echo -n /${F::1}; done
  [[ $P ]] || echo -n /
  echo -n ${F:1}
}
export PS1='${debian_chroot:+($debian_chroot)}\[\033[01;34m\]`short_path`\[\033[00m\] \$ '
export PS2="> "

# Everybody prefers 'mcd' to do this
function mcd() {
  mkdir -p "$@"
  cd "$@"
}
export -f mcd
export MANPATH=$MANPATH

# This waits for all makes to finish including gmake
function waitformake(){
echo "Waiting for make"
  while :
  do
    COUNT=$(ps axu | sed 's|.*-- ||g' | grep make | grep -v grep | wc -l)
    if [ $COUNT -eq 0 ]; then
      break
    else
      sleep 5
    fi
  done
  echo "Done waiting for make"
}

# This function waits for the folder to be created and then opens it
function cdw(){
  if [ "$#" -ne "1" ]; then
    echo "Usage: cdw <folder>"
    return
  fi

  echo "Waiting for $@"
  while :
  do
    if [ -d "$@" ]; then
      break
    else
      sleep 5
    fi
  done
  echo "Opening $@"
  cd "$@"
}

# This function sets the title for the tmux pane
win_title() {
  if [ "$#" -ne "1" ]; then
    echo "Usage: win_title <filename>"
    return
  fi
  # set xterm title (and tmux pane title)
  PROMPT_COMMAND="echo -ne \"\033]0;$1\007\""
}

colors_tmux() {
  if [ -z $1 ]; then
    BREAK=1
  else
    BREAK=$1
  fi
  for i in {0..255} ; do
    printf "\x1b[38;5;${i}mcolour${i} \t"
    if [ $(( i % $BREAK )) -eq $(($BREAK-1)) ] ; then
      printf "\n"
    fi
  done
}

# This function waits for the file to exist and then opens it
function svim(){
  if [ "$#" -ne "1" ]; then
    echo "Usage: svim <filename>"
    return
  fi

  echo "Waiting for file..."
  while :
  do
    if [ -f "$@" ]; then
      break
    else
      sleep 5
    fi
  done
  echo "Found file. Opening..."
  sleep 1
  vim "$@"
}

# This function waits for a file to exist and then exits
function fwait() {
  if [ "$#" -ne "1" ]; then
    echo "Usage: fwait <filename>"
    return
  fi

  echo "Waiting for file..."
  while :
  do
    if [[ -f "$@" || -d "$@" ]]; then
      break
    else
      sleep 5
    fi
  done
  echo "Found file."
  sleep 1
}

# Find a file and open in vim
function vgfind(){
  gvim -p $(find -iname "$@")

}
export -f vgfind
function vfind(){
  vim -p $(find -iname "$@")

}
export -f vfind

# quick find: executes find with iname
function qfind(){
  find -iname "*$@*"
}
export -f qfind

# Repeat command till successful
function do_while(){
  while :
  do
    $1 "${@:2}"  && break
  sleep 5
  done
}
export -f do_while

# Refresh DISPLAY env
function refresh() {
  export $(tmux show-environment | grep DISPLAY)
}
export -f refresh

function u() {
  cd $(printf "%0.s../" $(seq 1 $1 ));
}
export -f u

# Stopwatch function
function stopwatch() {
local BEGIN=$(date +%s)

while true; do
  local NOW=$(date +%s)
  local DIFF=$(($NOW - $BEGIN))
  local MINS=$(($DIFF / 60 % 60))
  local SECS=$(($DIFF % 60))
  local HOURS=$(($DIFF / 3600 % 24))
  local DAYS=$(($DIFF / 86400))
  local DAYS_UNIT
  [ "$DAYS" == 1 ] && DAYS_UNIT="Day" || DAYS_UNIT="Days"

  printf "\r  %d %s, %02d:%02d:%02d  " $DAYS $DAYS_UNIT $HOURS $MINS $SECS
  sleep 0.25
done
}
export -f stopwatch

# BASH History hacks
export HISTCONTROL=ignoreboth:erasedups
shopt -s histappend
export HISTFILESIZE=10000
export HISTSIZE=10000
export HISTIGNORE='ls:bg:fg:history:df:clear:pwd'

# Custom per-device bashrc
if [ -f $HOME/.bashrc.custom ]; then
  . $HOME/.bashrc.custom
fi

# Aliases
if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi
# Custom per-device aliases
if [ -f ~/.bash_aliases_custom ]; then
  . ~/.bash_aliases_custom
fi

# Default Editor Settings
export EDITOR=vim
export VISUAL=vim

# Bash vi bindings
set -o vi

# shopt Settings
# shopt -q -s cdspell      # Correct dir spellings
shopt -q -s checkwinsize # Make sure display get updated when terminal window get resized
# shopt -q -s extglob      # Turn on the extended pattern matching features
# shopt -q -s cmdhist      # Make multi-line commandsline in history
# shopt -q -s nocaseglob
# shopt -q -s nocasematch  #
# set -o notify            # Get immediate notification of background job termination

# Bash completion for git
if [ -f /etc/bash_completion.d/git ]; then
  source /etc/bash_completion.d/git
fi
