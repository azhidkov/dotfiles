# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
alias e='emacsclient -t'
alias ec='emacsclient -c'
#alias vim='emacsclient -t'
#alias vi='emacsclient -t'

# Use vim with system clipboard
alias vim='vimx'
alias vi='vimx'

# Disable Software Flow Control (see https://unix.stackexchange.com/questions/72086/ctrl-s-hang-terminal-emulator#72092)
stty -ixon
