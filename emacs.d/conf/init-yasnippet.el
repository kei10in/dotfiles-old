;;; -*- mode: emacs-lisp; coding: utf-8 -*-

;;; init-yasnippet.el --- YASnippet mode setting

;; Copyright (C) 2010  Keisuke Ijuin

;; Author: Keisuke Ijuin <kei10in@gmail.com>
;; Keywords: emacs.el yasnippet.el yasnipett-mode

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
;; yasnippet
;; http://yasnippet.googlecode.com/svn/trunk/yasnippet.el
;; http://code.google.com/p/yasnippet/
(defvar yasnippet-mode-dir
  (concat private-site-lisp-dir "yasnippet/"))
(add-to-list 'load-path
		 (expand-file-name yasnippet-mode-dir))
(require 'yasnippet)

;;-----------------------------------------------------------------
;; 自分用スニペットディレクトリ(リストで複数指定可)
;; http://d.hatena.ne.jp/antipop/20080315/1205604544
;; svn co http://svn.coderepos.org/share/config/yasnippet/common yasnippet-snippets
;; でcheck out
;;-----------------------------------------------------------------
;(defvar my-snippet-directories (list (expand-file-name "~/.emacs.d/yasnippet-snippets")))

;;-----------------------------------------------------------------
;; snippetの定義方法
;; http://code.google.com/p/yasnippet/wiki/HowtoDefineSnippet
;;-----------------------------------------------------------------
;;-----------------------------------------------------------------
;; yasnippet公式提供のものと、自分用カスタマイズスニペットをロード
;; 同名のスニペットが複数ある場合、あとから読みこんだ自分用のものが優先
;; される。また、スニペットを変更、追加した場合、このコマンドを実行する
;; ことで、変更・追加が反映される。
;; http://d.hatena.ne.jp/antipop/20080315/1205604544
;;-----------------------------------------------------------------

(setq yas/window-system-popup-function
      #'yas/dropdown-list-popup-for-template)
(setq yas/text-popup-function
      #'yas/dropdown-list-popup-for-template)

;;-----------------------------------------------------------------
;; コメントやリテラルではスニペットを展開しない
;;-----------------------------------------------------------------
(setq yas/buffer-local-condition
      '(or (not (or (string= "font-lock-comment-face"
                             (get-char-property (point) 'face))
                    (string= "font-lock-string-face"
                             (get-char-property (point) 'face))))
           '(require-snippet-condition . force-in-comment)));

;;-----------------------------------------------------------------
;; yasnippet展開中はflymakeを無効にする
;;-----------------------------------------------------------------
(defvar flymake-is-active-flag nil)
(defadvice yas/expand-snippet
  (before inhibit-flymake-syntax-checking-while-expanding-snippet activate)
  (setq flymake-is-active-flag
        (or flymake-is-active-flag
            (assoc-default 'flymake-mode (buffer-local-variables))))
  (when flymake-is-active-flag
    (flymake-mode-off)))
(add-hook 'yas/after-exit-snippet-hook
          '(lambda ()
             (when flymake-is-active-flag
               (flymake-mode-on)
               (setq flymake-is-active-flag nil))))

(yas/initialize)

;;-----------------------------------------------------------------
;; yasnippetのsnippetを置いてあるディレクトリ
;;-----------------------------------------------------------------
(yas/load-directory 
 (expand-file-name (concat yasnippet-mode-dir "snippets/")))


(provide 'init-yasnippet)
;;; init-yasnippet.el ends here
