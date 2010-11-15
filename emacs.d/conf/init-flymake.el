;;; -*- mode: emacs-lisp; coding: utf-8 -*-

;;; init-flymake.el --- flymake minor mode setting

;; Copyright (C) 2010  Keisuke Ijuin

;; Author: Keisuke Ijuin <kei10in@gmail.com>
;; Keywords: emacs.el flymake-mode

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


;;;-----------------------;
;;; flymake
;;;-----------------------;
(require 'flymake)
(setq flymake-gui-warnings-enabled nil)
(setq flymake-start-syntax-check-on-newline nil)

;;; You must prepare pylint by hand
;;; See also http://www.emacswiki.org/cgi-bin/wiki/PythonMode
(defvar epylint-path
  (or (executable-find "epylint")
      (executable-find "epylint-2.6")
      (executable-find "epylint-2.5")))
(when epylint-path
  (defun flymake-pylint-init ()
    (let* ((temp-file (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-inplace))
           (local-file (file-relative-name
                        temp-file
                        (file-name-directory buffer-file-name))))
      (list epylint-path (list local-file))))
  (push '("\\.py\\'" flymake-pylint-init) flymake-allowed-file-name-masks)
  (add-hook 'python-mode-hook
            '(lambda ()
               (flymake-mode t)
               ;; (defadvice flymake-post-syntax-check
               ;;   (before flymake-force-check-was-interrupted)
               ;;   (setq flymake-check-was-interrupted t))
               ;; (ad-activate 'flymake-post-syntax-check)
               )))


;; For C
(defun flymake-c-init ()
  (let* ((temp-file (flymake-init-create-temp-buffer-copy
                     'flymake-create-temp-inplace))
         (local-file (file-relative-name
                      temp-file
                      (file-name-directory buffer-file-name))))
	(list "gcc" (list "-Wall" "-Wextra" "-fsyntax-only" local-file))))
(defun flymake-vc-init ()
  (let* ((temp-file (flymake-init-create-temp-buffer-copy
                     'flymake-create-temp-inplace))
         (local-file (file-relative-name
                      temp-file
                      (file-name-directory buffer-file-name))))
	(list "cl" (list "/nologo" "/W4" "/Wp64" "/Zs" local-file))))

;; For C++
(defun flymake-cc-init ()
  (let* ((temp-file (flymake-init-create-temp-buffer-copy
                     'flymake-create-temp-inplace))
         (local-file (file-relative-name
                      temp-file
                      (file-name-directory buffer-file-name))))
    (list "g++" (list "-Wall" "-Wextra" "-fsyntax-only" local-file))))
(defun flymake-vc++-init ()
  (let* ((temp-file (flymake-init-create-temp-buffer-copy
                     'flymake-create-temp-inplace))
         (local-file (file-relative-name
                      temp-file
                      (file-name-directory buffer-file-name))))
	(list "cl" (list "/nologo" "/W4" "/Wp64" "/Zs" local-file))))

;; overwite default make command
;; (defun flymake-get-make-cmdline (source base-dir)
;;   (list "make"
;;         (list "-s"
;; 			  "-C"
;;               base-dir
;;               (concat "CHK_SOURCES=" source)
;;               "SYNTAX_CHECK_MODE=1")))

(if run-w32
	(progn
	  (push '("\\.c\\'" flymake-vc-init) flymake-allowed-file-name-masks)
	  (push '("\\.h\\'" flymake-vc-init) flymake-allowed-file-name-masks)
	  (push '("\\.cc\\'" flymake-vc++-init) flymake-allowed-file-name-masks)
	  (push '("\\.cpp\\'" flymake-vc++-init) flymake-allowed-file-name-masks)
	  (push '("\\.hh\\'" flymake-vc++-init) flymake-allowed-file-name-masks)
	  (push '("\\.hpp\\'" flymake-vc++-init) flymake-allowed-file-name-masks)))
  ;; (progn
  ;; 	(push '("\\.c\\'" flymake-c-init) flymake-allowed-file-name-masks)
  ;; 	(push '("\\.h\\'" flymake-c-init) flymake-allowed-file-name-masks)
  ;; 	(push '("\\.hh\\'" flymake-cc-init) flymake-allowed-file-name-masks)
  ;; 	(push '("\\.hpp\\'" flymake-cc-init) flymake-allowed-file-name-masks)))




;; Color Configurations for flymake
(custom-set-faces
 '(flymake-errline
   ((((class color)
      (background dark))
     (:background "brown4"))
	(((class color)
	  (background light))
	 (:background "LightPink"))))
 '(flymake-warnline
   ((((class color)
      (background dark))
     (:background "MidnightBlue"))
	(((class color)
	  (background light))
	 (:background "LightBlue2")))))

(defun flymake-display-err-minibuf () 
  "Displays the error/warning for the current line in the minibuffer"
  (interactive)
  (let* ((line-no             (flymake-current-line-no))
         (line-err-info-list  (nth 0 (flymake-find-err-info flymake-err-info line-no)))
         (count               (length line-err-info-list))
         )
    (while (> count 0)
      (when line-err-info-list
        (let* ((file       (flymake-ler-file (nth (1- count) line-err-info-list)))
               (full-file  (flymake-ler-full-file (nth (1- count) line-err-info-list)))
               (text (flymake-ler-text (nth (1- count) line-err-info-list)))
               (line       (flymake-ler-line (nth (1- count) line-err-info-list))))
          (message "[%s] %s" line text)
          )
        )
      (setq count (1- count)))))

(global-set-key "\C-cd" 'flymake-display-err-minibuf)

;; flymake 現在行のエラーをpopup.elのツールチップで表示する
;; (defun flymake-display-err-poptip-for-current-line ()
;;   (interactive)
;;   (let* ((line-no (flymake-current-line-no))
;;          (line-err-info-list (nth 0 (flymake-find-err-info flymake-err-info line-no))))
;;     (when line-err-info-list
;;       (let* ((count (length line-err-info-list))
;;              (menu-item-text nil))
;;         (while (> count 0)
;;           (setq menu-item-text (flymake-ler-text (nth (1- count) line-err-info-list)))
;;           (let* ((file (flymake-ler-file (nth (1- count) line-err-info-list)))
;;                  (line (flymake-ler-line (nth (1- count) line-err-info-list))))
;;             (if file
;;                 (setq menu-item-text (concat menu-item-text " - " file "(" (format "%d" line) ")"))))
;;           (setq count (1- count))
;;           (if (> count 0) (setq menu-item-text (concat menu-item-text "\n")))
;;           )
;;         (popup-tip menu-item-text)))))


(provide 'init-flymake)
;;; init-flymake.el ends here
