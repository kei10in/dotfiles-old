#!/usr/bin/env bash

# Use [SPACE] instead of [IDEOGRAPHIC SPACE] in Kotoeri
defaults write com.apple.inputmethod.Kotoeri zhsy -dict-add " " -bool no
killall Kotoeri
