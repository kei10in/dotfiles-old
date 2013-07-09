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

;; (install-elisp-from-emacswiki "yasnippet.el")

;;; Code:


(require 'init-user-profile)
(require 'init-package)
(install-package-if-not-installed 'yasnippet)

;;-----------------------------------------------------------------
;; yasnippet
;; http://yasnippet.googlecode.com/svn/trunk/yasnippet.el
;; http://code.google.com/p/yasnippet/
;; http://www.emacswiki.org/emacs/Yasnippet
(require 'yasnippet-config)
(require 'yasnippet)
(yas-global-mode 1)

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

(require 'init-autoinsert)

;; auto insertion snippet for C and C++ header file
(define-auto-insert "\\.\\([hH]\\|[hH][hH]\\|[hH][pP][pP]\\)$"
  (lambda ()
    (insert "once")
    (yas/expand)))


(provide 'init-yasnippet)
;;; init-yasnippet.el ends here
