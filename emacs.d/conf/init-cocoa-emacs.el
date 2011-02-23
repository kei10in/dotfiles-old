;;; -*- mode: emacs-lisp; coding: utf-8 -*-

;;; init-cocoa-emacs.el --- Cocoa Emacs system depend setting

;; Copyright (C) 2010  Keisuke Ijuin

;; Author: Keisuke Ijuin <kei10in@gmail.com>
;; Keywords: emacs.el cocoa MacOSX

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
                  nil 'append)
(set-fontset-font "fontset-MonacoHiraKaku"
                  'iso-8859-2
                  (font-spec :family "Monaco")
                  nil 'append)
(set-fontset-font "fontset-MonacoHiraKaku"
                  'iso-8859-3
                  (font-spec :family "Monaco")
                  nil 'append)
(set-fontset-font "fontset-MonacoHiraKaku"
                  'iso-8859-4
                  (font-spec :family "Monaco")
                  nil 'append)
(set-fontset-font "fontset-MonacoHiraKaku"
                  'iso-8859-5
                  (font-spec :family "Monaco")
                  nil 'append)
(set-fontset-font "fontset-MonacoHiraKaku"
                  'iso-8859-6
                  (font-spec :family "Geeza Pro")
                  nil 'append)
(set-fontset-font "fontset-MonacoHiraKaku"
                  'iso-8859-7
                  (font-spec :family "Monaco")
                  nil 'append)
(set-fontset-font "fontset-MonacoHiraKaku"
                  'japanese-jisx0208
                  (font-spec :family "Hiragino Kaku Gothic ProN W3" :size 14)
                  nil 'append)
(set-fontset-font "fontset-MonacoHiraKaku"
                  'katakana-jisx0201
                  (font-spec :family "Hiragino Kaku Gothic ProN W3" :size 14)
                  nil 'append)
(set-fontset-font "fontset-MonacoHiraKaku"
                  'japanese-jisx0213-2
                  (font-spec :family "Hiragino Kaku Gothic ProN W3" :size 14)
                  nil 'append)
(set-fontset-font "fontset-MonacoHiraKaku"
                  'japanese-jisx0213.2004-1
                  (font-spec :family "Hiragino Kaku Gothic ProN W3" :size 14)
                  nil 'append)
(set-fontset-font "fontset-MonacoHiraKaku"
                  'chinese-gb2312
                  (font-spec :family "Hiragino Sans GB" :size 14)
                  nil 'append)
(set-fontset-font "fontset-MonacoHiraKaku"
                  'big5
                  (font-spec :family "Hiragino Sans GB" :size 14)
                  nil 'append)
(set-fontset-font "fontset-MonacoHiraKaku"
                  'korean-ksc5601
                  (font-spec :family "PCMyungjo" :size 14)
                  nil 'append)

;; 確認用
;; (set-frameet-font "fontset-MonacoHiraKaku")
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


(provide 'init-cocoa-emacs)
;;; init-cocoa-emacs.el ends here
