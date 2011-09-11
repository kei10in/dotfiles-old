#!/bin/zsh
# -*- coding: utf-8 -*-

##
# ZSH INITIALIZATION FILE
# Global environment variable setup
##

# export PAGER='lv -Ou8 -c'
export PAGER='less -R'
export EDITOR="emacs"

## man
export MANPATH=/opt/local/share/man:${MANPATH}

## GCC
export CFLAGS=-I/opt/local/include
export CPPFLAGS=${CFLAGS}
export LDFLAGS=-L/opt/local/lib

export C_INCLUDE_PATH=/opt/loca/include
export CPLUS_INCLUDE_PATH=/opt/local/include
export LIBRARY_PATH=/opt/local/lib
export LD_LIBRARY_PATH=/opt/local/lib
export DYLD_FALLBACK_LIBRARY_PATH=/opt/local/lib
export BOOST_ROOT=/opt/local/include


## Grep
export GREP_OPTIONS="-I --color"

## less
export LESSCHARSET=utf-8

## pkg-config
#export PKG_CONFIG_PATH="/usr/local/lib/pkgconfig:/usr/X11R6/lib/pkgconfig"

## CVS
#export CVSROOT=${HOME}/CVS_DB
#export CVSEDITOR="emacs -nw"

## Tcl/Tk
export TCLLIBPATH="~/Library/Tcl/snack2.2"

## Gnuplot
export GNUTERM="aqua"

export XMODSIFIERS=@im=SCIM
export GTK_IM_MODULE=scim
export USE_XOPENIM=t

## Python
# python startup script
export PYTHONSTARTUP=~/.pythonstartup.py
# virtualenv
export WORKON_HOME=${HOME}/.virtualenvs
if VIRTUALENVWRAPPER=`which virtualenvwrapper.sh` ; then
	source ${VIRTUALENVWRAPPER}
fi
