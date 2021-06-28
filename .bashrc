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
reset-cursor() {
  printf '\033]50;CursorShape=1\x7'
}
export PS1="$(reset-cursor)$PS1"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="/tmp/rust_install_w3id_45r/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH=$PATH":$HOME/bin"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
ulimit -s 512000
export BROWSER='/usr/bin/google-chrome-stable'
fpath+=${ZDOTDIR:-~}/.zsh_functions
#source /home/ganpa/.local/bin/virtualenvwrapper.sh

######################################## TEMPORARY ALIASES ###################################
alias play='ffplay -nodisp -autoexit -loglevel quiet'
alias sudo='sudo '
alias vbt='nvim /home/ganpa/source/Bodhitree-Scrapper/bt-scrapper.py'
alias sbt='subl /home/ganpa/source/Bodhitree-Scrapper/bt-scrapper.py'
alias flake8='flake8 --ignore=E501'
alias own='sudo chown -R ganpa:ganpa'
alias wifi='nmcli r wifi off && sleep 5 && nmcli r wifi on && sleep 5 && nmcli con up GaneshP'
alias bt='python3 /home/ganpa/source/Bodhitree-Scrapper/bt-scrapper.py'
alias q='sudo apt-get install --mark-auto -y'
COLOR_DIR="/home/ganpa/source/alacritty-theme/themes"
LIGHT_COLOR="papercolor_light.yaml"
alias a="alacritty-colorscheme -C $COLOR_DIR"
alias day="alacritty-colorscheme -C $COLOR_DIR -a $LIGHT_COLOR"
alias night="alacritty-colorscheme -C $COLOR_DIR -a $DARK_COLOR"

function alert () {
    sleep $1
    ffplay -nodisp -autoexit -loglevel quiet /usr/share/sounds/gnome/default/alerts/drip.ogg
    notify-send --urgency=critical "Hello"
}
##############################################################################################

############################################ ALIASES #########################################
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias x='exit'
alias c='clear'
alias f='nautilus .'
alias r='rm *.out'
alias pipu='pip3 list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1 | xargs -n1 pip3 install -U'
alias chrome='/opt/google/chrome/chrome'
alias v='nvim'
alias spd='systemctl suspend'
alias y='youtube-dl -o "~/Videos/%(title)s.%(ext)s"'
alias ys='youtube-dl --all-subs -o "~/Videos/%(title)s/%(title)s.%(ext)s"'
alias emcc='~/source/emsdk/upstream/emscripten/emcc'
alias em++='~/source/emsdk/upstream/emscripten/em++'
alias path='readlink -f'
alias redshift='redshift -O 2600'

## Managing dotfiles
alias dfg='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias dfgs='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME status'
alias dfga='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME add'
alias dfgc='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME commit -m "Changed"'
alias dfgp='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME push origin main'

## Quickly changing directories
alias CC='cd ~/C++_Programs/'
alias CK='cd ~/Kotlin_Programs/'
alias CS='cd ~/source'

## Updating system
alias um='yay -Syu'
alias uu='sudo apt update && sudo apt upgrade -y && sudo apt autoremove && sudo apt clean && rm -rf ~/.cache/thumbnails/*'

## Opening config files
alias brc='nvim ~/.bashrc'
alias zrc='nvim ~/.zshrc'
alias uirc='nvim ~/.config/regolith/i3/config'
alias irc='nvim ~/.config/i3/config'
alias vrc='nvim ~/.vimrc'
alias nrc='nvim ~/.config/nvim/init.vim'
alias arc='nvim ~/.config/alacritty/alacritty.yml'
# With Sublime text
alias sirc='subl ~/.config/i3/config'
alias szrc='subl ~/.zshrc'
alias sbrc='subl ~/.bashrc'
alias suirc='subl ~/.config/regolith/i3/config'
alias svrc='subl ~/.vimrc'
alias snrc='subl ~/.config/nvim/init.vim'
alias sarc='subl ~/.config/alacritty/alacritty.yml'

## Formatting files
alias ff='clang-format -i -style="{BasedOnStyle: google, IndentWidth: 4}" *.cpp'
alias fp='black --line-length 100 *.py'
alias fj='npx prettier --write .'

## Toggle webcam
alias disable_wc='sudo modprobe -r uvcvideo'
alias enable_wc='sudo modprobe uvcvideo'
##############################################################################################

#######################################Custom Functions ######################################
t() {
    filename=$1
    filenameWithoutExt=${filename%.*}
    g++ -std=c++17 test.cpp -o test.out && ./test.out < input.txt > o2.txt
    g++ -std=c++17 $filename -o $filenameWithoutExt.out && ./$filenameWithoutExt.out < input.txt > o1.txt
    diff -q -w o1.txt o2.txt
}

tt() {
    for i in 0 1 2 3 4
    do
    	run tc.cpp > input.txt
    	t $1
        ret=$(diff -q -w o1.txt o2.txt)
        if [[ $(echo $?) == 1 ]]; then
        	echo "The input is:"
        	cat input.txt
        	echo "Your output: "
        	cat o1.txt
        	echo "Actual output: "
        	cat o2.txt
            echo ""
        fi
    done
}

mkcd () { mkdir -p $1 && cd $1; }

m() { mv $1 ~/C++_Programs/Competitive-Programming/Codeforces/; }

mf() { 
    filename="$@"
    filename="${filename// /_}"
    cp ~/C++_Programs/Competitive-Programming/template.cpp "$filename.cpp"; 
}

mft() { 
    filename="$@"
    filename="${filename// /_}"
    cp ~/C++_Programs/Competitive-Programming/templatewithtc.cpp "$filename.cpp"; 
}

run() {
    filename=$1
    filenameWithoutExt="${filename%.*}"
    filetype="$(echo $filename | cut -d'.' -f2)"

    case $filetype in
	    cpp | cc)
	        g++ -DGANPA -Wall -Wextra -pedantic -std=c++17 -O2 -Wshadow -Wformat=2 -Wfloat-equal -Wconversion -o $filenameWithoutExt.out $filename && ./$filenameWithoutExt.out |& tee output.txt
	        ;;
	    py)
	        python3 $filename
	        ;;

	    kt)
	        kotlinc $filename -include-runtime -d $filenameWithoutExt.jar && java -jar $filenameWithoutExt.jar
	        ;;
    esac
}

cpa() {
    filename=$1
    filenameWithoutExt="${filename%.*}"
    filetype="$(echo $filename | cut -d'.' -f2)"

    case $filetype in
	    cpp | cc)
	        g++ -DGANPA -Wall -Wextra -pedantic -std=c++17 -O2 -Wshadow -Wformat=2 -Wfloat-equal -Wconversion -Wlogical-op -Wshift-overflow=2 -Wduplicated-cond -Wcast-qual -Wcast-align -D_GLIBCXX_DEBUG -D_GLIBCXX_DEBUG_PEDANTIC -D_FORTIFY_SOURCE=2 -fsanitize=address -fsanitize=undefined -fno-sanitize-recover -fstack-protector -o $filenameWithoutExt.out $filename && ./$filenameWithoutExt.out |& tee output.txt
	        ;;
	    py)
	        python3 $filename
	        ;;
	    kt)
	        kotlinc $filename -include-runtime -d $filenameWithoutExt.jar && java -jar $filenameWithoutExt.jar
	        ;;
    esac
}

cc() {
    filename=$1
    filenameWithoutExt="${filename%.*}"
	
	g++ -DGANPA -Wall -Wextra -pedantic -std=c++17 -O2 -Wshadow -Wformat=2 -Wfloat-equal -Wconversion -Wlogical-op -Wshift-overflow=2 -Wduplicated-cond -Wcast-qual -Wcast-align -D_GLIBCXX_DEBUG -D_GLIBCXX_DEBUG_PEDANTIC -D_FORTIFY_SOURCE=2 -fsanitize=address -fsanitize=undefined -fno-sanitize-recover -fstack-protector -o $filenameWithoutExt.out $filename
}

server() {
    if [[ $# -eq 0 ]]; then
        http-server --port 8000
    else
        http-server --port $1
    fi
}
##############################################################################################
source "$HOME/.cargo/env"
. "$HOME/.cargo/env"
