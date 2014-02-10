;;; -*- mode: emacs-lisp; coding: utf-8 -*-

;;; init-java.el --- Java major mode

;; Copyright (C) 2010  Keisuke Ijuin

;; Author: Keisuke Ijuin <kei10in@gmail.com>
;; Keywords: emacs.el java-mode cc-mode

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
;;;   Java
;;;-----------------------;
;; (add-to-list 'load-path "~/.emacs.d/site-lisp/jde/lisp/")
;; (autoload 'jde-mode "jde" "Java Development Environment for Emacs." t)
;; (setq auto-mode-alist 
;; 	  (append '(("\\.java$" . jde-mode)) auto-mode-alist))
;; (add-hook 'jde-mode-hook
;;           '(lambda ()
;;              (setq c-basic-offset 2)
;; 			 (indent-tab-mode nil)))

;; (setq semantic-load-turn-useful-things-on t)
;; (load "cedet")


(provide 'init-java)
;;; init-java.el ends here
