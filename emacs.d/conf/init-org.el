;;; init-org.el --- OrgMode Configurations

;; Copyright (C) 2011  Keisuke Ijuin

;; Author: Keisuke Ijuin <kei10in@gmail.com>
;; Keywords: tools, docs

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

(require 'org)

(global-set-key (kbd "C-c l") 'org-store-link)

(setq org-use-fast-todo-selection t)
(setq org-todo-keywords
      '((sequence "TODO(t)" "WAITING(w)" "DOING(d)" "|" "DONE(x)" "CANCEL(c)")))

;; Org Mode Faces
(custom-set-faces
 '(org-level-1
   ((((class color) (background dark)) (:foreground "LightSkyBlue"))
    (((class color) (background light)) (:inherit outline-1))
    (t nil)))
 '(org-level-2
   ((((class color) (background dark)) (:foreground "LightGoldenrod"))
    (((class color) (background light)) (:inherit outline-2))
    (t nil)))
 '(org-level-3
   ((((class color) (background dark)) (:foreground "orchid"))
    (((class color) (background light)) (:inherit outline-3))
    (t nil)))
 '(org-level-4
   ((((class color) (background dark)) (:foreground "RoyalBlue"))
    (((class color) (background light)) (:inherit outline-4))
    (t nil)))
 '(org-level-5
   ((((class color) (background dark)) (:foreground "OliveDrab"))
    (((class color) (background light)) (:inherit outline-5))
    (t nil)))
 '(org-level-6
   ((((class color) (background dark)) (:foreground "brown"))
    (((class color) (background light)) (:foreground outline-6))
    (t nil)))
 '(org-level-7
   ((((class color) (background dark)) (:foreground "DeepSkyBlue4"))
    (((class color) (background light)) (:foreground outline-7))
    (t nil)))
 '(org-level-8
   ((((class color) (background dark)) (:foreground "chartreuse4"))
    (t ())))
)


(provide 'init-org)
;;; init-org.el ends here
