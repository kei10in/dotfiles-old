#!/bin/zsh
# -*- coding: utf-8 -*-

##
# ZSH INITIALIZATION FILE
# Global path setup
##

# Zsh function path
fpath=(~/.zsh/site-functions/ ${fpath})


# To prevent duplicated path
typeset -U path

# Setting Generic PATH
path=(
    .
    {~,~/usr}/bin(N-/)
    {~,~/usr}/sbin(N-/)
    {/opt/local,/opt,/usr/local,/usr,}/bin(N-/)
    {/opt/local,/opt,/usr/local,/usr,}/sbin(N-/)
    /usr/X11R6/bin(N-/)
    ${path}
    )
    

# Setting PATH for MacPorts Python 2.7
if [ -d /opt/local/Library/Frameworks/Python.framework/Versions/2.7/bin ]; then
    path=( ${path} /opt/local/Library/Frameworks/Python.framework/Versions/2.7/bin )
fi

# Setting PATH for Python 2.7
if [ -d /Library/Frameworks/Python.framework/Versions/2.7/bin ]; then
    path=( ${path} /Library/Frameworks/Python.framework/Versions/2.7/bin )
fi

# Setting PATH for Python 3.2
if [ -d /opt/local/Library/Frameworks/Python.framework/Versions/3.2/bin ]; then
    path=( ${path} /opt/local/Library/Frameworks/Python.framework/Versions/3.2/bin )
fi

# Setting PATH for Python 3.2
if [ -d /Library/Frameworks/Python.framework/Versions/3.2/bin ]; then
    path=( ${path} /Library/Frameworks/Python.framework/Versions/3.2/bin )
fi

# Setting PATH for Python 3.3
if [ -d /Library/Frameworks/Python.framework/Versions/3.3/bin ]; then
    path=( ${path} /Library/Frameworks/Python.framework/Versions/3.3/bin )
fi

# Platform oriented path
case "${OSTYPE}" in
    linux*)
        ;;
    darwin*)
        ;;
    cygwin*)
        ;;
esac
