#!/bin/zsh
# -*- coding: utf-8 -*-

##
# Z shell INITIALIZATION FILE
#
##

##
# NOTICE:
#   Launched as login shell
#     1) ~/.zshenv
#     2) ~/.zprofile
#     3) ~/.zshrc
#     4) ~/.zlogin
#   Launched as interactive shell (not as login shell)
#     1) ~/.zshenv
#     2) ~/.zshrc
#   Execute zsh script
#     1) ~/.zshenv
#   Logout zsh launched as login shell
#     1) ~/.zlogout
##

zsh_initdir=~/.zsh

if [ -f "${zsh_initdir}" ]; then
fi

host=`hostname`
host=`echo $host | tr A-Z a-z`

user=`whoami`

export HOST="${host}"
export USER="${user}"

# User ID
if [ -z $uid ]; then
    uid=`id | cut -d = -f 2 | cut -d \( -f 1`
fi

# MISCELLANEOUS SETS
if [ -z $version ]; then
    verion="unknown"
fi

# Non-root users
if [ ! $uid ]; then
    unset autologout
else
  # Avoid closing of Terminal windows when logged in as root
    if [ -n "${TERM_PROGRAM}" -a -n "${SHLVL}" ]; then
	    if [ "$SHLVL" -eq "1" ]; then
	        unset autologout
	    fi
    fi
fi

## ENVIRONMENT SETUP
interactive=1

if [ -r ${zsh_initdir}/path ]; then 
    source ${zsh_initdir}/path
fi

if [ -r ${zsh_initdir}/zsh ]; then
    source ${zsh_initdir}/zsh
fi

if [ -z ${ENV_SET} ]; then   # Top-most shell
    if [ -r ${zsh_initdir}/environment ] && [ -n $PROMPT -o -n $XSESSION ]; then
	    source ${zsh_initdir}/environment
    fi
else                       # NON ENV_SET, 2nd+ shells
    #noop
fi

## DEFAULT KEY BINDINGS
if [ -n $interactive ]; then
    
fi

## DEFAULT LOGIN SOURCES
#if [ -r ${zsh_initdir}/zsh ]; then
#    source ${zsh_initdir}/zsh
#fi

if [ -n $interactive ]; then
  # These aren't useful for non-interactive sessions
    if [ -r ${zsh_initdir}/aliases ] && [ -z $noalias ]; then
	    source ${zsh_initdir}/aliases
    fi
    if [ -r ${zsh_initdir}/completions ] && [ -z $noalias ]; then
	    source ${zsh_initdir}/completions
    fi
fi

export MANPATH="${HOME}/man:/usr/local/share/man:/usr/local/man/ja_JP.eucJP:/usr/local/man:/usr/share/man"
