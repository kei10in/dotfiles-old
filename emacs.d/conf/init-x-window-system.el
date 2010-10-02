;; -*- mode: emacs-lisp; coding: utf-8 -*-
;;
;; Japanese Enviroment Configuration
;;
;;   [Character Code]-[Line Feed Code]
;;
;;   Character Code: sjis, euc-jp, utf-8
;;   Line Feed Code: unix, dos, mac
;;

;; (require 'un-define)
;; (require 'jisx0213)
;; (set-language-environment 'Japanese)

(when (string-match current-language-environment "Japanes")
  (set-default-coding-systems 'utf-8)
  (set-keyboard-coding-system 'utf-8)
  (set-clipboard-coding-system 'utf-8)
  (set-terminal-coding-system 'utf-8)
  (set-buffer-file-coding-system 'utf-8)
  (setq file-name-coding-system 'utf-8))

;; (add-hook 'set-language-environment-hook 
;; 	  (lambda ()
;; 	    (when (equal "ja_JP.UTF-8" (getenv "LANG"))
;; 	      (setq default-process-coding-system '(utf-8 . utf-8))
;; 	      (setq default-file-name-coding-system 'utf-8))
;; 	    (when (equal "Japanese" current-language-environment)
;; 	      (setq default-buffer-file-coding-system 'iso-2022-jp))))

;; (set-language-environment "Japanese")


;;; Anthy
(require 'anthy)
;(set-language-info "Japanese" 'input-method "japanese-anthy")
(setq anthy-wide-space " ")
(anthy-change-hiragana-map "," "，")
(anthy-change-hiragana-map "." "．")


;; Use Mouse Wheel
(mouse-wheel-mode t)
(setq mouse-wheel-follow-mouse t)
