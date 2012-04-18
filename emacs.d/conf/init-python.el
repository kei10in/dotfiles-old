;;; -*- mode: emacs-lisp; coding: utf-8 -*-

;;; init-python.el --- Python major mode

;; Copyright (C) 2010  Keisuke Ijuin

;; Author: Keisuke Ijuin <kei10in@gmail.com>
;; Keywords: emacs.el python.el python-mode.el python-mode

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

;; You can select python.el - emacs default python mode or
;; python-mode.el - defact standard python mode.

;;; Code:


;;;
;;; * An Emacs mode for editing Python code (python-mode.el)
;;;   https://launchpad.net/python-mode
;;;
;;; * Simple Python Completion Source for Auto-Complete (ac-python.el)
;;;   http://chrispoole.com/project/ac-python/
;;;


(require 'python)

;; (require 'python-mode)
;; (setq auto-mode-alist (cons '("\\.py$" . python-mode) auto-mode-alist))
;; (setq interpreter-mode-alist (cons '("python" . python-mode)
;; 								   interpreter-mode-alist))
;; (autoload 'python-mode "python-mode" "Python editing mode." t)

(require 'init-auto-complete)
(require 'ac-python)

(provide 'init-python)
;;; init-python.el ends here
