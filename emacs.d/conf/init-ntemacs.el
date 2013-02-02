;;; -*- mode: emacs-lisp; coding: utf-8 -*-

;;; init-ntemacs.el --- Windows NTEmacs system dependent setting

;; Copyright (C) 2010  Keisuke Ijuin

;; Author: Keisuke Ijuin <kei10in@gmail.com>
;; Keywords: emacs.el NTEmacs Windows

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

;(set-language-environment "UTF-8")
;(set-language-environment "ASCII")
(set-clipboard-coding-system            'utf-16le)

(when (string-match current-language-environment "Japanese")
  ;(set-default-coding-systems             'nil)
  (set-keyboard-coding-system             'sjis)
  (set-clipboard-coding-system            'utf-16le)
  (setq file-name-coding-system 'japanese-shift-jis))

;;; Input method
;; use standard ime
(setq default-input-method "W32-IME")
;; IME status on mode line
(setq-default w32-ime-mode-line-state-indicator "[Aa]")
(setq w32-ime-mode-line-state-indicator-list '("[Aa]" "[あ]" "[Aa]"))
;; take over ime status on moving buffer
(setq w32-ime-buffer-switch-p nil)

(w32-ime-initialize)


;; frame の大きさ
(setq default-frame-alist
      (append
       (list
        '(height . 55)
        '(width . 86)
        )
       default-frame-alist)
      )


;; NTEmacs 23 用のフォントに関する設定
(setq w32-enable-synthesized-fonts t)
(setq w32-use-w32-font-dialog t)

;;; フォントの設定
(require 'init-fontset)
(create-consolas-msgothic)
(create-consolas-meiryo)
(add-to-list 'default-frame-alist '(font . "fontset-ConsolasMSGothic"))
;; (add-to-list 'default-frame-alist '(font . "fontset-ConsolasMeiryo"))
(setq face-font-rescale-alist (create-consolas-msgothic-face-font-rescale-alist))


;; (defun setup-my-fontset-Meiryo ()
;;   ;;  (setq w32-enable-synthesized-fonts t)
;;   (create-fontset-from-ascii-font "-outline-Consolas-normal-r-normal-normal-12-*-*-*-*-*-iso8859-1" nil "myfont")

;;   (set-fontset-font "fontset-myfont" 'japanese-jisx0208 '("メイリオ"   . "jisx0208-sjis"))
;;   (set-fontset-font "fontset-myfont" 'katakana-jisx0201 '("メイリオ*"  . "jisx0201-katakana"))


;;   ;; 等幅フォントにするためマルチバイト文字はスケーリングする
;;   (setq face-font-rescale-alist
;;         '((".*メイリオ.*"  . 1.2)))
;;   (add-to-list 'default-frame-alist '(font . "fontset-myfont"))
;;  )
;; (setup-my-fontset-Meiryo)



;; (when (and (featurep 'dos-w32) (locate-library "cygwin-mount"))
;;   (require 'cygwin-mount)
;;   (cygwin-mount-activate))


;; windows のショートカットを追う
(when (locate-library "w32-symlinks")
  (setq w32-symlinks-handle-shortcuts t)
  (require 'w32-symlinks)

  ;; http://www.bookshelf.jp/soft/meadow_25.html#SEC279 より
  ;;  25.3.8.1 ファイルを開く時にショートカットを辿る (2005/02/17)
  ;; URL="http://www.bookshelf.jp/cgi-bin/goto.cgi?file=meadow&node=findfile%20symlink"
  ;; "MeadowMemo/ファイルを開く時にショートカットを辿る"へのコメント(無し)
  ;; 検索全文Elisp
  ;; 要約
  ;; 深いディレクトリや別ドライブのディレクトリのファイルを開く際，
  ;; Windows のショートカットを利用して簡単に開くことができます．
  ;; 情報源
  ;; Wiki でのリクエストをもとに書いたもの．
  ;; 何が問題なのか?
  ;; C-x C-fで別ドライブの深いディレクトリに移動するのは面倒なものです．
  ;; 何ができるのか?
  ;; 例えば，Gドライブへのショートカットを作っておけば，C-x C-f g-drive.lnk TAB で
  ;; G ドライブへ移動できます．
  ;; 設定方法
  ;; 以下を.emacs に追加します．

  (defadvice minibuffer-complete
    (before expand-symlinks activate)
    (let ((file (expand-file-name
                 (buffer-substring-no-properties
                  (line-beginning-position)
                  (line-end-position)))))
      (when (string-match ".lnk$" file)
        (delete-region
         (line-beginning-position)
         (line-end-position))
        (if (file-directory-p
             (w32-symlinks-parse-symlink file))
            (insert
             (concat
              (w32-symlinks-parse-symlink file) "/"))
          (insert (w32-symlinks-parse-symlink file)))))))

(setq list-faces-sample-text "abcdefg ABCDEFG にほんご 日本語 アイウエオ")


(provide 'init-ntemacs)
;;; init-ntemacs.el ends here
