;;; -*- mode: emacs-lisp; coding: utf-8 -*-

;;;--------------------------------------------------------------------;
;;; line highlight
;;; The possible attributes are `:family', `:width', `:height',
;;; `:weight', `:slant', `:underline', `:overline', `:strike-through',
;;; `:box', `:foreground', `:background', `:stipple', `:inverse-video',
;;; and `:inherit'.
;;;--------------------------------------------------------------------;


(require 'hl-line)
(global-hl-line-mode)
(defface hlline-face
  '((((class color)
      (background dark))
     (:background "#222244"))
    (((class color)
      (background light))
     (:background "LightSteelBlue1"))
     (t
     ()))
  "*Face used by hl-line.")
;(setq hl-line-face 'underline)
(setq hl-line-face 'hlline-face)
