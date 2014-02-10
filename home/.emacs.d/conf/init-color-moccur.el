;;; -*- mode: emacs-lisp; coding: utf-8 -*-

;;; init-color-moccur.el --- moccur-color-setting

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


;; color-moccur.el
;; http://www.bookshelf.jp/elc/color-moccur.el
;; http://www.bookshelf.jp/soft/meadow_50.html#SEC738
;; * M-x moccur : ファイルバッファのみを検索 (正規表現)
;; * C-u M-x moccur : すべてのバッファを検索 (正規表現)
;; * M-x dmoccur : 指定したディレクトリ下のファイルを検索 (正規表現)
;; * C-u M-x dmoccur : あらかじめ指定しておいたディレクトリ下のファイルを検索できる (正規表現)
;; * M-x moccur-grep : grep のようにファイルを検索 (正規表現)
;; * M-x moccur-grep-find : grep+find のようにファイルを検索 (正規表現)
;; * M-x search-buffers : すべてのバッファを全文検索．
;; * M-x grep-buffers : 開いているファイルを対象に grep ．
;; * バッファリストで M-x Buffer-menu-moccur : m でマークをつけたバッファのみを対象に検索
;; * dired で M-x dired-do-moccur : m でマークをつけたファイルのみを対象に検索
;; * moccur の結果でs:一致したバッファのみで再検索
;; * moccur の結果でu:一つ前の条件で検索
;; M-x clean-dmoccur-buffers 不要なバッファをkill
;; * iseachの単語でmoccurを実行 C-s でM-o

;; バッファリストからの moccur
;; M-x moccur では，開いているバッファが多いと時間がかかってしまいます．
;; そこで，C-x C-b でバッファリストを出し，m で検索したいバッファに印をつけます．その後，M-x Buffer-menu-moccur とすると，印をつけたバッファのみを対象に occur を行うことができます．
;; これなら，検索対象を絞ることができ，検索も短時間で済みます．
;; dired からの moccur
;; dmoccur でディレクトリ以下のファイルを検索できますが，ファイルが多いディレクトリではファイルを開くのに時間がかかります．
;; そこで， dired で指定したファイルのみを検索する dired-do-moccur が便利です．
;; まず，C-x d で dired を表示し，検索したいファイルに m でマークをつけます．そして，M-x dired-do-moccur を実行します．
;; すると，マークをつけたファイルのみを moccur で検索できます． 

(require 'color-moccur)
(require 'moccur-edit)
(define-key moccur-mode-map "\C-n" 'moccur-next)
(define-key moccur-mode-map "\C-p" 'moccur-prev)


(provide 'init-color-moccur)
;;; init-color-moccur.el ends here
