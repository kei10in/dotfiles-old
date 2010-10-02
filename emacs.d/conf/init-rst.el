;;; -*- mode: emacs-lisp; coding: utf-8 -*-

;;; reStructuredText mode

;;; rst.el --- Mode for viewing and editing reStructuredText
;; http://docutils.sourceforge.net/
(setq auto-mode-alist
      (append '(
                ; ("\\.txt$" . rst-mode)
                ("\\.rst$" . rst-mode)
                ) auto-mode-alist))
(add-hook 'rst-mode-hook
              (lambda ()
                (setq rst-slides-program "open -a Firefox")
                ))
