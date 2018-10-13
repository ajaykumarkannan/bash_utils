# Command Prompt
export MYPS='$(echo -n "${PWD/#$HOME/~}" | awk -F "/" '"'"'{
  if (length($0) > 14) {
    if (NF>2)
      print  ".../" $(NF-1) "/" $NF;
    else print $1 "/.../" $NF;
    }
  else print $0;
}'"'"')'

PS1='$(eval "echo ${MYPS}") $ '

# Everybody prefers 'mcd' to do this
function mcd() {
	mkdir -p "$@"
	cd "$@"
}
export -f mcd
export MANPATH=$MANPATH

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
    fi
    sleep 5
  done
  echo "Found file. Opening..."
  sleep 1
  gvim "$@"
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
    fi
    sleep 5
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

# BASH History hacks
export HISTCONTROL=ignoreboth:erasedups
shopt -s histappend
export HISTFILESIZE=10000
export HISTSIZE=10000
export HISTIGNORE='ls:bg:fg:history:df:clear:pwd'

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
export VISUAL="gvim --nofork"

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

