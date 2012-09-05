;;; -*- mode: emacs-lisp; coding: utf-8 -*-

;;; init-linum.el --- line number mode

;; Copyright (C) 2010  Keisuke Ijuin

;; Author: Keisuke Ijuin <kei10in@gmail.com>
;; Keywords: emacs.el linum-mode

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

;; (install-elisp-from-emacswiki "linum-ex.el")

;;; Code:


(require 'linum-ex)
(setq linum-format "%4d")
;; これを行うと query-replace が正しく動作しない．
;; (setq linum-eager nil)
;; (global-linum-mode)


(provide 'init-linum)
;;; init-linum.el ends here
