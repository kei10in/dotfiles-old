;;; -*- mode: emacs-lisp; coding: utf-8 -*-

;;; init-objc.el --- Objective-C major mode

;; Copyright (C) 2010  Keisuke Ijuin

;; Author: Keisuke Ijuin <kei10in@gmail.com>
;; Keywords: emacs.el objc-mode cc-mode

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

;; Objective-C mode
;; 
;; http://sakito.jp/emacs/emacsobjectivec.html

;;; Code:

(require 'init-auto-complete)

;; M - ;     コメントを挿入
;; M C - p   対応する開き括弧へジャンプ (関数の先頭や末尾また関数と関数の間で使うと、
;;           関数の開始部と終了部を順に上に飛んで行ける)
;; M C - n   対応する閉じ確固へジャンプ (・・・下に・・・・)
;; M - a     ステートメントの先頭へ移動
;; M - e     ステートメントの末尾へ移動
;; M - .     CTAGSで関数にジャンプ
;; M - +     CTAGSでジャンプしてた時に元の場所に戻る


;; http://sakito.jp/emacs/emacsobjectivec.html
(add-to-list 'magic-mode-alist '("\\(.\\|\n\\)*\n@implementation" . objc-mode))
(add-to-list 'magic-mode-alist '("\\(.\\|\n\\)*\n@interface" . objc-mode))
(add-to-list 'magic-mode-alist '("\\(.\\|\n\\)*\n@protocol" . objc-mode))


(setq ac-modes (append ac-modes '(objec-mode)))
(add-hook 'objc-mode-common-hook 'objc-mode-hook)
(add-hook 'objc-mode-hook
          '(lambda ()
             (flymake-mode t)
             ;; http://sakito.jp/emacs/emacsobjectivec.html
             ;; XCode を利用した補完を有効にする
             (push 'ac-source-company-xcode ac-sources)
             ))

(provide 'init-objc)
;;; init-objc.el ends here

