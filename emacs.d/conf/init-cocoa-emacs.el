;; -*- mode: emacs-lisp ; coding: utf-8 -*-

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
;(set-keyboard-coding-system 'sjis-mac)
;(set-clipboard-coding-system 'sjis-mac)
(set-terminal-coding-system 'utf-8)
;(set-buffer-file-coding-system 'sjis-mac)
(setq file-name-coding-system 'utf-8)
(setq default-input-method "MacOSX")

;; frame　の大きさ
(setq default-frame-alist
      (append
       (list
        '(height . 55)
        '(width . 86)
        )
       default-frame-alist)
      )

;; Use Quartz 2D anti-aliasing.
;; デフォルトは Non-nil
(setq mac-allow-anti-aliasing t)

;;; フォントの設定

;; ヒラギノ 角ゴ ProN + Monaco
(create-fontset-from-ascii-font "Monaco-12:slant=normal" nil "MonacoHiraKaku")
(set-fontset-font "fontset-MonacoHiraKaku"
                  'ascii
                  (font-spec :family "Monaco"))
(set-fontset-font "fontset-MonacoHiraKaku"
                  'iso-8859-1
                  (font-spec :family "Monaco")
                  nil 'prepend)
(set-fontset-font "fontset-MonacoHiraKaku"
                  'iso-8859-2
                  (font-spec :family "Monaco")
                  nil 'prepend)
(set-fontset-font "fontset-MonacoHiraKaku"
                  'iso-8859-3
                  (font-spec :family "Monaco")
                  nil 'prepend)
(set-fontset-font "fontset-MonacoHiraKaku"
                  'iso-8859-4
                  (font-spec :family "Monaco")
                  nil 'prepend)
(set-fontset-font "fontset-MonacoHiraKaku"
                  'iso-8859-5
                  (font-spec :family "Monaco")
                  nil 'prepend)
(set-fontset-font "fontset-MonacoHiraKaku"
                  'iso-8859-6
                  (font-spec :family "Geeza Pro")
                  nil 'prepend)
(set-fontset-font "fontset-MonacoHiraKaku"
                  'iso-8859-7
                  (font-spec :family "Monaco")
                  nil 'prepend)
(set-fontset-font "fontset-MonacoHiraKaku"
                  'chinese-gb2312
                  (font-spec :family "Hiragino Sans GB")
                  nil 'prepend)
(set-fontset-font "fontset-MonacoHiraKaku"
                  'big5
                  (font-spec :family "Hiragino Sans GB")
                  nil 'prepend)
;; (set-fontset-font "fontset-MonacoHiraKaku"
;;                   '(#x1100 . #x11FF)
;;                   (font-spec :family "AppleGothic"))
;; (set-fontset-font "fontset-MonacoHiraKaku"
;;                   '(#x3130 . #x318F)
;;                   (font-spec :family "AppleGothic"))
;; (set-fontset-font "fontset-MonacoHiraKaku"
;;                   '(#xAC00 . #xD79F)
;;                   (font-spec :family "AppleGothic"))
(set-fontset-font "fontset-MonacoHiraKaku"
                  'japanese-jisx0208
                  (font-spec :family "Hiragino Kaku Gothic ProN W3" :size 14)
                  nil 'prepend)
(set-fontset-font "fontset-MonacoHiraKaku"
                  'katakana-jisx0201
                  (font-spec :family "Hiragino Kaku Gothic ProN W3" :size 14)
                  nil 'prepend)
(set-fontset-font "fontset-MonacoHiraKaku"
                  'japanese-jisx0213-2
                  (font-spec :family "Hiragino Kaku Gothic ProN W3" :size 14)
                  nil 'prepend)
(set-fontset-font "fontset-MonacoHiraKaku"
                  'japanese-jisx0213.2004-1
                  (font-spec :family "Hiragino Kaku Gothic ProN W3" :size 14)
                  nil 'prepend)

;; 確認用
;; (set-frame-font "fontset-MonacoHiraKaku")
;; 実際に設定する場合は，ここのコメントを解除．
(add-to-list 'default-frame-alist '(font . "fontset-MonacoHiraKaku"))

;; swap Commmand and Option
(setq ns-command-modifier 'meta)
(setq ns-alternate-modifier 'super)

;; Open file by Drag & Drop
(define-key global-map [ns-drag-file] 'ns-find-file)
;; Don't create new frame when Drag & Droped
(setq ns-pop-up-frames nil)

;; Set frame Transparency
;(set-frame-parameter (selected-frame) 'alpha '(90 80))
(add-to-list 'default-frame-alist '(alpha . (98 90)))
