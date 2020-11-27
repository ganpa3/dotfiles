# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/ganpa/.oh-my-zsh"

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
# export UPDATE_ZSH_DAYS=13

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
source /home/ganpa/.local/bin/virtualenvwrapper.sh

######################################## TEMPORARY ALIASES ###################################
alias dfg='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
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
##############################################################################################

############################################ ALIASES #########################################
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias x='exit'
alias c='clear'
alias f='nautilus .'
alias s='source ~/.zshrc'
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

## Quickly changing directories
alias CC='cd ~/C++_Programs/'
alias CK='cd ~/Kotlin_Programs/'
alias CS='cd ~/source'

## Updating system
alias um='yay -Syu'
alias uu='sudo apt update && sudo apt upgrade -y' # && sudo apt autoremove && sudo apt clean && rm -rf ~/.cache/thumbnails/*'

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
alias fp='black *.py'
alias fj='npx prettier --write .'

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

g() {
	git add .
	git commit -m "$@"
	git push
}
##############################################################################################
