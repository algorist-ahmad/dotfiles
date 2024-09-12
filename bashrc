###########################
# MY MODIFIED BASHRC      #
###########################

# Logs directory
export LOGS="$HOME/logs"
# Logs destination
export LOGFILE="$HOME/logs/bashrc.log"
# .env source file
export ENV="$HOME/.env"
# .aliases source file
export ALS="$HOME/.aliases"
# .PATH source file
export PATH_SOURCE="$HOME/.PATH"

# Resolve the absolute path of the script pointed to by BASH_SOURCE: /home/ahmad/config/bashrc
script_path=$(readlink -f "${BASH_SOURCE[0]}")
# Get the directory of the resolved script path: /home/ahmad/config
export CFG_DIR=$(dirname "$script_path")
# The file containing complex functions
CFG_FUNCTIONS="$CFG_DIR/functions"

# The entire bashrc script summarized below in main()
main() {
    run_default
    check_logs_dir_exists
    read_env              2>>"$LOGFILE"
    read_aliases          2>>"$LOGFILE"
    load_functions        2>>"$LOGFILE"
    read_PATH             2>>"$LOGFILE"
    run_startup_script    2>>"$LOGFILE"
    update_repos          2>>"$LOGFILE" # TODO:
    echo -e "\033[1;32mSuccess:\033[0m \033[1mScript\033[0m \033[33m${script_path}\033[0m \033[1mcompleted.\033[0m \033[3mSee results in:\033[0m \033[33m${LOGFILE}\033[0m\n"
}

check_logs_dir_exists() {
    # Check if the directory exists
    if [ ! -d "$LOGS" ]; then
        # Directory does not exist, so create it
        mkdir -p "$LOGS"
        echo "Created directory: $LOGS" > "$LOGFILE"
    else
        # Directory exists
        echo "Directory already exists: $LOGS" > "$LOGFILE"
    fi
}

read_env() {
    # Check if the .env file exists
    if [ ! -f "$ENV" ]; then
        echo "Warning: $ENV does not exist. Create one." # | tee -a /dev/stderr
	sleep 99
    fi
    
    # Read the .env file line by line
    while IFS= read -r line; do
        # Ignore empty lines
        if [[ -n "$line" ]]; then
            # Remove comments (everything after a #)
            line=$(echo "$line" | sed 's/#.*//')

            # Trim leading and trailing whitespace
            line=$(echo "$line" | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')

            # Skip empty lines after trimming
            if [[ -n "$line" ]]; then
                # Export environment variables
                # Use `eval` to ensure correct handling of quotes and special characters
                eval export "$line"
                >&2 echo "$line"
            fi
        fi
    done < "$ENV"
}

read_aliases() {
    # Check if the file exists
    if [ ! -f "$ALS" ]; then
        echo "Warning: $ALS does not exist. Create one." | tee -a /dev/stderr
	sexit 1
    fi

    # Create a temporary file to store alias commands
    local temp_file=$(mktemp)

    # Read the file line by line
    while IFS= read -r line; do
        # Ignore empty lines and comments
        if [[ -n "$line" && ! "$line" =~ ^# ]]; then
            # Remove comments (everything after a #)
            line=$(echo "$line" | sed 's/#.*//')

            # Trim leading and trailing whitespace
            line=$(echo "$line" | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')

            # Skip empty lines after trimming
            if [[ -n "$line" ]]; then
                # Prepend 'alias ' to each line and write to the temp file
                echo "alias $line" >> "$temp_file"
            fi
        fi
    done < "$ALS"

    # Source the temp file to set aliases in the current shell
    # Note: This will only work if the function is run in the current shell session
    >&2 cat "$temp_file"
    source "$temp_file"

    # Clean up
    rm "$temp_file"
}

read_PATH() {
    # Check if the file exists
    if [ -f "$PATH_SOURCE" ]; then
        # Read the file, concatenate paths with ':' separator, and store in a variable
        NEW_PATH=$(tr '\n' ':' < "$PATH_SOURCE" | sed 's/:$//')

        # Update the $PATH environment variable
        export PATH="$NEW_PATH:$PATH"
        >&2 echo "Updated PATH: $PATH"
    else
        # Print an error message if the file does not exist
        echo "Warning: File $PATH_SOURCE does not exist. Create one." | tee -a /dev/stderr
	sexit 1
    fi
}

load_functions() {
  [ -f "$CFG_FUNCTIONS" ] && source "$CFG_FUNCTIONS" || echo "$0: $CFG_FUNCTIONS not found."
  >&2 echo "loaded functions"
}

run_startup_script() {
    if [ -n "$STARTUP_SCRIPT" ]; then
        source "$STARTUP_SCRIPT"
        >&2 echo $?
    else
        >&2 echo "No startup script detected."
    fi
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

sexit() {
	echo "Terminating..."
	sleep 99
	return "$1"
}

main
