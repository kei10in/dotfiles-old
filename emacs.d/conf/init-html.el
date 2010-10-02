;; -*- mode: emacs-lisp; coding: utf-8 -*-

;;;-----------------------;
;;; HTML Mode
;;;-----------------------;
(add-hook 'html-mode-hook
		  '(lambda ()
			 (setq indent-tabs-mode nil)
			 ))
