#!/bin/zsh
# -*- coding: utf-8 -*-

##
# Z shell INITIALIZATION FILE
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

if [ -r ~/.zsh/zshrc ]; then
    source ~/.zsh/zshrc
fi

if [ -r ~/.zsh/site-zshrc ]; then
    source ~/.zsh/site-zshrc
fi
