;;; -*- mode: emacs-lisp; coding: utf-8 -*-

;;; init-term.el --- Emacs inner terminal setting

;; Copyright (C) 2010  Keisuke Ijuin

;; Author: Keisuke Ijuin <kei10in@gmail.com>
;; Keywords: emacs.el term multi-term

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

(require 'init-package)

;;;
;;; Term mode
;;; http://sakito.jp/emacs/emacsshell.html
;;;

(require 'multi-term)

(defvar my-term-default-bg-color (face-background 'default))
(defvar my-term-default-fb-color (face-foreground 'default))
(setq term-default-bg-color 'my-term-default-bg-color)
(setq term-default-fg-color 'my-term-default-fg-color)



(provide 'init-term)
;;; init-term.el ends here
