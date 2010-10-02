;; -*- mode: Emacs-Lisp; coding: utf-8 -*-


;;;
;;; Term mode
;;; http://sakito.jp/emacs/emacsshell.html
;;;

(defvar my-term-default-bg-color (face-background 'default))
(defvar my-term-default-fb-color (face-foreground 'default))
(custom-set-variables
 '(term-default-bg-color 'my-term-default-bg-color)
 '(term-default-fg-color 'my-term-default-fg-color))

(require 'multi-term)
