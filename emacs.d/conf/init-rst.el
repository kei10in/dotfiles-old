;;; -*- mode: emacs-lisp; coding: utf-8 -*-

;;; init-rst.el --- reStructuredText major mode

;; Copyright (C) 2010  Keisuke Ijuin

;; Author: Keisuke Ijuin <kei10in@gmail.com>
;; Keywords: emacs.el rst-mode

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

;; 

;;; Code:

;;; reStructuredText mode

;;; rst.el --- Mode for viewing and editing reStructuredText
;; http://docutils.sourceforge.net/

(require 'rst)

(setq auto-mode-alist
      (append '(
                ; ("\\.txt$" . rst-mode)
                ("\\.rst$" . rst-mode)
                ) auto-mode-alist))
(add-hook 'rst-mode-hook
              (lambda ()
                (setq rst-slides-program "open -a Firefox")
                ))

(add-hook 'rst-adjust-hook 'rst-toc-update)
(setq rst-mode-lazy nil)

;; Key mapping
(define-key rst-mode-map (kbd "C-c <") 'rst-shift-region-left)
(define-key rst-mode-map (kbd "C-c >") 'rst-shift-region-right)

;; Face Configuration
(custom-set-faces
 '(rst-level-1-face
   ((((class color) (background dark))
     (:foreground "LightSkyBlue" :background "gray15"))
    (((class color) (background light))
     (:foreground "Blue1" :background "gray85"))
    (t ())
    ))
 '(rst-level-2-face
   ((((class color) (background dark))
     (:foreground "LightGoldenrod" :background "gray22"))
    (((class color) (background light))
     (:foreground "DarkGoldenrod" :background "gray78"))
    (t ())
    ))
 '(rst-level-3-face
   ((((class color) (background dark))
     (:foreground "Cyan1" :background "gray29"))
    (((class color) (background light))
     (:foreground "Purple" :background "gray71"))
    (t ())
    ))
 '(rst-level-4-face
   ((((class color) (background dark))
     (:foreground "chocolate1" :background "gray36"))
    (((class color) (background light))
     (:foreground "Firebrick" :background "gray64"))
    (t ())
    ))
 '(rst-level-5-face
   ((((class color) (background dark))
     (:foreground "PaleGreen" :background "gray43"))
    (((class color) (background light))
     (:foreground "ForestGreen" :background "gray57"))
    (t ())
    ))
 '(rst-level-6-face
   ((((class color) (background dark))
     (:foreground "Aquamarine" :background "gray50"))
    (((class color)
      (background light))
     (:foreground "CadetBlue" :background "gray50"))
    (t ())
    ))
 )


(provide 'init-rst)
;;; init-rst.el ends here
