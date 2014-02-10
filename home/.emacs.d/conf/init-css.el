;;; -*- mode: emacs-lisp; coding: utf-8 -*-

;;; init-css.el --- css-mode setting

;; Copyright (C) 2010  Keisuke Ijuin

;; Author: Keisuke Ijuin <kei10in@gmail.com>
;; Keywords: emacs.el css-mode

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


(provide 'init-css)
;;; init-css.el ends here
