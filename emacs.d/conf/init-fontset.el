;;; -*- mode: emacs-lisp; coding: utf-8 -*-

;;; init-fontset.el --- global font set definitions

;; Copyright (C) 2010  Keisuke Ijuin

;; Author: Keisuke Ijuin <kei10in@gmail.com>
;; Keywords: emacs.el

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

;;; Font Set の定義

;;;
;;; ヒラギノ 角ゴ ProN + Monaco for Cocoa Emacs
;;;
(defun create-monaco-hirakaku ()
  "Create font set, Monaco + ヒラギノ 角ゴ ProN for Cocoa Emacs."
  (create-fontset-from-ascii-font "Monaco-12:slant=normal" nil "MonacoHiraKaku")
  (set-fontset-font "fontset-MonacoHiraKaku" 'chinese-gb2312 
                    (font-spec :family "Hiragino Sans GB" :size 14))
  (set-fontset-font "fontset-MonacoHiraKaku" 'big5
                    (font-spec :family "Hiragino Sans GB" :size 14))
  (set-fontset-font "fontset-MonacoHiraKaku" 'korean-ksc5601
                    (font-spec :family "PCMyungjo" :size 14))
  (set-fontset-font "fontset-MonacoHiraKaku" 'japanese-jisx0208
                    (font-spec :family "Hiragino Kaku Gothic ProN W3" :size 14))
  (set-fontset-font "fontset-MonacoHiraKaku" 'katakana-jisx0201
                    (font-spec :family "Hiragino Kaku Gothic ProN W3" :size 14))
  (set-fontset-font "fontset-MonacoHiraKaku" 'japanese-jisx0213-2
                    (font-spec :family "Hiragino Kaku Gothic ProN W3" :size 14))
  (set-fontset-font "fontset-MonacoHiraKaku" 'japanese-jisx0213.2004-1
                    (font-spec :family "Hiragino Kaku Gothic ProN W3" :size 14))
  (set-fontset-font "fontset-MonacoHiraKaku" 'greek-iso8859-7
                    (font-spec :family "Menlo"))
  (set-fontset-font "fontset-MonacoHiraKaku" 'iso-8859-1
                    (font-spec :family "Monaco"))
  (set-fontset-font "fontset-MonacoHiraKaku" 'iso-8859-2
                    (font-spec :family "Monaco"))
  (set-fontset-font "fontset-MonacoHiraKaku" 'iso-8859-3
                    (font-spec :family "Monaco"))
  (set-fontset-font "fontset-MonacoHiraKaku" 'iso-8859-4
                    (font-spec :family "Monaco"))
  (set-fontset-font "fontset-MonacoHiraKaku" 'iso-8859-5
                    (font-spec :family "Monaco"))
  (set-fontset-font "fontset-MonacoHiraKaku" 'ascii
                    (font-spec :family "Monaco"))
  )
;; 確認用
;; (set-frame-font "fontset-MonacoHiraKaku")


;;;
;;; Consolas + MS Gothic for NTEmacs 23
;;;
(defun create-consolas-msgothic ()
  "Create font set, Conslas + MS Gothic for NTEmacs."
  (create-fontset-from-ascii-font "Consolas-10:weight=normal:slant=normal"
                                  nil "ConsolasMSGothic")
  (set-fontset-font "fontset-ConsolasMSGothic"
                    'ascii
                    (font-spec :family "Consolas" :size 10)
                    nil 'append)
  (set-fontset-font "fontset-ConsolasMSGothic"
                    'iso-8859-1
                    (font-spec :family "Consolas" :size 10)
                    nil 'append)
  (set-fontset-font "fontset-ConsolasMSGothic"
                    'iso-8859-2
                    (font-spec :family "Consolas" :size 10)
                    nil 'append)
  (set-fontset-font "fontset-ConsolasMSGothic"
                    'iso-8859-3
                    (font-spec :family "Consolas" :size 10)
                    nil 'append)
  (set-fontset-font "fontset-ConsolasMSGothic"
                    'iso-8859-4
                    (font-spec :family "Consolas" :size 10)
                    nil 'append)
  (set-fontset-font "fontset-ConsolasMSGothic"
                    'iso-8859-5
                    (font-spec :family "Consolas" :size 10)
                    nil 'append)
  (set-fontset-font "fontset-ConsolasMSGothic"
                    'iso-8859-6
                    (font-spec :family "Geeza Pro" :size 10)
                    nil 'append)
  (set-fontset-font "fontset-ConsolasMSGothic"
                    'iso-8859-7
                    (font-spec :family "Consolas" :size 10)
                    nil 'append)
  (set-fontset-font "fontset-ConsolasMSGothic"
                    'japanese-jisx0208
                    (font-spec :family "MS Gothic" :size 14)
                    nil 'append)
  (set-fontset-font "fontset-ConsolasMSGothic"
                    'katakana-jisx0201
                    (font-spec :family "MS Gothic" :size 14)
                    nil 'append)
  (set-fontset-font "fontset-ConsolasMSGothic"
                    'japanese-jisx0213-2
                    (font-spec :family "MS Gothic" :size 14)
                    nil 'append)
  (set-fontset-font "fontset-ConsolasMSGothic"
                    'japanese-jisx0213.2004-1
                    (font-spec :family "MS Gothic" :size 14)
                    nil 'append)
  (set-fontset-font "fontset-ConsolasMSGothic"
                    'chinese-gb2312
                    (font-spec :family "SimHei" :size 14)
                    nil 'append)
  (set-fontset-font "fontset-ConsolasMSGothic"
                    'big5
                    (font-spec :family "MingLiU" :size 14)
                    nil 'append)
  (set-fontset-font "fontset-ConsolasMSGothic"
                    'korean-ksc5601
                    (font-spec :family "Gulim" :size 14)
                    nil 'append)
  )
;; 確認用。確認したいときは eval-region する。
;; (set-frame-font "fontset-ConsolasMSGothic")


(provide 'init-fontset)
;;; init-fonts.el ends here
