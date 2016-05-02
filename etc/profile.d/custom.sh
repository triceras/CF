MAIN_COLOR="$(tput setaf 1)"
SECONDARY_COLOR="$(tput setaf 3)"
CLEAR_COLOR="$(tput setaf 7)"

PS1="${MAIN_COLOR}[AWS-PROD]${CLEAR_COLOR}\u@\h:\W \$ ${CLEAR_COLOR}"
export PS1

PROMPT_COMMAND='history -a >(tee -a ~/.bash_history | logger -t "$USER[$$] $SSH_CONNECTION")'

shopt -s checkwinsize
shopt -s histappend
export HISTSIZE=10000
export HISTFILESIZE=100000
export HISTTIMEFORMAT="%F %T "
export HISTCONTROL=ignoredups
[ -z "$LESS" ] && export LESS="-M -I -e -j10 -S"

alias cp='cp -i'
alias l.='ls -d .* --color=tty'
alias ll='ls -l --color=tty'
alias ls='ls --color=tty'
alias mv='mv -i'
alias rm='rm -i'
alias which='alias | /usr/bin/which --tty-only --read-alias --show-dot --show-tilde'
umask 0002
