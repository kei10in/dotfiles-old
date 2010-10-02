;; -*- mode: emacs-lisp; coding: utf-8 -*-

;;;
;;; Auto Complete Minor Mode
;;;
;;; http://cx4a.org/software/auto-complete/index.ja.html
;;; http://cx4a.org/software/auto-complete/manual.ja.html
;;;

;;;----------------------------------------------------------------------;
;;; auto complete (for 1.1)
;;;----------------------------------------------------------------------;
;(require 'auto-complete "auto-complete" t)
;(global-auto-complete-mode t)


;;;----------------------------------------------------------------------;
;;; auto complete (for 1.2- )
;;;----------------------------------------------------------------------;
;; add auto complete directory to load-path 
(defvar auto-complete-mode-dir
  (concat private-site-lisp-dir "./auto-complete"))

(add-to-list 'load-path
			 (expand-file-name auto-complete-mode-dir))

(require 'cl)
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories
			 (concat auto-complete-mode-dir "./dict"))

(defun ac-cc-mode-setup ()
  (setq ac-sources (append '(ac-source-yasnippet ac-source-gtags) ac-sources)))

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

;;; Case Sensitive
;;; t: 区別しない
;;; smart: 大文字が含まれている場合，区別する．
;;; nil: 区別しない
(setq ac-ignore-case 'smart)

(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(ac-completion-face ((t (:background "blue" :foreground "*" :underline t)))))
