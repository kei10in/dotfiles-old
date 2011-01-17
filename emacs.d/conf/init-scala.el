;;; -*- mode: emacs-lisp; coding: utf-8 -*-

;;; init-scala.el --- Scala major mode

;; Copyright (C) 2010  Keisuke Ijuin

;; Author: Keisuke Ijuin <kei10in@gmail.com>
;; Keywords: emacs.el scala-mode

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

;; Scala-mode
;; http://www.scala-lang.org/

;; ENSIME
;; https://github.com/aemoncannon/ensime

;;; Code:


;;; Scala-mode
(defvar scala-mode-dir
  (concat private-site-lisp-dir "./scala"))
(add-to-list 'load-path
			 (expand-file-name scala-mode-dir))

(require 'scala-mode-auto)


;;; ENSIME
(defvar ensime-dir
  (concat private-site-lisp-dir "./ensime/elisp/"))
(add-to-list 'load-path
			 (expand-file-name ensime-dir))

(require 'ensime)
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)


(defvar scala-build-commad nil)
(make-variable-buffer-local 'scala-build-command)


;;; Flymake mode
;;; From http://snippets.dzone.com/posts/show/5013

;; (add-hook 'scala-mode-hook
;;           (lambda ()
;;             (flymake-mode-on)
;;             ))

;; (defun flymake-scala-init ()
;;   (let* ((text-of-first-line
;;           (buffer-substring-no-properties (point-min) (min 20 (point-max)))))
;;     (progn
;;       (remove-hook 'after-save-hook 'flymake-after-save-hook t)
;;       (save-buffer)
;;       (add-hook 'after-save-hook 'flymake-after-save-hook nil t)
;;       (if (string-match "^//script" text-of-first-line)
;;           (list "fsc"
;;                 (list "-Xscript" "MainScript" "-d" "c:/tmp" buffer-file-name))
;;         (or scala-build-command
;;             (list "fsc" (list "-d" "c:/tmp" buffer-file-name))))
;;       )))

;; (push '(".+\\.scala$" flymake-scala-init) flymake-allowed-file-name-masks)
;; (push
;;  '("^\\(.*\\):\\([0-9]+\\): error: \\(.*\\)$" 1 2 nil 3)
;;  flymake-err-line-patterns)


;;; From http://snippets.dzone.com/posts/show/5013

(set (make-local-variable 'indent-line-function) 'scala-indent-line)

(defun scala-indent-line ()
  "Indent current line of Scala code."
  (interactive)
  (indent-line-to (max 0 (scala-calculate-indentation))))

(defun scala-calculate-indentation ()
  "Return the column to which the current line should be indented."
  (save-excursion
    (scala-maybe-skip-leading-close-delim)
    (let ((pos (point)))
      (beginning-of-line)
      (if (not (search-backward-regexp "[^\n\t\r ]" 1 0))
          0
        (progn
          (scala-maybe-skip-leading-close-delim)
          (+ (current-indentation)
             (* 2 (scala-count-scope-depth (point) pos))))))))

(defun scala-maybe-skip-leading-close-delim ()
  (beginning-of-line)
  (forward-to-indentation 0)
  (if (looking-at "\\s)")
      (forward-char)
    (beginning-of-line)))

(defun scala-face-at-point (pos)
  "Return face descriptor for char at point."
  (plist-get (text-properties-at pos) 'face))

(defun scala-count-scope-depth (rstart rend)
  "Return difference between open and close scope delimeters."
  (save-excursion
    (goto-char rstart)
    (let ((open-count 0)
          (close-count 0)
          opoint)
      (while (and (< (point) rend)
                  (progn (setq opoint (point))
                         (re-search-forward "\\s)\\|\\s(" rend t)))
        (if (= opoint (point))
            (forward-char 1)
          (cond

           ;; Use font-lock-mode to ignore strings and comments
           ((scala-face-at-point (- (point) 1))) 

           ((looking-back "\\s)")
            (incf close-count))
           ((looking-back "\\s(")
            (incf open-count))
           )))
      (- open-count close-count))))

(provide 'init-scala)
;;; init-scala.el ends here
