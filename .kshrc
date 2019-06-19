HISTFILE="$HOME/.ksh_history"
HISTSIZE=1000

#set -o emacs
#set -o emacs
alias __A=$(print '\0020') # ^P = up = previous command
alias __B=$(print '\0016') # ^N = down = next command
alias __C=$(print '\0006') # ^F = right = forward a character
alias __D=$(print '\0002') # ^B = left = back a character
alias __H=$(print '\0001') # ^A = home = beginning of line

stty -ixon

# This line overwrite emacs mode defined above
export EDITOR=vim

export GOPATH=$HOME/go
export GOBIN=$HOME/go/bin
export GPG_TTY=$(tty)

PATH=$PATH:$HOME/.local/bin:$HOME/bin:/usr/local/go/bin:$GOBIN
export PATH

# TODO continue later
# if [[ $(uname) == "Linux" ]]; then
# echo "this is fedora"
# fi
