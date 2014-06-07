;;; -*- mode: emacs-lisp; coding: utf-8 -*-

;;; init-doc-mode.el --- Doxygen minor mode setting

;; Copyright (C) 2010  Keisuke Ijuin

;; Author: Keisuke Ijuin <kei10in@gmail.com>
;; Keywords: emacs.el doc-mode

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
;; doc-mode
;; http://nschum.de/src/emacs/doc-mode/

;; (install-elisp http://nschum.de/src/emacs/doc-mode/doc-mode.el)
;; doc-mode requires Semantic to be installed and running.

(require 'doc-mode)
(add-hook 'c-mode-common-hook 'doc-mode)


(provide 'init-doc-mode)
;;; init-doc-mode.el ends here
