;;; -*- mode: emacs-lisp; coding: utf-8 -*-

;;; init-auto-complete.el --- auto-complete-mode setting

;; Copyright (C) 2010  Keisuke Ijuin

;; Author: Keisuke Ijuin <kei10in@gmail.com>
;; Keywords: emacs.el auto-complete-mode

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

;; Auto Complete Minor Mode
;;
;; http://cx4a.org/software/auto-complete/index.ja.html
;; http://cx4a.org/software/auto-complete/manual.ja.html
;; https://github.com/buzztaiki/auto-complete/blob/master/ac-company.el

;;; Code:

(require 'init-user-profile)
(require 'init-package)

;;;----------------------------------------------------------------------;
;;; auto complete (for 1.2- )
;;;----------------------------------------------------------------------;
;; add auto complete directory to load-path 
(defvar auto-complete-mode-dir
  (concat private-lisp-dir "./auto-complete/"))

(add-to-list 'load-path
			 (expand-file-name auto-complete-mode-dir))

(require 'auto-complete-config)
(require 'auto-complete-clang)

(global-auto-complete-mode t)

(add-to-list 'ac-dictionary-directories
			 (concat auto-complete-mode-dir "dict/"))

;; 各 major mode での ac-sources の設定
(ac-config-default)

;;; quick help
(setq ac-use-quick-help nil)


;;; auto-complete が実行されるまでの時間．
(setq ac-delay 0.5)

;;; auto-complete が実行されるのに必要な文字数．
(setq ac-auto-start nil)
(ac-set-trigger-key "TAB")

;;; 補完メニューの表示
(setq ac-auto-show-menu 0.4)
(setq ac-show-menu-immediately-on-auto-complete t)

;;; C-n, C-p で補完メニューを移動
(setq ac-use-menu-map t)
(define-key ac-menu-map "\C-n" 'ac-next)
(define-key ac-menu-map "\C-p" 'ac-previous)

;; 候補の最大件数 デフォルトは 10件
(setq ac-candidate-max 20)

;;; Case Sensitive
;;; t: 区別しない
;;; smart: 大文字が含まれている場合，区別する．
;;; nil: 区別する
(setq ac-ignore-case nil)


(setq-default ac-sources
              '(ac-source-abbrev
                ac-source-dictionary
                ac-source-words-in-same-mode-buffers))

(defun my-ac-common-setup ())
(defun my-ac-cc-mode-setup ()
  (setq ac-sources (append '(ac-source-clang ac-source-yasnippet) ac-sources)))

(add-hook 'emacs-lisp-mode-hook 'ac-emacs-lisp-mode-setup)
(add-hook 'c-mode-common-hook 'my-ac-cc-mode-setup)
(add-hook 'auto-complete-mode-hook 'my-ac-common-setup)

(provide 'init-auto-complete)
;;; init-auto-complete.el ends here
