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


(require 'init-package)
(require 'init-linum)

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
						(inexpr-statement . +)
						(do-while-closure . 0)
						;;; C++ Symbols
						(class-open . 0)
						(class-close . 0)
						(access-label . -)
						(inline-open . 0)
						(inline-close . 0)
						(inher-intro . +)
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


(defconst my-c-style
  `((c-basic-offset . 4)
    (indent-tabs-mode . nil)
    (c-comment-only-line-offset . 0)
    (c-hanging-braces-alist . ((defun-open before after)
                               (defun-close before after)
                               (class-open after)
                               (class-close before after)
                               (namespace-open after)
                               (inline-open after)
                               (inline-close before after)
                               (block-open before after)
                               (block-close . c-snug-do-while)
                               (extern-lang-open after)
                               (extern-lang-close before after)
                               (statement-case-open after)
                               (substatement-open after)))
    (c-hanging-colons-alist . ((case-label)
                               (label after)
                               (access-label after)
                               (member-init-intro before)
                               (inher-intro)))
    (c-hanging-semi&comma-criteria . nil)
    (c-indent-comments-syntactically-p . nil)
    (comment-column . 40)
    (c-cleanup-list . (brace-else-brace
                       brace-elseif-brace
                       brace-catch-brace
                       empty-defun-braces
                       defun-close-semi
                       list-close-comma
                       scope-operator))
    (c-offsets-alist . ((arglist-intro google-c-lineup-expression-plus-4)
                        (func-decl-cont . +)
                        (member-init-intro . +)
                        (inher-intro . +)
                        (comment-intro . 0)
                        (arglist-close . c-lineup-arglist)
                        (topmost-intro . 0)
                        (block-open . 0)
                        (inline-open . 0)
                        (substatement-open . 0)
                        (statement-cont
                         .
                         (,(when (fboundp 'c-no-indent-after-java-annotations)
                             'c-no-indent-after-java-annotations)
                          ,(when (fboundp 'c-lineup-assignments)
                             'c-lineup-assignments)
                          +))
                        (label . /)
                        (case-label . +)
                        (statement-case-open . +)
                        (statement-case-intro . +) ; case w/o {
                        (access-label . /)
                        (innamespace . 0))))
  "My Own C/C++ Programming Style")
(c-add-style "my-c" my-c-style)

(require 'utils)

(add-hook 'c-mode-common-hook
          '(lambda ()
             (local-set-key (kbd "RET") 'newline-skeleton-pair-insert-brace)
             (linum-mode)
             (c-set-style "my-c")
             ;; (c-set-style "windows-c")
             ;; (google-set-c-style)
             ))

;; (add-hook 'c-mode-common-hook 'win-c-mode-hook)

(provide 'init-cc)
;;; init-cc.el ends here
