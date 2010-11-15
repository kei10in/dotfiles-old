;;; -*- mode: emacs-lisp; coding: utf-8 -*-

;;; init-x-window-system.el --- X11 system dependent setting

;; Copyright (C) 2010  Keisuke Ijuin

;; Author: Keisuke Ijuin <kei10in@gmail.com>
;; Keywords: emacs.el XWindowSystem

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; 

;;; Code:

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


(provide 'init-x-window-system)
;;; init-x-window-system.el ends here
