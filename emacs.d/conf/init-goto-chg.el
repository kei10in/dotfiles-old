;;; -*- mode: emacs-lisp; coding: utf-8 -*-

(require 'goto-chg)

(global-set-key (kbd "C-.") 'goto-last-change)
(global-set-key (kbd "C-,") 'goto-last-change-reverse)
