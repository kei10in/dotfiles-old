;; -*- mode: emacs-lisp ; coding: utf-8 -*-

;; Use Quartz 2D anti-aliasing.
;(setq mac-allow-anti-aliasing t)

;;
;; Japanese Enviroment Configuration
;;
;;   [Character Code]-[Line Feed Code]
;;
;;   Character Code: sjis, euc-jp, utf-8
;;   Line Feed Code: unix, dos, mac
;;
(set-language-environment 'Japanese)
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8-unix)
(set-keyboard-coding-system 'sjis-mac)
(set-clipboard-coding-system 'sjis-mac)
(set-terminal-coding-system 'utf-8)
;(set-buffer-file-coding-system 'sjis-mac)
(setq file-name-coding-system 'utf-8)
;(setq default-input-method "MacOSX")
;;(mac-setup-inline-input-method)
;; (setq default-input-method "MacOSX-IM-JP")
;; (set-language-info 'Japanese 'input-method "MacOSX-IM-JP")
;; (add-hook 'isearch-mode-hook 'mac-im-isearch-mode-setup)
;; (add-hook 'isearch-mode-end-hook 'mac-im-isearch-mode-cleanup)
;; (add-hook 'minibuffer-setup-hook
;; 	  (lambda () (mac-im-set-key-script -17)))

;; フォントの設定
;(set-default-font "Monaco-10")
;(setq my-font "-*-*-medium-r-normal--12-*-*-*-*-*-fontset-hiramaru")
(setq my-font "monako")
(set-frame-font my-font)
(add-to-list 'default-frame-alist `(font . ,my-font))
(when run-emacs23
  (setq fixed-width-use-QuickDraw-for-ascii t)
  (setq mac-allow-anti-aliasing t)
  ;; (set-face-attribute 'default nil
  ;; 					  :family "monaco"
  ;; 					  :height 140)
  (set-fontset-font
   (frame-parameter nil 'font)
   'japanese-jisx0208
   '("Hiragino Maru Gothic Pro" . "iso10646-1"))
  (set-fontset-font
   (frame-parameter nil 'font)
   'japanese-jisx0212
   '("Hiragino Maru Gothic Pro" . "iso10646-1"))
 ;;; Unicode フォント
  (set-fontset-font
   (frame-parameter nil 'font)
   'mule-unicode-0100-24ff
   '("monaco" . "iso10646-1"))
;;; キリル，ギリシア文字設定
;;; 注意： この設定だけでは古代ギリシア文字、コプト文字は表示できない
;;; http://socrates.berkeley.edu/~pinax/greekkeys/NAUdownload.html が必要
;;; キリル文字
  (set-fontset-font
   (frame-parameter nil 'font)
   'cyrillic-iso8859-5
   '("monaco" . "iso10646-1"))
;;; ギリシア文字
  (set-fontset-font
   (frame-parameter nil 'font)
   'greek-iso8859-7
   '("monaco" . "iso10646-1"))
  (setq face-font-rescale-alist
		'(("^-apple-hiragino.*" . 1.2)
		  (".*osaka-bold.*" . 1.2)
		  (".*osaka-medium.*" . 1.2)
		  (".*courier-bold-.*-mac-roman" . 1.0)
		  (".*monaco cy-bold-.*-mac-cyrillic" . 0.9)
		  (".*monaco-bold-.*-mac-roman" . 0.9)
		  ("-cdac$" . 1.3))))


;; frame　の大きさ
(setq default-frame-alist
	  (append
	   (list
		'(family . "monaco")
		'(height . 55)
		'(width . 86)
		)
	   default-frame-alist)
	  )

;; frame の色を設定する
(defun my-set-display-for-windowed-frames (frame)
  "Set display parameters for the current frame the way I like them."
  (select-frame frame)
  (set-background-color "black")
  (set-foreground-color "#55FF55")
  (set-cursor-color "#00AA00")
)
(add-hook 'after-make-frame-functions 'my-set-display-for-windowed-frames)
(my-set-display-for-windowed-frames (selected-frame))

(setq default-input-method "MacOSX")

;; swap Commmand and Option
(setq ns-command-modifier 'meta)
(setq ns-alternate-modifier 'super)

;; Open file by Drag & Drop
(define-key global-map [ns-drag-file] 'ns-find-file)
;; Don't create new frame when Drag & Droped
(setq ns-pop-up-frames nil)

;; Set frame Transparency
;(set-frame-parameter (selected-frame) 'alpha '(90 90))

;; Set face: region background
;; On Cocoa Emacs, region background is set to "ns_selection_color" in term/ns-win.el
(set-face-background 'region "blue4")