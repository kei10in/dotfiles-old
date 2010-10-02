;;; -*- mode: emacs-lisp; coding: utf-8 -*-

;;;------------------------------------;
;;; Color Configurations
;;;------------------------------------;
;;; Enable syntax highlight
(global-font-lock-mode t)
(require 'font-lock)

;;; Highlight parentheses, braces, brackets.
(show-paren-mode t)

;;; Highlight region
(setq transient-mark-mode nil)

;;; Highlight matches
(setq search-highlight t)

;;; Highlight matches on interactive replace
(setq query-replace-highlight t)
