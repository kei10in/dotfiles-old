;;; -*- mode: emacs-lisp; coding: utf-8 -*-

;;; init-cc.el --- cc-mode definitions

;; Copyright (C) 2010  Keisuke Ijuin

;; Author: Keisuke Ijuin <kei10in@gmail.com>
;; Keywords: emacs.el cc-mode c-mode c++-mode java-mode

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


(require 'google-c-style)

(defconst windows-c-style
  '(
	(c-basic-offset . 4)
	(indent-tabs-mode . t)
	(c-comment-only-line-offset . (0 . 0))
	(c-hanging-braces-alist     . ((substatement-open before after)))
 	(c-offsets-alist . ((defun-open . 0)
						(defun-close . 0)
						(defun-block-intro . +)
						(substatement . +)
 						(substatement-open . 0)
 						(substatement-label . 0)
						(block-open . 0)
						(block-close . 0)
						(brace-list-open . 0)
						(brace-list-close . 0)
						(brace-list-intro . +)
						(brace-list-entry . 0)
						(brace-entry-open . 0)
						(statement-cont . +)
						(statement-block-intro . +)
						(case-label . +)
 						(statement-case-intro . +)
 						(statement-case-open . +)
						(member-init-intro . +)
						(member-init-cont . 0)
						(inexpr-statement . +)
						(do-while-closure . 0)
						;;; C++ Symbols
						(class-open . 0)
						(class-close . 0)
						(access-label . /)
						(inline-open . 0)
						(inline-close . 0)
						(inher-intro . +)
						(inher-cont . c-lineup-multi-inher)
						(statement . 0)
                        (extern-lang-open . 0)
                        (extern-lang-close . 0)
                        (inextern-lang . 0)
                        (namespace-open . 0)
                        (namespace-close . 0)
                        (innamespace . +)
                        ))
	(c-special-indent-hook . c-gnu-impose-minimum)
	(c-block-comment-prefix . ""))
  "Windows Visual Studio C/C++ Programming Style")
(c-add-style "windows-c" windows-c-style)


(add-hook 'c-mode-common-hook
          '(lambda ()
             (local-set-key (kbd "RET") 'newline-and-indent)))



(provide 'init-cc)
;;; init-cc.el ends here
