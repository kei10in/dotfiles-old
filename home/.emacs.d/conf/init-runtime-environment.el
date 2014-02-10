;;; init-runtime-environment.el --- runtime environment configurations

;; Copyright (C) 2013  Keisuke Ijuin

;; Author: Keisuke Ijuin <kei10in@gmail.com>
;; Keywords: 

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

;; Configurate X Window System Emacs
(when
    (and run-x-window-system
         (require 'init-fontset)
         (load "init-x-window-system")))

;; Configurate Cocoa Emacs
(when
    (and run-cocoa-emacs
         (require 'init-fontset)
         (load "init-cocoa-emacs")))

;; Configurate NTEmacs
(when
    (and run-ntemacs
         (require 'init-fontset)
         (load "init-ntemacs")))

;; Configurate no window Emacs
(when
    (and run-no-window
         (load "init-no-window")))


(provide 'init-runtime-environment)
;;; init-runtime-environment.el ends here
