;;; classical-console-theme.el --- Classical black green console theme for faces
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


(deftheme classical-console
  "Face colors using black background and classical green characters.")

(custom-theme-set-faces
 'classical-console
 '(default ((t (:background "black" :foreground "#80FF80"))))
 '(cursor ((t (:background "#00bb00"))))
 '(highlight ((t (:background "#222244"))))
 '(hl-line ((t (:background "#222244"))))
 '(flymake-errline ((t (:background "brown4"))))
 '(flymake-warnline ((t (:background "MidnightBlue"))))
 ;; Org Mode face
 '(org-level-1 ((t (:foreground "#A0FFFF"))))
 '(org-level-2 ((t (:foreground "#A0A0FF"))))
 '(org-level-3 ((t (:foreground "#FFA0FF"))))
 '(org-level-4 ((t (:foreground "#FFA0A0"))))
 '(org-level-5 ((t (:foreground "#FFFFA0"))))
 '(org-level-6 ((t (:foreground "#C0FFC0"))))
 '(org-level-7 ((t (:foreground "#C0C0FF"))))
 '(org-level-8 ((t (:foreground "#FFC0C0"))))
 ;; anything mode face
 '(anything-ff-directory ((t (:background "*" :foreground "LightSkyBlue"))))
 '(anything-ff-file ((t (:foreground "PaleGreen"))))
 ;; auto-completion mode face
 '(ac-completion-face ((t (:background "blue" :foreground "*" :underline t))))
 ;; grap
 '(grep-edit-face ((t (:background "#442222"))))
 ;; rst mode
 '(rst-level-1-face ((t (:foreground "LightSkyBlue" :background "gray15"))))
 '(rst-level-2-face ((t (:foreground "LightGoldenrod" :background "gray22"))))
 '(rst-level-3-face ((t (:foreground "Cyan1" :background "gray29"))))
 '(rst-level-4-face ((t (:foreground "chocolate1" :background "gray36"))))
 '(rst-level-5-face ((t (:foreground "PaleGreen" :background "gray43"))))
 '(rst-level-6-face ((t (:foreground "Aquamarine" :background "gray50"))))
)

(provide-theme 'classical-console)

;; Local Variables:
;; no-byte-compile: t
;; End:

;;; classical-console-theme.el ends here
