;; -*- mode: emacs-lisp ; coding: utf-8 -*-

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
(load "init-user-profile" t)
;;; Global Settings
(load "init-emacs" t)
(load "init-highlight" t)
(load "init-hl-line" t)
(load "init-linum" t)
;(load "init-color-moccur" t)
(load "init-wdired" t)
(load "init-term" t)
(load "init-auto-install" t)
(load "init-elpa" t)
(load "init-goto-chg" t)

;; Configurate X Window System Emacs
(when
    (and run-x-window-system
         (load "init-x-window-system")))

;; Configurate Cocoa Emacs
(when
    (and run-cocoa-emacs
         (load "init-cocoa-emacs")))

;; Configurate Carbon Emacs
(when
    (and run-carbon-emacs
         (load "init-carbon-emacs")))

;; Configurate NTEmacs
(when
    (and run-ntemacs
         (load "init-ntemacs")))

;; Configurate no window Emacs
(when
    (and run-no-window
         (load "init-no-window")))


;;;-------------------------
;;; Development Environment
;;;-------------------------
(load "init-flymake" t)
(load "init-cedet" t)
(load "init-pos-tip" t)
(load "init-auto-complete" t)
(load "init-yasnippet" t)

;;;==================================;
;;; Programing Language
;;;==================================;
;;;-------------------------
;;; cc-mode
;;;-------------------------
(load "init-cc" t)
;;;-------------------------
;;; C
;;;-------------------------
(load "init-c" t)
;;;-------------------------
;;; C++
;;;-------------------------
(load "init-c++" t)
;;;-------------------------
;;; Objective-C
;;;-------------------------
(load "init-objc" t)
;;;-------------------------
;;; Python
;;;-------------------------
(load "init-python" t)
;;-------------------------
;; Common Lisp
;;-------------------------
(load "init-lisp" t)
(load "init-slime" t)
;;-------------------------
;; Perl
;;-------------------------
(load "init-cperl" t)
(load "init-perl-setperl5lib" t)
(load "init-perl-flymake" t)
(load "init-perl-completion" t)
(load "init-pod" t)
(load "init-perltidy" t)
(load "init-perlcritic" t)
;; (load "init-perlnow")
;; (load "init-html-tt")
;; (load "init-pde")
;;-------------------------
;; JS + AS
;;-------------------------
(load "init-actionscript" t)
(load "init-js2" t)
;;-------------------------
;; Ruby
;;-------------------------
;; (load "init-ruby")
;;-------------------------
;; PHP
;;-------------------------
;(load "init-php" t)
;(load "init-php-flymake" t)
;;-------------------------
;; SQL
;;-------------------------
;(load "init-sql" t)
;;-------------------------
;; Java
;;-------------------------
(load "init-java" t)
(load "init-scala" t)
;;-------------------------
;; JavaScript
;;-------------------------
(load "init-javascript" t)
;;-------------------------
;; scheme
;;-------------------------
(load "init-scheme" t)
;;-------------------------
;; HTML + CSS
;;-------------------------
(load "init-yahtml" t)
(load "init-nxml" t)
(load "init-html" t)
(load "init-html-helper" t)
(load "init-color-selection" t)
(load "init-sgml" t)
(load "init-css" t)

;;-------------------------
;; reStructured Text
;;-------------------------
(load "init-rst" t)

