;;; -*- mode: emacs-lisp; coding: utf-8 -*-

;;; init-user-profile.el --- Emacs User Profile

;; Copyright (C) 2010  Keisuke Ijuin

;; Author: Keisuke Ijuin <kei10in@gmail.com>
;; Keywords: emacs.el

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


;;; User Profile Definitions

;; ;; User Informations
(setq user-full-name "Keisuke Ijuin")
(setq user-mail-address "kei10in@gmail.com")

(defvar private-lib-dir "~/.emacs.d/")
(defvar private-lisp-dir (concat private-lib-dir "./lisp/"))
(defvar private-conf-dir (concat private-lib-dir "./conf/"))

(provide 'init-user-profile)
;;; init-user-profile.el ends here
