;;; -*- mode: emacs-lisp; coding: utf-8 -*-

;;; init-highlight.el --- emacs global highlighting setting

;; Copyright (C) 2010  Keisuke Ijuin

;; Author: Keisuke Ijuin <kei10in@gmail.com>
;; Keywords: emacs.el

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


(provide 'init-highlight)
;;; init-highlight.el ends here
