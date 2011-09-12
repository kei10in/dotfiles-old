#!/bin/zsh
# -*- coding: utf-8 -*-

##
# Z shell INITIALIZATION FILE
# User preferences file
##


## Set up prompt
autoload -U colors; colors
# [HOSTNAME:CWD] USER_NAME% _
PROMPT="[%{${fg_bold[red]}%}%m:%{$fg_bold[blue]%}%3C%{${reset_color}%}] %n%#%b "
#PROMPT="[%m:%3C] %n%#%b "
PROMPT2="%_ -> "	# if/while prompt
PROMPT3="OK? %r? "	# Spell correction prompt
#SPROMPT="%r is correct? [n,y,a,e]: "
SPROMPT="OK? %r? "


## History
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end 
HISTFILE=~/.zsh_history
HISTSIZE=10000              # Number of commands saved as history
SAVEHIST=10000
setopt hist_ignore_dups     # Ignore duplication command history list
setopt share_history        # Share command history data 

## Word Completions
autoload -U compinit        # Use word completions
compinit
fignore=( \~ .bak .o .bin RCS CVS )
setopt autolist             # Expand history when completing  
setopt recexact             # Correct spelling when completing

## pushd/popd/cd
setopt autocd               # Auto change directory
setopt autopushd            #

## Random
setopt correct
setopt longlistjobs
# setopt rmstarwait         # Wait 10 seconde before doing 'rm *' or 'rm path/*'
setopt ignoreeof            # Don't exit by end of file
