;;; -*- mode: emacs-lisp; coding: utf-8 -*-

;;; init-auto-install.el --- auto-install command

;; Copyright (C) 2010  Keisuke Ijuin

;; Author: Keisuke Ijuin <kei10in@gmail.com>
;; Keywords: emacs.el auto-install.el

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

;; http://www.emacswiki.org/AutoInstall
;; (install-elisp-from-emacswiki "auto-install.el")
(require 'auto-install)
(setq auto-install-directory "~/.emacs.d/site-lisp/")
(add-to-list 'load-path auto-install-directory)
;; add emacs wiki page name to completion candidates 
(auto-install-update-emacswiki-package-name t)

;; compatible install-elisp.el
(auto-install-compatibility-setup)

(provide 'init-auto-install)
;;; init-auto-install.el ends here
