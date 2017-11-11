# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/.local/bin:$HOME/bin

export PATH

# set up command prompt in Terminal.app
if [[ "$OSTYPE" == "darwin"* ]]; then
    export PS1="\u@\W$ "
fi
