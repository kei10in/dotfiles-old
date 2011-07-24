;;; -*- mode: emacs-lisp; coding: utf-8 -*-

;;; init-hl-line.el --- line highlight setting

;; Copyright (C) 2010  Keisuke Ijuin

;; Author: Keisuke Ijuin <kei10in@gmail.com>
;; Keywords: emacs.el hl-line-mode

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


;;;--------------------------------------------------------------------;
;;; line highlight
;;; The possible attributes are `:family', `:width', `:height',
;;; `:weight', `:slant', `:underline', `:overline', `:strike-through',
;;; `:box', `:foreground', `:background', `:stipple', `:inverse-video',
;;; and `:inherit'.
;;;--------------------------------------------------------------------;


(require 'hl-line)
(global-hl-line-mode)
(custom-set-faces 
 '(hl-line
   ((((class color)
      (background dark))
     (:background "#222244"))
    (((class color)
      (background light))
     (:background "LightSteelBlue1")))))


(provide 'init-hl-line)
;;; init-hl-line.el ends here
