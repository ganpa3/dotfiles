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
#ZSH_THEME="random"

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
DISABLE_AUTO_UPDATE="true"

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
plugins=(git sublime vi-mode)

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
export EDITOR="/usr/bin/nvim"
export PYTHON_KEYRING_BACKEND=keyring.backends.null.Keyring
export DENO_INSTALL="/home/ganpa/.deno"
reset-cursor() {
  printf '\033]50;CursorShape=1\x7'
}

export PATH="/usr/local/texlive/2020/bin/x86_64-linux:$PATH"
export PATH="$HOME/bin:$HOME/.cargo/bin:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:/usr/local/go/bin:/tmp/rust_install_w3id_45r/bin:$PATH"
export PATH="$DENO_INSTALL/bin:$PATH"

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
alias bt='/home/ganpa/bin/btt | tee /tmp/bt'
lc() {
    clang-tidy --checks='*,-llvm-header-guard,-google-build-using-namespace,-clang-analyzer-alpha.clone.CloneChecker,-google-runtime-int,-cppcoreguidelines-pro-bounds-array-to-pointer-decay,-clang-analyzer-alpha.deadcode.UnreachableCode,-misc-use-after-move,-cppcoreguidelines-pro-type-vararg,-modernize-use-emplace,-cert-err60-cpp,-llvmlibc-implementation-in-namespace,-modernize-use-trailing-return-type,-llvmlibc-callee-namespace' $@ -- --std=c++17
}

alias rd='(sudo service postgresql status > /dev/null || ./tools/wsl/start_services) && ./tools/run-dev.py --skip-provision-check --enable-tornado-logging'

# Vagrant aliases
alias VH="vagrant halt"
alias VR="vagrant reload"
alias VS="vagrant ssh"
alias VU="vagrant up && vagrant ssh"

alias rg="rg -g '!node_modules/**' -g '!locale/**' -g '!docs/**' -g '!corporate/**' -g'!frontend_tests/**' -g '!zerver/migrations/**' -g '!zerver/tests/**' -g '!templates/**' -g '!*.md' -g '!*.svg'"
alias play='ffplay -nodisp -autoexit -loglevel quiet'
alias sudo='sudo '
alias vbt='nvim /home/ganpa/source/Bodhitree-Scrapper/bt-scrapper.py'
alias sbt='subl /home/ganpa/source/Bodhitree-Scrapper/bt-scrapper.py'
alias flake8='flake8 --ignore=E501'
alias own='sudo chown -R ganpa:ganpa'
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
alias ts='tsc --target "ES2020"'
##############################################################################################

############################################ ALIASES #########################################
# Check if a command exists.
check_if_exists() {
    command -v $1 > /dev/null 2>&1
}
# Replace UNIX commands with modern replacements. Modern, they say.
alias ls='check_if_exists exa && exa || ls --color=tty'
alias la='check_if_exists exa && exa --all || ls --color=tty -A'
alias s='la'
alias sl=ls
alias ll='check_if_exists exa && exa --all --long || ls --color=tty -alF'
alias l='ll'
alias du='check_if_exists dust && dust || du -h'
alias cat='check_if_exists batcat && batcat || cat'
alias find='check_if_exists fdfind && fdfind || find'

alias x='exit'
alias f='nautilus .'

alias so='source ~/.zshrc'
alias pipu='pip3 list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1 | xargs -n1 pip3 install -U'
alias chrome='/opt/google/chrome/google-chrome'
alias spd='systemctl suspend'

# Neovim shortcuts
alias v='nvim'
alias vv='nvim --noplugin'
alias vvv='nvim -u NONE'

# youtube-dl shortcuts
alias y='youtube-dl --restrict-filenames -o "~/Videos/%(title)s.%(ext)s"'
alias ys='youtube-dl --restrict-filenames --all-subs -o "~/Videos/%(title)s/%(title)s.%(ext)s"'
alias song='youtube-dl --restrict-filenames --extract-audio --audio-format mp3 -o "~/Music/%(title)s.%(ext)s"'

alias emcc='~/source/emsdk/upstream/emscripten/emcc'
alias empp='~/source/emsdk/upstream/emscripten/em++'
alias path='readlink -f'
alias redshift='redshift -O 2600'
alias open='xdg-open'
# Make feh work with many image formats. Requires imagemagick.
alias feh='feh --conversion-timeout 1'

## Managing dotfiles
alias dfg='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias dfgs='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME status'
alias dfga='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME add'
alias dfgc='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME commit -m "Changed"'
alias dfgp='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME push origin'
alias dfgm='dfg checkout minimal && dfg ls-files | xargs git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME co main --'

## Quickly changing directories
alias CC='cd ~/C++_Programs/'
alias CK='cd ~/Kotlin_Programs/'
alias CS='cd ~/source/'
alias CB='cd ~/bin/'
alias CP='cd ~/Python_Programs/mysite'
alias CZ='cd ~/source/zulip'
alias CN='cd ~/source/nand2tetris'
alias CW='cd ~/webdev'
alias CD='cd ~/Downloads'
alias CD='cd ~/Downloads'
alias CV='cd ~/Videos'
alias CT='cd ~/Music/github-timeline/src'
alias CA='cd ~/apps'
alias CM='cd ~/Music'
alias CR='cd ~/rust_programs/src'

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

## Update git fork. Requires oh-my-zsh.
alias gu='gcm && gf upstream && grb upstream/"$(git_main_branch)" && ggp'
##############################################################################################

###################################### Custom Functions ######################################
i() {
    if [[ -f /etc/pacman.conf ]]; then # Arch-based
        sudo pacman -S --noconfirm "$@"
    elif [[ -e /etc/apt ]]; then # Debian-based
    	sudo apt-get install -y "$@"
    fi
}

r() {
	if [[ $# -eq 0 ]]; then
		rm *.out
    elif [[ -f /etc/pacman.conf ]]; then # Arch-based
    	sudo pacman -Rs --noconfirm "$@"
    elif [[ -e /etc/apt ]]; then # Debian-based
    	sudo apt-get remove -y "$@"
    fi
}

u() {
    if [[ -f /etc/pacman.conf ]]; then # Arch-based
        yay -Syu --noconfirm
    elif [[ -e /etc/apt ]]; then # Debian-based
        sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y && sudo apt clean
    fi
}

ff() {
    if [ $# -eq 0 ]; then
        clang-format -i --style=file --fallback-style=google *.cpp
    else
        clang-format -i --style=file --fallback-style=google $@
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
        nmcli r wifi off && sleep 1 && nmcli r wifi on && sleep 1 && nmcli con up GaneshP
    else
        nmcli r wifi off && sleep 1 && nmcli r wifi on && sleep 1 && nmcli con up $1
    fi
}

t() {
    filename="$1"
    filenameWithoutExt=${filename%.*}
    g++ -std=c++17 -O2 -w test.cpp -o test.out && ./test.out < input > o2
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
    g++ -std=c++17 -O2 -w test.cpp -o test.out
    g++ -std=c++17 -O2 $filename -o $filenameWithoutExt.out
    g++ -std=c++17 -O2 tc.cpp -o tc.out

    for i in {1..10}; do
        ./tc.out > input
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

run() {
    filename=$1
    filenameWithoutExt="${filename%.*}"
    filetype="$(echo $filename | cut -d'.' -f2)"
    shift

    case $filetype in
	    cpp | cc)
	        g++ -DGANPA -Wall -Wextra -pedantic -std=c++17 -O2 -Wshadow -Wformat=2 -Wfloat-equal -Wconversion -Wlogical-op -Wshift-overflow=2 -Wduplicated-cond -Wcast-qual -Wcast-align -o $filenameWithoutExt.out $filename && ./$filenameWithoutExt.out $@ |& tee output.txt
	        ;;
	    c)
	        gcc -DGANPA -Wall -Wextra -pedantic -std=c17 -O2 -Wshadow -Wformat=2 -Wfloat-equal -Wconversion -Wlogical-op -Wshift-overflow=2 -Wduplicated-cond -Wcast-qual -Wcast-align -o $filenameWithoutExt.out $filename && ./$filenameWithoutExt.out $@
	        ;;
	    py)
	        python3 $filename $@
	        ;;
        rs)
            rustc -A unused_imports -A unused_must_use --edition=2018 -O --verbose -o $filenameWithoutExt.out $filename && ./$filenameWithoutExt.out $@
            ;;
	    kt)
	        kotlinc $filename -include-runtime -d $filenameWithoutExt.jar && java -jar $filenameWithoutExt.jar $@
	        ;;
    esac
}

c() {
    if [ $# -ne 0 ]; then
        filename=$1
        filenameWithoutExt="${filename%.*}"
        filetype="$(echo $filename | cut -d'.' -f2)"

        case $filetype in
	        cpp | cc)
	            g++ -DGANPA -Wall -Wextra -pedantic -std=c++17 -O2 -Wshadow -Wformat=2 -Wfloat-equal -Wconversion -Wlogical-op -Wshift-overflow=2 -Wduplicated-cond -Wcast-qual -Wcast-align -o $filenameWithoutExt.out $filename
	            ;;
	        c)
	            gcc -DGANPA -Wall -Wextra -pedantic -std=c17 -O2 -Wshadow -Wformat=2 -Wfloat-equal -Wconversion -Wlogical-op -Wshift-overflow=2 -Wduplicated-cond -Wcast-qual -Wcast-align -o $filenameWithoutExt.out $filename
	            ;;
	        py)
	            python3 $filename $@
	            ;;
            rs)
                rustc --edition=2018 -O --verbose -o $filenameWithoutExt.out $filename
                ;;
	        kt)
	            kotlinc $filename -include-runtime -d $filenameWithoutExt.jar
	            ;;
        esac
    else
        clear
    fi
}

cpa() {
    filename=$1
    filenameWithoutExt="${filename%.*}"
    filetype="$(echo $filename | cut -d'.' -f2)"
    shift

    case $filetype in
	    cpp | cc)
	        g++ -DGANPA -Wall -Wextra -pedantic -std=c++17 -O2 -Wshadow -Wformat=2 -Wfloat-equal -Wconversion -Wlogical-op -Wshift-overflow=2 -Wduplicated-cond -Wcast-qual -Wcast-align -D_GLIBCXX_DEBUG -D_GLIBCXX_DEBUG_PEDANTIC -D_FORTIFY_SOURCE=2 -fsanitize=address -fsanitize=undefined -fno-sanitize-recover -fstack-protector -o $filenameWithoutExt.out $filename && ./$filenameWithoutExt.out $@ |& tee output.txt
	        ;;
	    c)
	        gcc -DGANPA -Wall -Wextra -pedantic -std=c17 -O2 -Wshadow -Wformat=2 -Wfloat-equal -Wconversion -Wlogical-op -Wshift-overflow=2 -Wduplicated-cond -Wcast-qual -Wcast-align -D_GLIBCXX_DEBUG -D_GLIBCXX_DEBUG_PEDANTIC -D_FORTIFY_SOURCE=2 -fsanitize=address -fsanitize=undefined -fno-sanitize-recover -fstack-protector -o $filenameWithoutExt.out $filename && ./$filenameWithoutExt.out $@
	        ;;
        rs)
            rustc --edition=2018 -O --verbose -o $filenameWithoutExt.out $filename && ./$filenameWithoutExt.out $@
            ;;
	    py)
	        python3 $filename $@
	        ;;
	    kt)
	        kotlinc $filename -include-runtime -d $filenameWithoutExt.jar && java -jar $filenameWithoutExt.jar $@
	        ;;
    esac
}

cc() {
    filename=$1
    filenameWithoutExt="${filename%.*}"
    filetype="$(echo $filename | cut -d'.' -f2)"

    case $filetype in
	    cpp | cc)
	        g++ -DGANPA -Wall -Wextra -pedantic -std=c++17 -O2 -Wshadow -Wformat=2 -Wfloat-equal -Wconversion -Wlogical-op -Wshift-overflow=2 -Wduplicated-cond -Wcast-qual -Wcast-align -D_GLIBCXX_DEBUG -D_GLIBCXX_DEBUG_PEDANTIC -D_FORTIFY_SOURCE=2 -fsanitize=address -fsanitize=undefined -fno-sanitize-recover -fstack-protector -o $filenameWithoutExt.out $filename
	        ;;
	    c)
	        gcc -DGANPA -Wall -Wextra -pedantic -std=c17 -O2 -Wshadow -Wformat=2 -Wfloat-equal -Wconversion -Wlogical-op -Wshift-overflow=2 -Wduplicated-cond -Wcast-qual -Wcast-align -D_GLIBCXX_DEBUG -D_GLIBCXX_DEBUG_PEDANTIC -D_FORTIFY_SOURCE=2 -fsanitize=address -fsanitize=undefined -fno-sanitize-recover -fstack-protector -o $filenameWithoutExt.out $filename
	        ;;
        rs)
            rustc --edition=2018 -O --verbose -o $filenameWithoutExt.out $filename
            ;;
	    kt)
	        kotlinc $filename -include-runtime -d $filenameWithoutExt.jar
	        ;;
    esac
}

server() {
    if [[ $# -eq 0 ]]; then
        http-server --port 8000
    else
        http-server --port $1
    fi
}
