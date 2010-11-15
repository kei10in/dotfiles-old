;;; -*- mode: emacs-lisp; coding: utf-8 -*-

;;; init-redo+.el --- redo+ command

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

;; (install-elisp-from-emacswiki "redo+.el")

(require 'redo+)

(global-set-key (kbd "C-?") 'redo)

;; 過去の undo が redo されない様にする．
(setq undo-no-redo t)

;; 大量の undo に耐えれるようにする．
(setq undo-limit 60000)
(setq undo-strong-limit 90000)


(provide 'init-redo+)
;;; init-redo+.el ends here
