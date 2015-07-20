# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

# Colorizing terminal
 
TERM=xterm-color
export LS_OPTS='--color=auto'
alias less='less --RAW-CONTROL-CHARS'
alias grep='grep --color=auto'
alias tree='tree -C -L 2'
alias ls='ls ${LS_OPTS}'
alias ll='ls -lah'
alias lt='ls -lahrt'

PS1='[\u@\e[38;5;30m\h\e[0m \W]\\$ '
