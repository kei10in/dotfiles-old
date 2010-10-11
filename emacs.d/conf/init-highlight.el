;;; -*- mode: emacs-lisp; coding: utf-8 -*-

;;;------------------------------------;
;;; Color Configurations
;;;------------------------------------;
;;; Enable syntax highlight
(global-font-lock-mode t)
(require 'font-lock)

;;; Highlight parentheses, braces, brackets.
;;; You can use C-M-p or C-M-n to jump to corresponding paren
(show-paren-mode t)
;; カッコ対応表示のスタイル
;; カッコその物に色が付く(デフォルト)
;; (setq show-paren-style 'parenthesis)
;; カッコ内に色が付く
;; (setq show-paren-style 'expression)
;; 画面内に収まる場合はカッコのみ、画面外に存在する場合はカッコ内全体に色が付く
;; (setq show-paren-style 'mixed)

;;; Highlight region
(setq transient-mark-mode nil)

;;; Highlight matches
(setq search-highlight t)

;;; Highlight matches on interactive replace
(setq query-replace-highlight t)
