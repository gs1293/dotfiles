#====================================================
#
#  ██████╗  █████╗ ███████╗██╗  ██╗██████╗  ██████╗
#  ██╔══██╗██╔══██╗██╔════╝██║  ██║██╔══██╗██╔════╝
#  ██████╔╝███████║███████╗███████║██████╔╝██║
#  ██╔══██╗██╔══██║╚════██║██╔══██║██╔══██╗██║
#  ██████╔╝██║  ██║███████║██║  ██║██║  ██║╚██████╗
#  ╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝
#
#====================================================

alias v="vim -O"

alias vd="vimdiff"

alias g="gvim -O"

alias gd="gvimdiff"

alias c="clear"

alias r="ranger"

alias eb="vim ~/.bash_aliases"

alias ev="vim ~/.vimrc"

alias ei="vim ~/.inputrc"

alias eg="vim ~/.gitconfig"

alias e3="vim ~/.config/i3/config"

alias p="python3"

alias sb="source ~/.bashrc"

alias sz="source ~/.zshrc"

alias pu="sudo apt update -y; sudo apt upgrade -y; sudo apt autoremove -y; sudo snap refresh"

alias ..='cd ..'
alias ..2='..; ..'
alias ..3='..2; ..'
alias ..4='..3; ..'
alias ..5='..4; ..'

# setxkbmap -option ctrl:nocaps
# xcape -e 'Control_L=Escape'

# neofetch

# Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
(cat ~/.cache/wal/sequences &)
