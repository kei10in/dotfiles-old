;;; init-grep.el --- grep relating mode setup

;; Copyright (C) 2011  Keisuke Ijuin

;; Author: Keisuke Ijuin <kei10in@gmail.com>
;; Keywords: tools

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

;; (install-elisp-from-emacswiki "igrep.el")
;; (install-elisp-from-emacswiki "grep-a-lot.el")
;; (install-elisp-from-emacswiki "grep-edit.el")

;;; Code:


(require 'igrep)
(require 'grep-a-lot)
(require 'grep-edit)

(grep-a-lot-setup-keys)

;; for igrep users
(grep-a-lot-advise igrep)

(setq igrep-options "--exclude-dir=.svn --exclude-dir=.git --exclude-dir=.hg -EIr")

;;
(custom-set-faces
 '(grep-edit-face
   ((((class color) (background dark)) (:background "#442222"))
    (((class color) (background light)) (:background "#442222"))
    (t nil)))
)

(provide 'init-grep)
;;; init-grep.el ends here
