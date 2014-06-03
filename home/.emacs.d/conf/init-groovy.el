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
(require 'init-package)
(install-package-if-not-installed 'groovy-mode)
(install-package-if-not-installed 'grails-mode)
(install-package-if-not-installed 'inf-groovy)

(defvar groovy-mode-dir
  (concat private-lisp-dir "groovy/"))
(add-to-list 'load-path
             (expand-file-name groovy-mode-dir))

(require 'groovy-mode)

(add-to-list 'auto-mode-alist '("\.groovy$" . groovy-mode))
(add-to-list 'interpreter-mode-alist '("groovy" . groovy-mode))

;;; make Groovy mode electric by default.
(add-hook 'groovy-mode-hook
          '(lambda ()
             ;; (groovy-electric-mode)
             ))

(require 'init-auto-complete)
(setq ac-modes (append ac-modes '(groovy-mode)))
(setq ac-modes (append ac-modes '(grails-mode)))


(provide 'init-groovy)
;;; init-groovy.el ends here