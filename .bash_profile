# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
        . ~/.bashrc
fi

## Set umask default to group RW to facilitate code sharing
umask 002

# User specific environment and startup programs
JAVA_HOME=/opt/jdk1.7.0_71

PATH=$JAVA_HOME/bin:$HOME/node-v0.12.7-linux-x64/bin:/usr/local/python3.4/bin:$HOME/bin:$HOME/scripts:$PATH
export PATH

EDITOR=/usr/bin/vim
alias vi='/usr/bin/vim'

export GREP_OPTIONS='--color=auto'
