;; -*- mode: emacs-lisp; coding: utf-8 -*-

;;;-----------------------;
;;;   Ruby
;;;-----------------------;
(defvar ruby-mode-dir
  (concat private-site-lisp-dir "./ruby"))
(add-to-list 'load-path
			 (expand-file-name ruby-mode-dir))

(require 'ruby-mode)
(setq auto-mode-alist
      (append '(("\\.rb$" . ruby-mode)) auto-mode-alist))
