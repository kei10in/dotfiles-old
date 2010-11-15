;;; -*- mode: emacs-lisp; coding: utf-8 -*-

;;; init-wdired.el --- wdired mode setting

;; Copyright (C) 2010  Keisuke Ijuin

;; Author: Keisuke Ijuin <kei10in@gmail.com>
;; Keywords: emacs.el wdired

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


;;-----------------------------------------------------------------
;; wdired
;; http://www.bookshelf.jp/soft/meadow_25.html#SEC292
;;-----------------------------------------------------------------
;; 例えば、拡張子 cpp を cxx に変更したいとすれば
;; M - % で確認置換を起動し、cpp -> cxx と置換すればOK
;; 更にうれしいのは、例えば test.cpp をバッファとして開いていたとして、
;; それを test.cxx にリネームした場合にバッファを
;; test.cxx として開き直してくれる点です。
;; http://d.hatena.ne.jp/higepon/20061226/1167098839
;;-----------------------------------------------------------------
(require 'wdired)

;;-----------------------------------------------------------------
;; rでdiredバッファを直接編集できるようになる。
;;-----------------------------------------------------------------
(define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)

;;-----------------------------------------------------------------
;;パーミッションも変更可能に
;;-----------------------------------------------------------------
(setq wdired-allow-to-change-permissions t)

;;-----------------------------------------------------------------
;; dired で編集後に SKK をオフ (SKK は使わないのでコメントアウト)
;;-----------------------------------------------------------------
;(defadvice wdired-finish-edit
;  (after skk-no-use activate)
;  (skk-auto-fill-mode -1))


(provide 'init-wdired)
;;; init-wdired.el ends here
