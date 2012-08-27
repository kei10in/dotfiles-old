;;; init-faces.el --- face definitions

;; Copyright (C) 2012  Keisuke Ijuin

;; Author: Keisuke Ijuin <kei10in@gmail.com>
;; Keywords: faces

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

(require 'detectenv)

;;;------------------------------------;
;;; Emacs Face
;;;------------------------------------;
;;; default face
(custom-set-faces
 (if run-no-window
     ;; for console emacs
     '(default ((t
                 (:background "black")
                 ;; (:background "white" :foreground "black")
                 )))
   ;; for Cocoa, X, NTEmacs
   '(default ((t
               (:background "black" :foreground "#80FF80")
               ;; (:background "white" :foreground "black")
               )))
   ))

;;; cursor face
(custom-set-faces
 '(cursor ((((class color)
             (background dark))
            (:background "#00bb00"))
           (((class color)
             (background light))
            (:background "#999999"))
           (t ())
           )))

;; Color Configurations for flymake
(custom-set-faces
 '(flymake-errline
   ((((class color)
      (background dark))
     (:background "brown4"))
	(((class color)
	  (background light))
	 (:background "LightPink"))))
 '(flymake-warnline
   ((((class color)
      (background dark))
     (:background "MidnightBlue"))
	(((class color)
	  (background light))
	 (:background "LightBlue2")))))


;;; highlight face
(custom-set-faces 
 '(highlight
   ((((class color)
      (background dark))
     (:background "#222244"))
    (((class color)
      (background light))
     (:background "LightSteelBlue1")))))

;;;--------------------------------------------------------------------;
;;; line highlight
;;; The possible attributes are `:family', `:width', `:height',
;;; `:weight', `:slant', `:underline', `:overline', `:strike-through',
;;; `:box', `:foreground', `:background', `:stipple', `:inverse-video',
;;; and `:inherit'.
;;;--------------------------------------------------------------------;

;; hl-line mode
(custom-set-faces 
 '(hl-line
   ((((class color)
      (background dark))
     (:background "#222244"))
    (((class color)
      (background light))
     (:background "LightSteelBlue1")))))


;; Org Mode Faces
(custom-set-faces
 '(org-level-1
   ((((class color) (background dark)) (:foreground "#A0FFFF"))
    (((class color) (background light)) (:inherit outline-1))
    (t nil)))
 '(org-level-2
   ((((class color) (background dark)) (:foreground "#A0A0FF"))
    (((class color) (background light)) (:inherit outline-2))
    (t nil)))
 '(org-level-3
   ((((class color) (background dark)) (:foreground "#FFA0FF"))
    (((class color) (background light)) (:inherit outline-3))
    (t nil)))
 '(org-level-4
   ((((class color) (background dark)) (:foreground "#FFA0A0"))
    (((class color) (background light)) (:inherit outline-4))
    (t nil)))
 '(org-level-5
   ((((class color) (background dark)) (:foreground "#FFFFA0"))
    (((class color) (background light)) (:inherit outline-5))
    (t nil)))
 '(org-level-6
   ((((class color) (background dark)) (:foreground "#C0FFC0"))
    (((class color) (background light)) (:foreground outline-6))
    (t nil)))
 '(org-level-7
   ((((class color) (background dark)) (:foreground "#C0C0FF"))
    (((class color) (background light)) (:foreground outline-7))
    (t nil)))
 '(org-level-8
   ((((class color) (background dark)) (:foreground "#FFC0C0"))
    (t nil)))
)


;;; anything faces
(custom-set-faces
 '(anything-ff-directory ((((class color)
                            (background dark))
                           (:foreground "LightSkyBlue"))
                          (((class color)
                            (background light))
                           (:foreground "Blue1"))
                          (t ())
                          ))
 '(anything-ff-file ((((class color)
                       (background dark))
                      (:foreground "PaleGreen"))
                     (((class color)
                       (background light))
                      (:foreground "black"))
                     (t ())
                     ))
 )


;;; ac-completion-face
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(ac-completion-face ((t (:background "blue" :foreground "*" :underline t)))))


;; Grep face
(custom-set-faces
 '(grep-edit-face
   ((((class color) (background dark)) (:background "#442222"))
    (((class color) (background light)) (:background "#442222"))
    (t nil)))
)


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

(provide 'init-faces)
;;; init-faces.el ends here
