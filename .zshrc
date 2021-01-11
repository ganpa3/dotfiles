# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ALTS : amuse, 
ZSH_THEME="robbyrussell"
#ZSH_THEME="amuse"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=130

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


##############################################################################################
# Custom Commands below
export PYTHON_KEYRING_BACKEND=keyring.backends.null.Keyring
reset-cursor() {
  printf '\033]50;CursorShape=1\x7'
}
export PATH="$HOME/bin:$HOME/.cargo/bin:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:/tmp/rust_install_w3id_45r/bin:$PATH"
export PS1="$(reset-cursor)$PS1"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
setopt rm_star_silent
ulimit -s 512000
export BROWSER='/usr/bin/google-chrome-stable'
fpath+=${ZDOTDIR:-~}/.zsh_functions
if [[ -f $HOME/.local/bin/virtualenvwrapper.sh ]]; then
    source $HOME/.local/bin/virtualenvwrapper.sh
fi

######################################## TEMPORARY ALIASES ###################################
# Vagrant aliases
alias VH="vagrant halt"
alias VR="vagrant reload"
alias VS="vagrant ssh"
alias VU="vagrant up && vagrant ssh"

alias rg="rg -g '!locale/**' -g '!docs/**' -g '!corporate/**' -g'!frontend_tests/**' -g '!templates/**' -g '!zerver/migrations/**'"
alias play='ffplay -nodisp -autoexit -loglevel quiet'
alias sudo='sudo '
alias vbt='nvim /home/ganpa/source/Bodhitree-Scrapper/bt-scrapper.py'
alias sbt='subl /home/ganpa/source/Bodhitree-Scrapper/bt-scrapper.py'
alias flake8='flake8 --ignore=E501'
alias own='sudo chown -R ganpa:ganpa'
alias bt='python3 /home/ganpa/source/Bodhitree-Scrapper/bt-scrapper.py'
COLOR_DIR="/home/ganpa/source/alacritty-theme/themes"
LIGHT_COLOR="papercolor_light.yaml"
# alias a="alacritty-colorscheme -C $COLOR_DIR"
# alias day="alacritty-colorscheme -C $COLOR_DIR -a $LIGHT_COLOR"
# alias night="alacritty-colorscheme -C $COLOR_DIR -a $DARK_COLOR"
alert() { 
    sleep $1
    ffplay -nodisp -autoexit -loglevel quiet /usr/share/sounds/gnome/default/alerts/drip.ogg
    notify-send --urgency=critical "Hello!"
}
##############################################################################################

############################################ ALIASES #########################################
alias ll='ls -alF'
alias la='ls -A'
alias s='ls -A'
alias sl='ls -A'
alias l='ls -CF'
alias x='exit'
#alias c='clear'
alias f='nautilus .'
alias so='source ~/.zshrc'
# alias r='rm *.out'
alias pipu='pip3 list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1 | xargs -n1 pip3 install -U'
alias chrome='/opt/google/chrome/chrome'
alias v='nvim'
alias spd='systemctl suspend'
alias y='youtube-dl -o "~/Videos/%(title)s.%(ext)s"'
alias ys='youtube-dl --all-subs -o "~/Videos/%(title)s/%(title)s.%(ext)s"'
alias emcc='~/source/emsdk/upstream/emscripten/emcc'
alias empp='~/source/emsdk/upstream/emscripten/em++'
alias path='readlink -f'
alias redshift='redshift -O 2600'

## Managing dotfiles
alias dfg='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias dfgs='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME status'
alias dfga='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME add -f'
alias dfgc='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME commit -m "Changed"'
alias dfgp='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME push origin main'

## Quickly changing directories
alias CC='cd ~/C++_Programs/'
alias CK='cd ~/Kotlin_Programs/'
alias CS='cd ~/source/'
alias CP='cd ~/Python_Programs/mysite'
alias CZ='cd ~/source/zulip'
alias CW='cd ~/webdev'
alias CD='cd ~/Downloads'
alias CD='cd ~/Downloads'

## Opening config files
alias brc='nvim ~/.bashrc'
alias zrc='nvim ~/.zshrc'
alias rrc='nvim ~/.config/regolith/i3/config'
alias irc='nvim ~/.config/i3/config'
alias vrc='nvim ~/.vimrc'
alias nrc='nvim ~/.config/nvim/init.vim'
alias arc='nvim ~/.config/alacritty/alacritty.yml'
# With Sublime text
alias sirc='subl ~/.config/i3/config'
alias szrc='subl ~/.zshrc'
alias sbrc='subl ~/.bashrc'
alias srrc='subl ~/.config/regolith/i3/config'
alias svrc='subl ~/.vimrc'
alias snrc='subl ~/.config/nvim/init.vim'
alias sarc='subl ~/.config/alacritty/alacritty.yml'
# With Sublime text
alias circ='code ~/.config/i3/config'
alias czrc='code ~/.zshrc'
alias cbrc='code ~/.bashrc'
alias crrc='code ~/.config/regolith/i3/config'
alias cvrc='code ~/.vimrc'
alias cnrc='code ~/.config/nvim/init.vim'
alias carc='code ~/.config/alacritty/alacritty.yml'

## Toggle webcam
alias disable_wc='sudo modprobe -r uvcvideo'
alias enable_wc='sudo modprobe uvcvideo'
##############################################################################################

#######################################Custom Functions ######################################
i() {
    if [[ -f /etc/pacman.conf ]]; then # Arch-based
        sudo pacman -S --noconfirm "$@"
    elif [[ -e /etc/apt ]]; then
    	sudo apt-get install -y "$@"
    fi
}

r() {
	if [[ $# -eq 0 ]]; then
		rm *.out
    elif [[ -f /etc/pacman.conf ]]; then # Arch-based
    	sudo pacman -Rs --noconfirm "$@"
    elif [[ -e /etc/apt ]]; then
    	sudo apt-get purge "$@"
    fi
}

u() {
    if [[ -f /etc/pacman.conf ]]; then # Arch-based
        yay -Syu --noconfirm
    elif [[ -e /etc/apt ]]; then
        sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y && sudo apt clean && rm -rf ~/.cache/thumbnails/* # Debian-based
    fi
}

ff() {
    if [ $# -eq 0 ]; then
        clang-format -i -style="{BasedOnStyle: google, IndentWidth: 4}" *.cpp
    else
        clang-format -i -style="{BasedOnStyle: google, IndentWidth: 4}" $@
    fi
}

fj() {
    if [ $# -eq 0 ]; then
        prettier --config $HOME/.config/.prettierrc.json --write .
    else
        prettier --config $HOME/.config/.prettierrc.json --write $@
    fi
}

fp() {
    if [ $# -eq 0 ]; then
        black --line-length 100 *.py
    else
        black --line-length 100 $@
    fi
}

wifi() {
    if [ $# -eq 0 ]; then
        nmcli r wifi off && sleep 3 && nmcli r wifi on && sleep 3 && nmcli con up GaneshP
    else
        nmcli r wifi off && sleep 3 && nmcli r wifi on && sleep 3 && nmcli con up $1
    fi
}

c() {
    if [ $# -ne 0 ]; then
        filename=$1
        filenameWithoutExt="${filename%.*}"
        g++ -DGANPA -Wall -Wextra -pedantic -std=c++17 -O2 -Wshadow -Wformat=2 -Wfloat-equal -Wconversion -o $filenameWithoutExt.out $filename
    else
        clear
    fi
}

t() {
    filename="$1"
    filenameWithoutExt=${filename%.*}
    g++ -std=c++17 -O2 test.cpp -o test.out && ./test.out < input > o2
    g++ -std=c++17 -O2 $filename -o $filenameWithoutExt.out && ./$filenameWithoutExt.out < input > o1

    res=$(diff -q -w o1 o2)
    if [[ $(echo $?) == 1 ]]; then
    	echo "The input is:"
    	cat input
    	echo "Your output: "
    	cat o1
    	echo "Actual output: "
    	cat o2
        echo ""
    fi
}

tt() {
    filename="$1"
    filenameWithoutExt=${filename%.*}
    g++ -std=c++17 -O2 test.cpp -o test.out
    g++ -std=c++17 -O2 $filename -o $filenameWithoutExt.out

    for i in 0 1 2 3 4; do
        g++ -std=c++17 -O2 tc.cpp -o tc.out && ./tc.out > input
        ./test.out < input > o2
        ./$filenameWithoutExt.out < input > o1
        res=$(diff -q -w o1 o2)
        if [[ $(echo $?) == 1 ]]; then
        	echo "The input is:"
        	cat input
        	echo "Your output: "
        	cat o1
        	echo "Actual output: "
        	cat o2
            echo ""
        fi
    done
}

mkcd () { mkdir -p $1 && cd $1; }

m() { mv "$@" ~/C++_Programs/Competitive-Programming/Codeforces/; }

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
