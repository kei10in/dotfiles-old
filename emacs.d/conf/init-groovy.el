;;; init-groovy.el --- setup emacs-groovy-mode

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

;; https://launchpad.net/groovy-emacs-mode

;;; Code:


(require 'init-user-profile)

(defvar groovy-mode-dir
  (concat private-site-lisp-dir "groovy/"))
(add-to-list 'load-path
             (expand-file-name groovy-mode-dir))

(require 'groovy-mode)
(require 'groovy-electric)

(add-to-list 'auto-mode-alist '("\.groovy$" . groovy-mode))
(add-to-list 'interpreter-mode-alist '("groovy" . groovy-mode))

;;; make Groovy mode electric by default.
(add-hook 'groovy-mode-hook
          '(lambda ()
             ;; (groovy-electric-mode)
             ))


(provide 'init-groovy)
;;; init-groovy.el ends here
