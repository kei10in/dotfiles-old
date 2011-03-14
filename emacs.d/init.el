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


(defvar private-lib-dir "~/.emacs.d/")
(defvar private-site-lisp-dir (concat private-lib-dir "./site-lisp/"))
(defvar private-conf-dir (concat private-lib-dir "./conf/"))

;;-----------------------------------------------------------------
;; Detect OS
;;-----------------------------------------------------------------
(defvar run-unix  (or (equal system-type 'gnu/linux)
                      (or (equal system-type 'usg-unix-v)
                          (or  (equal system-type 'berkeley-unix)
                               (equal system-type 'cygwin)))))
(defvar run-linux
  (equal system-type 'gnu/linux))
(defvar run-system-v
  (equal system-type 'usg-unix-v))
(defvar run-bsd
  (equal system-type 'berkeley-unix))
(defvar run-cygwin ;; cygwinもunixグループにしておく
  (equal system-type 'cygwin))
(defvar run-w32
  (and (null run-unix)
       (or (equal system-type 'windows-nt)
           (equal system-type 'ms-dos))))
(defvar run-darwin (equal system-type 'darwin))

;;-----------------------------------------------------------------
;; Detect Emacsen versions
;;-----------------------------------------------------------------
(defvar run-emacs20
  (and (equal emacs-major-version 20)
       (null (featurep 'xemacs))))
(defvar run-emacs21
  (and (equal emacs-major-version 21)
       (null (featurep 'xemacs))))
(defvar run-emacs22
  (and (equal emacs-major-version 22)
       (null (featurep 'xemacs))))
(defvar run-emacs23
  (and (equal emacs-major-version 23)
       (null (featurep 'xemacs))))
(defvar run-x-window-system (equal window-system 'x))
(defvar run-xemacs (featurep 'xemacs))
(defvar run-xemacs-no-mule
  (and run-xemacs (not (featurep 'mule))))
(defvar run-no-window (equal window-system nil))
(defvar run-carbon-emacs (and run-darwin (equal window-system 'mac)))
(defvar run-cocoa-emacs (and run-darwin (equal window-system 'ns)))
;;; windows emacs
(defvar run-meadow (featurep 'meadow))
(defvar run-meadow1 (and run-meadow run-emacs20))
(defvar run-meadow2 (and run-meadow run-emacs21))
(defvar run-meadow3 (and run-meadow run-emacs22))
(defvar run-ntemacs (or (featurep 'meadow-ntemacs) (featurep 'w32-win)))

;;;-----------------------------------------------------------------
;;; Regist private configuration pathes to load-path
;;;-----------------------------------------------------------------
(setq load-path
      (append (list
               (expand-file-name private-site-lisp-dir)
               (expand-file-name private-conf-dir)
               )
              load-path))

;;;-----------------------------------------------------------------
;;; Load every single settings
;;;-----------------------------------------------------------------
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
(require 'init-redo+)
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

;;;-------------------------
;;; Development Environment
;;;-------------------------
(require 'init-flymake)
(require 'init-cedet)
(require 'init-pos-tip)
(require 'init-auto-complete)
(require 'init-yasnippet)

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
