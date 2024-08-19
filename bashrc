
###########################
# MY MODIFIED BASHRC      #
###########################

# Resolve the absolute path of the script pointed to by BASH_SOURCE: /home/ahmad/config/bashrc
script_path=$(readlink -f "${BASH_SOURCE[0]}")
# Get the directory of the resolved script path: /home/ahmad/config
export CFG_DIR=$(dirname "$script_path")
# The file containing PATH strings
export PATH_SOURCE="$CFG_DIR/.PATH"
# The file containing variables
export CFG_VARIABLES="$CFG_DIR/variables" #FIXME: need consistent name
# The file containing aliases
export CFG_ALIASES="$CFG_DIR/aliases" #FIXME: need consistent name
# The file containing complex functions
export CFG_FUNCTIONS="$CFG_DIR/functions" #FIXME: need consistent name

# The entire bashrc script summarized below in main()
main() {
  #echo -n '' > .output
  run_default
  # move PATH here
  load_variables 2>.output # remove 1 x '>'
  load_aliases 2>>.output
  load_functions 2>>.output
  load_PATH 2>>.output
  run_startup 2>>.output
  terminate # removes .output
}

# default bashrc on debian
run_default() {

  # If not running interactively, don't do anything
  [[ $- != *i* ]] && return

  # don't put duplicate lines or lines starting with space in the history.
  # See bash(1) for more options
  HISTCONTROL=ignoreboth

  # append to the history file, don't overwrite it
  shopt -s histappend
  
  # for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
  HISTSIZE=1000
  HISTFILESIZE=2000

  # check the window size after each command and, if necessary,
  # update the values of LINES and COLUMNS.
  shopt -s checkwinsize

  # set a fancy prompt (non-color, unless we know we "want" color)
  case "$TERM" in
      xterm-color|*-256color) color_prompt=yes;;
  esac

  # uncomment for a colored prompt, if the terminal has the capability
  force_color_prompt=yes

  if [ -n "$force_color_prompt" ]; then
      if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    # We have color support; assume it's compliant with Ecma-48
    # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
    # a case would tend to support setf rather than setaf.)
    color_prompt=yes
      else
    color_prompt=
      fi
  fi
  unset color_prompt force_color_prompt

  # enable color support of ls and also add handy aliases
  if [ -x /usr/bin/dircolors ]; then
      test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
      alias ls='ls --color=auto'
      #alias dir='dir --color=auto'
      #alias vdir='vdir --color=auto'

      #alias grep='grep --color=auto'
      #alias fgrep='fgrep --color=auto'
      #alias egrep='egrep --color=auto'
  fi

  # enable programmable completion features (you don't need to enable
  # this, if it's already enabled in /etc/bash.bashrc and /etc/profile
  # sources /etc/bash.bashrc).
  if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
      . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
      . /etc/bash_completion
    fi
  fi
}

load_variables() {
    if [ -f "$CFG_VARIABLES" ]; then
        source "$CFG_VARIABLES"
        >&2 printf $?
    else
        echo "$0: $CFG_VARIABLES not found."
        >&2 printf 1 # Failure
    fi
}

load_aliases() {
  [ -f "$CFG_ALIASES" ] && source "$CFG_ALIASES" || echo "$0: $CFG_ALIASES not found."
  >&2 printf $?
}

load_functions() {
  [ -f "$CFG_FUNCTIONS" ] && source "$CFG_FUNCTIONS" || echo "$0: $CFG_FUNCTIONS not found."
  >&2 printf $?
}

load_PATH() {
  bin="$HOME/bin" # symlinks to exectuables
  my_scripts="$HOME/scripts"
  local_bin="$HOME/.local/bin"
  snap_bin="/snap/bin"
  export PATH="$bin:$my_scripts:$local_bin:$snap_bin:$PATH"
  >&2 printf $?

  # Check if the file exists
  if [ -f "$PATH_SOURCE" ]; then
      # Read the file, concatenate paths with ':' separator, and store in a variable
      NEW_PATH=$(tr '\n' ':' < "$FILE_PATH" | sed 's/:$//')

      # Update the $PATH environment variable
      export PATH="$NEW_PATH:$PATH"

      # Output the updated PATH for verification
      echo "Updated PATH: $PATH"
  else
      # Print an error message if the file does not exist
      echo "Error: File $FILE_PATH does not exist."
      exit 1
  fi

}

run_startup() {
  if [ -n "$STARTUP_SCRIPT" ]; then source "$STARTUP_SCRIPT"; fi
  >&2 printf $?
}

# outputs and delete ./.output
terminate() {
  x=$(cat '.output')
  rm -f '.output' >/dev/null
  echo "$x"
}

main

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
