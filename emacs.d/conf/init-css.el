;; -*- mode: emacs-lisp ; coding: utf-8 -*-

;;;-----------------------;
;;; CSS Mode
;;;-----------------------;
;(autoload 'css-mode "css-mode")
(require 'css-mode)
(setq auto-mode-alist (cons '("\\.css$" . css-mode) auto-mode-alist))
(setq cssm-indent-function #'cssm-c-style-indenter)
(setq cssm-indent-level 2)
(setq cssm-mirror-mode nil)
(setq cssm-newline-before-closing-bracket t)
