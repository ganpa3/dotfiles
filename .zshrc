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
#DISABLE_AUTO_UPDATE="true"

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
plugins=(git sublime vi-mode forgit)

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
export EDITOR="/usr/local/bin/nvim"

paths_to_add=(
    /usr/local/opt/postgresql@14/bin
    $HOME/bin
    $HOME/.local/bin
    $HOME/.yarn/bin
    $HOME/go/bin
    $HOME/.config/yarn/global/node_modules/.bin
    /usr/local/go/bin
    $PATH
    )
export PATH=$(IFS=:; echo "${paths_to_add[*]}")

fpath+=${ZDOTDIR:-~}/.zsh_functions
######################################## TEMPORARY ALIASES ###################################
COLOR_DIR="/home/ganpa/source/alacritty-theme/themes"
LIGHT_COLOR="papercolor_light.yaml"
# alias a="alacritty-colorscheme -C $COLOR_DIR"
# alias day="alacritty-colorscheme -C $COLOR_DIR -a $LIGHT_COLOR"
# alias night="alacritty-colorscheme -C $COLOR_DIR -a $DARK_COLOR"
##############################################################################################

############################################ ALIASES #########################################
alias ll='ls -alF'
alias la='ls -A'
alias sl='ls -A'
alias s='ls -A'
alias l='ls -CF'

alias x='exit'

alias so='source ~/.zshrc'
alias pipu='pip3 list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1 | xargs -n1 pip3 install -U'

# Neovim shortcuts
alias v='nvim -p'
alias vv='nvim --noplugin'
alias vvv='nvim -u NONE'

# youtube-dl shortcuts
alias y='youtube-dl --restrict-filenames -o "~/Videos/%(title)s.%(ext)s"'
alias ys='youtube-dl --restrict-filenames --all-subs -o "~/Videos/%(title)s/%(title)s.%(ext)s"'
alias song='youtube-dl --restrict-filenames --extract-audio --audio-format mp3 -o "~/Music/%(title)s.%(ext)s"'

alias path='readlink -f'

## Quickly changing directories
alias CC='cd ~/C++_Programs/'
alias CS='cd ~/source/'
alias CB='cd ~/bin/'
alias CP='cd ~/Python_Programs/mysite'
alias CW='cd ~/source/wazir'
alias CD='cd ~/Downloads'
alias CD='cd ~/Downloads'
alias CV='cd ~/Videos'
alias CM='cd ~/Music'

## Opening config files
alias brc='nvim ~/.bashrc'
alias zrc='nvim ~/.zshrc'
alias vrc='nvim ~/.vimrc'
alias nrc='nvim ~/.config/nvim/init.lua'
alias arc='nvim ~/.config/alacritty/alacritty.yml'

# With Sublime text
alias szrc='subl ~/.zshrc'
alias sbrc='subl ~/.bashrc'
alias svrc='subl ~/.vimrc'
alias snrc='subl ~/.config/nvim/init.vim'
alias sarc='subl ~/.config/alacritty/alacritty.yml'

# With Sublime text
alias czrc='code ~/.zshrc'
alias cbrc='code ~/.bashrc'
alias cvrc='code ~/.vimrc'
alias cnrc='code ~/.config/nvim/init.vim'
alias carc='code ~/.config/alacritty/alacritty.yml'

## Update git fork. Requires oh-my-zsh.
alias gu='gcm && gl'
##############################################################################################

###################################### Custom Functions ######################################
gub() {
    # Array of git branches
    BRANCHES=("${(@f)$(git branch --format='%(refname:short)')}")

    MAIN_BRANCH="master"

    for branch in $BRANCHES; do
        if [[ "$branch" != "$MAIN_BRANCH" ]]; then
            echo -n "Update branch \"$branch\"? (Press 'd' to delete) "

            read -k 1 CHOICE
            if [[ "$CHOICE" = "Y" || "$CHOICE" = "y" ]]; then
                echo
                echo
                echo \*\* Updating branch: $branch

                git checkout "$branch" && git rebase "$MAIN_BRANCH" && ggf
            elif [[ "$CHOICE" = "D" || "$CHOICE" = "d" ]]; then
                echo
                echo
                echo \*\* Deleting branch: $branch

                git branch -D $branch
            else
                echo
                echo
            fi
            echo "================================================================================"
        fi
    done
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

t() {
    filename="$1"
    filenameWithoutExt=${filename%.*}
    g++ -std=c++17 -O2 -w test.cpp -o test.out && ./test.out < input > o2
    g++ -std=c++17 -O2 $filename -o $filenameWithoutExt.out && ./$filenameWithoutExt.out < input > o1

    res=$(diff -q -w o1 o2)
    if [[ $(echo $?) == 1 ]]; then
        diff o1 o2
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
            diff o1 o2
            echo ""
            exit
        fi
    done
}

mkcd () { mkdir -p $1 && cd $1; }

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
        printf '\033[2J\033[3J\033[1;1H'
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

vg() {
    rg $@ -l | xargs nvim -p
}

cg() {
    rg $@ -l | xargs code
}

pg() {
    rg $@ -l | xargs pycharm
}

# source ~/source/forgit/forgit.plugin.zsh

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Macbook specific
alias cs="cd ~/source/summon-platform && source venv/bin/activate"
alias cw="cd ~/source/web-feature-platform"
alias python="python3.8"
alias pip="pip3.8"
alias brew="arch -x86_64 brew"

# see `man dyld` for details
dynamic_library_paths_to_add=(
    /usr/local/opt/openssl/lib
    )
export DYLD_LIBRARY_PATH=$(IFS=:; echo "${dynamic_library_paths_to_add[*]}")

export LDFLAGS="-L/usr/local/opt/openssl/lib"
export CPPFLAGS="-I/usr/local/opt/openssl/include"
alias psql="psql -U django -p 6432"
alias rg="rg -g '!**/migrations/' -g '!**/tests/' --type-not po"
alias rrg="/usr/local/bin/rg"
alias rd="python manage.py runserver"
