;;; -*- mode: emacs-lisp; coding: utf-8 -*-

;;; init.el --- Emacs initialization elisp file

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

;;; Code:

;;;-----------------------------------------------------------------
;;; Regist private configuration pathes to load-path
;;;-----------------------------------------------------------------
(setq load-path
      (append (list
               (expand-file-name "~/.emacs.d/lisp/")
               (expand-file-name "~/.emacs.d/site-lisp/")
               (expand-file-name "~/.emacs.d/conf/")
               )
              load-path))

(setq custom-theme-directory (expand-file-name "~/.emacs.d/themes/"))

;;;-----------------------------------------------------------------
;;; Load every single settings
;;;-----------------------------------------------------------------
;;; User Profile Settings
(require 'init-user-profile)
;;; Global Settings
(require 'init-emacs)
(require 'init-package)
(require 'init-highlight)
(require 'init-hl-line)
(require 'init-linum)
;(require 'init-color-moccur)
(require 'init-grep)
(require 'init-wdired)
(require 'init-term)
(require 'init-goto-chg)
(require 'init-undo)
(require 'init-helm)
;; info Mode
(require 'init-info)

(require 'init-runtime-environment)

(require 'init-progmodes)
(require 'init-textmodes)


(load-theme 'classical-console t)

;;; init.el ends here
