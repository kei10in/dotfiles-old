;; -*- mode: emacs-lisp; coding: utf-8 -*-

;; (install-elisp-from-emacswiki "auto-install.el")
(require 'auto-install)
(setq auto-install-directory "~/.emacs.d/site-lisp/")
(add-to-list 'load-path auto-install-directory)
;
; add emacs wiki page name to completion candidates 
(auto-install-update-emacswiki-package-name t)

;; compatible install-elisp.el
(auto-install-compatibility-setup)
