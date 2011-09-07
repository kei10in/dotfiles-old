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
               (expand-file-name "~/.emacs.d/site-lisp/")
               (expand-file-name "~/.emacs.d/conf/")
               )
              load-path))

;;;-----------------------------------------------------------------
;;; Load every single settings
;;;-----------------------------------------------------------------
(require 'detectenv)
;;; User Profile Settings
(require 'init-user-profile)
;;; Global Settings
(require 'init-emacs)
(require 'init-highlight)
(require 'init-hl-line)
(require 'init-linum)
;(require 'init-color-moccur)
(require 'init-wdired)
(require 'init-term)
(require 'init-auto-install)
(require 'init-elpa)
(require 'init-goto-chg)
(require 'init-undo)
(require 'init-auto-async-byte-compile)

;; Configurate X Window System Emacs
(when
    (and run-x-window-system
         (require 'init-fontset)
         (load "init-x-window-system")))

;; Configurate Cocoa Emacs
(when
    (and run-cocoa-emacs
         (require 'init-fontset)
         (load "init-cocoa-emacs")))

;; Configurate NTEmacs
(when
    (and run-ntemacs
         (require 'init-fontset)
         (load "init-ntemacs")))

;; Configurate no window Emacs
(when
    (and run-no-window
         (load "init-no-window")))

(require 'init-twitter)
(require 'init-anything)

;;;-------------------------
;;; Development Environment
;;;-------------------------
(require 'init-flymake)
(require 'init-cedet)
(require 'init-pos-tip)
(require 'init-auto-complete)
(require 'init-yasnippet)
;; (require 'init-smartchr)

;;;==================================;
;;; Programing Language
;;;==================================;

;; cc-mode
(require 'init-cc)
;; C
(require 'init-c)
;; C++
(require 'init-c++)
;; Objective-C
(require 'init-objc)
;; C#
(require 'init-csharp)
;; Python
(require 'init-python)
;; ;; Common Lisp
;; (require 'init-lisp)
;; (require 'init-slime)
;; ;; Perl
;; (require 'init-cperl)
;; (require 'init-perl-setperl5lib)
;; (require 'init-perl-flymake)
;; (require 'init-perl-completion)
;; (require 'init-pod)
;; (require 'init-perltidy)
;; (require 'init-perlcritic)
;; (load "init-perlnow")
;; (load "init-html-tt")
;; (load "init-pde")
;; Ruby
;; (load "init-ruby")
;; PHP
;(require 'init-php)
;(require 'init-php-flymake)
;; SQL
;(require 'init-sql)
;; Java
(require 'init-java)
;; Scala
(require 'init-scala)
;; scheme
;; (require 'init-scheme)
;; JS + AS
;; (require 'init-actionscript)
(require 'init-javascript)
;; HTML + CSS
;; (require 'init-yahtml)
;; (require 'init-nxml)
(require 'init-html)
;; (require 'init-html-helper)
;; (require 'init-color-selection)
;; (require 'init-sgml)
(require 'init-css)
;; reStructured Text
(require 'init-rst)
;; Org Mode
(require 'init-org)

;;; init.el ends here
