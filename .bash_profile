# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

export GOPATH=$HOME/go
export GOBIN=$HOME/go/bin
export GPG_TTY=$(tty)

PATH=$PATH:$HOME/.local/bin:$HOME/bin:/usr/local/go/bin:$GOBIN
export PATH

# set up command prompt in Terminal.app
if [[ "$OSTYPE" == "darwin"* ]]; then
    export PS1="\u@\W$ "
fi
