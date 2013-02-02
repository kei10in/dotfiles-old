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
  (let ((fontset-name (create-fontset-from-ascii-font
                      "Monaco-12:slant=normal" nil "MonacoHiraKaku")))
    (set-fontset-font fontset-name 'chinese-gb2312 
                      (font-spec :family "Hiragino Sans GB"))
    (set-fontset-font fontset-name 'big5
                      (font-spec :family "Hiragino Sans GB"))
    (set-fontset-font fontset-name 'korean-ksc5601
                      (font-spec :family "PCMyungjo"))
    (set-fontset-font fontset-name 'japanese-jisx0208
                      (font-spec :family "Hiragino Kaku Gothic ProN W3"))
    (set-fontset-font fontset-name 'katakana-jisx0201
                      (font-spec :family "Hiragino Kaku Gothic ProN W3"))
    (set-fontset-font fontset-name 'japanese-jisx0213-2
                      (font-spec :family "Hiragino Kaku Gothic ProN W3"))
    (set-fontset-font fontset-name 'japanese-jisx0213.2004-1
                      (font-spec :family "Hiragino Kaku Gothic ProN W3"))
    (set-fontset-font fontset-name 'greek-iso8859-7
                      (font-spec :family "Menlo"))
    (set-fontset-font fontset-name 'iso-8859-1 (font-spec :family "Monaco"))
    (set-fontset-font fontset-name 'iso-8859-2 (font-spec :family "Monaco"))
    (set-fontset-font fontset-name 'iso-8859-3 (font-spec :family "Monaco"))
    (set-fontset-font fontset-name 'iso-8859-4 (font-spec :family "Monaco"))
    (set-fontset-font fontset-name 'iso-8859-5 (font-spec :family "Monaco"))
    (set-fontset-font fontset-name 'ascii (font-spec :family "Monaco"))
    fontset-name
    ))
;; 確認用
;; (set-frame-font "fontset-MonacoHiraKaku")

(defun create-monaco-hirakaku-face-font-rescale-alist ()
  '(("^-apple-hiragino.*" . 1.2)
    (".*osaka-bold.*" . 1.2)
    (".*osaka-medium.*" . 1.2)
    (".*courier-bold-.*-mac-roman" . 1.0)
    (".*monaco cy-bold-.*-mac-cyrillic" . 0.9)
    (".*monaco-bold-.*-mac-roman" . 0.9)
    ("-cdac$" . 1.3)))


;;;
;;; Consolas + MS Gothic for NTEmacs 23
;;;
(defun create-consolas-msgothic ()
  "Create font set, Conslas + MS Gothic for NTEmacs."
  (let ((fontset-name (create-fontset-from-ascii-font
                       "Consolas-10:slant=normal" nil
                       "ConsolasMSGothic")))
    (set-fontset-font fontset-name 'ascii
                      (font-spec :family "Consolas") nil 'append)
    (set-fontset-font fontset-name 'iso-8859-1
                      (font-spec :family "Consolas") nil 'append)
    (set-fontset-font fontset-name 'iso-8859-2
                      (font-spec :family "Consolas") nil 'append)
    (set-fontset-font fontset-name 'iso-8859-3
                      (font-spec :family "Consolas") nil 'append)
    (set-fontset-font fontset-name 'iso-8859-4
                      (font-spec :family "Consolas") nil 'append)
    (set-fontset-font fontset-name 'iso-8859-5
                      (font-spec :family "Consolas") nil 'append)
    (set-fontset-font fontset-name 'iso-8859-7
                      (font-spec :family "Consolas") nil 'append)
    (set-fontset-font fontset-name 'iso-8859-6
                      (font-spec :family "Geeza Pro") nil 'append)
    (set-fontset-font fontset-name 'japanese-jisx0208
                      (font-spec :family "MS Gothic") nil 'append)
    (set-fontset-font fontset-name 'katakana-jisx0201
                      (font-spec :family "MS Gothic") nil 'append)
    (set-fontset-font fontset-name 'japanese-jisx0213-2
                      (font-spec :family "MS Gothic") nil 'append)
    (set-fontset-font fontset-name 'japanese-jisx0213.2004-1
                      (font-spec :family "MS Gothic") nil 'append)
    (set-fontset-font fontset-name 'chinese-gb2312
                      (font-spec :family "SimHei") nil 'append)
    (set-fontset-font fontset-name 'big5
                      (font-spec :family "MingLiU") nil 'append)
    (set-fontset-font fontset-name 'korean-ksc5601
                      (font-spec :family "Gulim") nil 'append)
    fontset-name
    ))
  ;; 確認用。確認したいときは eval-region する。
  ;; (set-frame-font "fontset-ConsolasMSGothic")

(defun create-consolas-msgothic-face-font-rescale-alist ()
  '(("SimHei" . 1.0)
    ("MingLiU" . 1.0)
    ("Gulim" . 1.0)
    ("MS Gothic" . 1.4)
    ("Courier New" . 0.8)
    ("-cdac$" . 1.3)))


  (provide 'init-fontset)
;;; init-fonts.el ends here
