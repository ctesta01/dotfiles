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
alias ls='ls -G'
alias ll='ls -lah'
alias lah='ls -lah'
alias lt='ls -lahrt'
alias lahrt='ls -lahrt'
alias pw='python -m SimpleHTTPServer'
alias ipgrep='grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"'

PS1='[\u@\e[38;5;30m\h\e[0m \W]\\$ '

export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd

if [ -e /usr/share/terminfo/78/xterm-256color ]; then
        export TERM='xterm-256color'
else
        export TERM='xterm-color'
fi

