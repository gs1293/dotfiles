#============================================
#
#  ███████╗███████╗██╗  ██╗██████╗  ██████╗
#  ╚══███╔╝██╔════╝██║  ██║██╔══██╗██╔════╝
#    ███╔╝ ███████╗███████║██████╔╝██║
#   ███╔╝  ╚════██║██╔══██║██╔══██╗██║
#  ███████╗███████║██║  ██║██║  ██║╚██████╗
#  ╚══════╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝
#
#============================================

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/gaurav/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

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
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  colored-man-pages
  zsh-syntax-highlighting
  zsh-autosuggestions
  colorize
  command-not-found
  history
)

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

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias r="ranger"
alias v="vim -O"
alias vd="vimdiff"
alias g="gvim -O"
alias gd="gvimdiff"
alias c="clear"
alias eb="vim ~/.bash_aliases"
alias ev="vim ~/.vimrc"
alias ez="vim ~/.zshrc"
alias ei="vim ~/.inputrc"
alias e3="vim ~/.config/i3/config"
alias p="python3"
alias sz="source ~/.zshrc"
alias pu="sudo apt update -y; sudo apt upgrade -y; sudo apt autoremove -y; sudo apt clean; sudo snap refresh"
alias vu="vim -i NONE -c VundleUpdate -c quitall"
alias in="sudo apt install"

# zsh-history-substring-search

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# neofetch

fzf_find_edit() {
    local file=$(
      fzf --no-multi --preview 'bat --color=always --line-range :500 {}'
      )
    if [ -n "$file" ]; then
        if file --mime-type $file | grep -q pdf$; then
            zathura $file &
        elif file --mime-type $file | grep -q -E "jpg|png"$; then
            feh -x $file &
        else
            vim $file
        fi
    fi
}

alias ffe='fzf_find_edit'

fzf_rg_edit() {
    if [ $# -eq 0 ]; then
        echo 'Error: search term was not provided.'
        return
    fi
    local match=$(rg --color=never --line-number "$1" | fzf --no-multi --delimiter : --preview "bat --color=always --line-range {2}: {1}")
    local file=$(echo "$match" | cut -d':' -f1)
    if [ -n "$file" ]; then
        vim $file +$(echo "$match" | cut -d':' -f2)
    fi
}

alias frge='fzf_rg_edit'

# export LS_COLORS="$(vivid generate molokai)"

alias myban="figlet -ckf slant"

# Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
( cat ~/.cache/wal/sequences & )

function mkcd(){
    mkdir $1
    cd $1
}

function myenc(){
    openssl enc -in $1 -aes-256-cbc -pass stdin -out $2
}

function mydec(){
    openssl enc -in $1 -d -aes-256-cbc -pass stdin -out $2
}
