;;; -*- mode: emacs-lisp; coding: utf-8 -*-

;; (install-elisp-from-emacswiki "redo+.el")

(require 'redo+)

(global-set-key (kbd "C-?") 'redo)

;; 過去の undo が redo されない様にする．
(setq undo-no-redo t)

;; 大量の undo に耐えれるようにする．
(setq undo-limit 60000)
(setq undo-strong-limit 90000)
