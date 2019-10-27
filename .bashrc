#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#PS1='\[\e[1;32m\][\u@\h \W]\$\[\e[0m\] '
PS1='\[\e[1;32m\][\u@\h \e[0;37m\]\W\e[1;32m\]]\$\[\e[0m\] '

[ -r /etc/DIR_COLORS ] && eval `dircolors /etc/DIR_COLORS`

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias diff='colordiff'

shopt -s histappend  #Avoid overwritting history file

HISTSIZE=5000        #History lenght of actual session
HISTFILESIZE=5000    #File history lenght


# Colored Man Pages
man() {
 env \
 LESS_TERMCAP_mb=$(printf "\e[1;31m") \
 LESS_TERMCAP_md=$(printf "\e[1;31m") \
 LESS_TERMCAP_me=$(printf "\e[0m") \
 LESS_TERMCAP_se=$(printf "\e[0m") \
 LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
 LESS_TERMCAP_ue=$(printf "\e[0m") \
 LESS_TERMCAP_us=$(printf "\e[1;32m") \
 man "$@"
}
