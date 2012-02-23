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
      '("TODO(t)" "WAITING(w)" "TODAY(y)" "DOING(d)" "|" "DONE(x)" "CANCEL(c)"))
(setq org-agenda-files '("~/Documents/Work/OrgNote/index.org"))

(setq org-log-done t)

;; Org Mode Keybinds
(define-key org-mode-map (kbd "<tab>") 'org-metaright)
(define-key org-mode-map (kbd "<S-tab>") 'org-metaleft)
(define-key org-mode-map (kbd "C-c a") 'org-agenda)

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


(provide 'init-org)
;;; init-org.el ends here
