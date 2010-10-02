;; -*- mode: emacs-lisp; coding: utf-8 -*-

;;;-----------------------;
;;;   Scala
;;;-----------------------;
(defvar scala-mode-dir
  (concat private-site-lisp-dir "./scala"))
(add-to-list 'load-path
			 (expand-file-name scala-mode-dir))
(require 'scala-mode-auto)
