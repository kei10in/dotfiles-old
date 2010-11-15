;;; -*- mode: emacs-lisp; coding: utf-8 -*-

;;; init-php.el --- PHP major mode

;; Copyright (C) 2010  Keisuke Ijuin

;; Author: Keisuke Ijuin <kei10in@gmail.com>
;; Keywords: emacs.el php-mode

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

;; php-mode
(load-library "php-mode")
(require 'php-mode)
(add-hook 'php-mode-hook
          '(lambda ()
			 (setq c-basic-offset 4)
			 (setq indent-tabs-mode nil)
			 ))


(provide 'init-php)
;;; init-php.el ends here
