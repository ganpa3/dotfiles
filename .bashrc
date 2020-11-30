# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

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

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

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

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
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
######################################ALACRITTY###############################################
# Load completion function
complete -F _alacritty alacritty

# Completion function
_alacritty()
{
    local cur prev prevprev opts
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    prevprev="${COMP_WORDS[COMP_CWORD-2]}"
    opts="-h --help -V --version --live-config-reload --no-live-config-reload --persistent-logging --print-events -q -qq -v -vv -vvv --ref-test --hold -e --command --config-file -d --dimensions --position -t --title --embed --class --working-directory"

    # If `--command` or `-e` is used, stop completing
    for i in "${!COMP_WORDS[@]}"; do
        if [[ "${COMP_WORDS[i]}" == "--command" ]] \
            || [[ "${COMP_WORDS[i]}" == "-e" ]] \
            && [[ "${#COMP_WORDS[@]}" -gt "$(($i + 2))" ]]
        then
            return 0
        fi
    done

    # Make sure the Y dimension isn't completed
    if [[ "${prevprev}" == "--dimensions" ]] || [[ "${prevprev}" == "-d" ]]; then
        return 0
    fi

    # Match the previous word
    case "${prev}" in
        --command | -e)
            # Complete all commands in $PATH
            COMPREPLY=( $(compgen -c -- "${cur}") )
            return 0;;
        --config-file)
            # Path based completion
            local IFS=$'\n'
            compopt -o filenames
            COMPREPLY=( $(compgen -f -- "${cur}") )
            return 0;;
        --dimensions | -d | --class | --title | -t)
            # Don't complete here
            return 0;;
        --working-directory)
            # Directory completion
            local IFS=$'\n'
            compopt -o filenames
            COMPREPLY=( $(compgen -d -- "${cur}") )
            return 0;;
    esac

    # Show all flags if there was no previous word
    COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
    return 0
}
##############################################################################################

# Custom Commands below
export PATH="/tmp/rust_install_w3id_45r/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH=$PATH":$HOME/bin"
export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
export VIRTUALENVWRAPPER_VIRTUALENV_ARGS=' -p /usr/bin/python3 '
export PROJECT_HOME=$HOME/Devel
source /usr/local/bin/virtualenvwrapper.sh
ulimit -s 512000

############################################ ALIASES #########################################
alias sudo='sudo '
alias ils='logo-ls'
alias ila='logo-ls -A'
alias ill='logo-ls -al'
alias CC='cd ~/Desktop/C++_Programs/'
alias x='exit'
alias c='clear'
alias f='nautilus .'
alias ff='clang-format -i *.cpp'
alias fp='black *.py'
alias brc='nvim ~/.bashrc'
alias s='source ~/.bashrc'
alias r='rm *.out'
alias ivim='sudo dpkg -i /home/ganpa/GitHub/vim/vim_20201013-1_amd64.deb'
alias pipu='pip3 list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1 | xargs -n1 pip3 install -U'
alias vimrc='nvim ~/.vimrc'
alias nvimrc='nvim ~/.config/nvim/init.vim'
##############################################################################################

#######################################Custom Functions ######################################
function t() {
    filename=$1
    filenameWithoutExt=${filename%.*}
    g++ test.cpp -o test.out && ./test.out < input.txt > o2.txt
    g++ $filename -o $filenameWithoutExt.out && ./$filenameWithoutExt.out < input.txt > o1.txt
    diff -w o1.txt o2.txt
}
function y() {
    for url
    do youtube-dl -o '~/Videos/%(title)s.%(ext)s' "$url"
    done
}
function ys() {
    for url
    do youtube-dl --all-subs -o '~/Videos/%(title)s/%(title)s.%(ext)s' "$url"
    done
}

u() { sudo apt update; sudo apt upgrade -y; sudo apt autoremove; sudo apt clean; rm -rf ~/.cache/thumbnails/*; }
m() { mv $1 ~/Desktop/C++_Programs/Competitive-Programming/Codeforces/; }

function mf() { 
    filename="$@"
    filename="${filename// /_}"
    cp ~/Desktop/C++_Programs/Competitive-Programming/template.cpp "$filename.cpp"; 
}

function mft() { 
    filename="$@"
    filename="${filename// /_}"
    cp ~/Desktop/C++_Programs/Competitive-Programming/templatewithtc.cpp "$filename.cpp"; 
}

cpa() {
    filename=$1
    filenameWithoutExt=${filename%.*}
    g++ -DGANPA -Wall -Wextra -pedantic -std=c++17 -O2 -Wshadow -Wformat=2 -Wfloat-equal -Wconversion -Wlogical-op -Wshift-overflow=2 -Wduplicated-cond -Wcast-qual -Wcast-align -D_GLIBCXX_DEBUG -D_GLIBCXX_DEBUG_PEDANTIC -D_FORTIFY_SOURCE=2 -fsanitize=address -fsanitize=undefined -fno-sanitize-recover -fstack-protector -o $filenameWithoutExt.out $filename && time ./$filenameWithoutExt.out |& tee output.txt
}

run() {
    filename=$1
    filenameWithoutExt=${filename%.*}
    g++ -DGANPA -Wall -Wextra -pedantic -std=c++17 -O2 -Wshadow -Wformat=2 -Wfloat-equal -Wconversion -o $filenameWithoutExt.out $filename && time ./$filenameWithoutExt.out |& tee output.txt
}

v() {
    nvim $@
}
##############################################################################################

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
