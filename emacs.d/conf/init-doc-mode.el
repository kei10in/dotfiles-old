;; -*- mode: emacs-lisp; coding: utf-8 -*-

;; doc-mode
;; http://nschum.de/src/emacs/doc-mode/

;; (install-elisp http://nschum.de/src/emacs/doc-mode/doc-mode.el)
;; doc-mode requires Semantic to be installed and running.

(require 'doc-mode)
(add-hook 'c-mode-common-hook 'doc-mode)