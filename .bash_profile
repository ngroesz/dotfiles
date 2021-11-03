HISTSIZE=
HISTFILESIZE=

if [ -f $HOME/.bash_aliases ]; then
    . $HOME/.bash_aliases
fi

export PS1="\u \W$ "
export PATH="/usr/local/opt/python/libexec/bin:$PATH"

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
