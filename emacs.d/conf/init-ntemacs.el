;; -*- mode: emacs-lisp; coding: utf-8 -*-

;(set-language-environment "UTF-8")
;(set-language-environment "ASCII")
(set-clipboard-coding-system            'utf-16le)

(when (string-match current-language-environment "Japanese")
  ;(set-default-coding-systems             'nil)
  (set-keyboard-coding-system             'sjis)
  (set-clipboard-coding-system            'utf-16le)
  (setq file-name-coding-system 'japanese-shift-jis))

;; 等幅フォント設定
(when (and run-emacs22
		   (locate-library "fixed-width-fontset"))
  (require 'fixed-width-fontset)
  (require 'ntemacs-font)

  (setq fixed-width-xlfd-template
    "-*-%s-normal-r-normal-normal-%d-*-*-*-*-*-iso8859-1")
 
  (when (x-list-fonts "*ＭＳ ゴシック*")
    (defvar ntemacs-font-encode-family-list-myfont
      `(
	(ascii . "Consolas")
	(japanese-jisx0208 . "ＭＳ ゴシック*")
;	(japanese-jisx0208 . "IPAゴシック*")
	(katakana-jisx0201 . "ＭＳ ゴシック*")
	(chinese-gb2312     . "NSimSun*")
	(chinese-cns11643-1 . "NSimSun*")
	(chinese-cns11643-2 . "NSimSun*")
	(chinese-cns11643-3 . "NSimSun*")
	(chinese-cns11643-4 . "NSimSun*")
	(chinese-cns11643-5 . "NSimSun*")
	(chinese-cns11643-6 . "NSimSun*")
	(chinese-cns11643-7 . "NSimSun*")
	(chinese-big5-1 . "MingLiU*")
	(chinese-sisheng . "NSimSun")
	(korean-ksc5601 . "Dotum*")
	(thai-tis620 . "Consolas*")
	(latin-iso8859-3 . "Consolas*")
	(cyrillic-iso8859-5 . "Consolas")
	(greek-iso8859-7 . "Consolas*")
	(hebrew-iso8859-8 . "Consolas*")
	(latin-iso8859-9 . "Consolas*")
	(latin-iso8859-15 . "Consolas*")
	(ipa . "ＭＳ ゴシック*")
	(ethiopic . "Ethiopia Jiret")
	(vietnamese-viscii-lower . "Arial Unicode MS*")
	(vietnamese-viscii-upper . "Arial Unicode MS*")
	(lao . "Consolas*")
	(tibetan . "Consolas*")
	(tibetan-1-column . "Consolas*")
	(arabic-1-column . "Consolas*")
	(arabic-2-column . "Consolas*")
	((,(decode-char 'ucs #x2800) . ,(decode-char 'ucs #x28ff)) . "Braille*") ;; Braille
	((,(decode-char 'ucs #x5361) . ,(decode-char 'ucs #x5361)) . "NSimSun*")
	(mule-unicode-0100-24ff . "Consolas*")
	(mule-unicode-2500-33ff . "Arial Unicode MS*")
	(mule-unicode-e000-ffff . "Consolas*")
	))

    (fixed-width-create-fontset "myfont"
				ntemacs-font-defined-sizes
				ntemacs-font-encode-family-list-myfont))

  (setq fixed-width-rescale nil)
  (setq w32-use-w32-font-dialog nil)
  (setq w32-enable-synthesized-fonts t)

  (setq default-frame-alist
	(append
	 (list
	  '(font . "fontset-myfont")
	  )
	 default-frame-alist))
  )

;; emacs 23 用フォント設定
(when run-emacs23
  (set-default-font "consolas-10")
)

;; frame の大きさ
(setq default-frame-alist
	  (append
	   (list
		'(height . 55)
		'(width . 86)
		)
	   default-frame-alist)
	  )

;; frame の色を設定する
(defun my-set-display-for-windowed-frames (frame)
  "Set display parameters for the current frame the way I like them."
  (select-frame frame)
  (set-background-color "black")
  (set-foreground-color "#55FF55")
)
(add-hook 'after-make-frame-functions 'my-set-display-for-windowed-frames)
(my-set-display-for-windowed-frames (selected-frame))


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
  ;; 深いディレクトリや別ドライブのディレクトリのファイルを開く際， Windows のショートカットを利用して簡単に開くことができます．
  ;; 情報源
  ;; Wiki でのリクエストをもとに書いたもの．
  ;; 何が問題なのか?
  ;; C-x C-fで別ドライブの深いディレクトリに移動するのは面倒なものです．
  ;; 何ができるのか?
  ;; 例えば，Gドライブへのショートカットを作っておけば，C-x C-f g-drive.lnk TAB で G ドライブへ移動できます．
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

;;

(setq list-faces-sample-text "abcdefg ABCDEFG にほんご 日本語 アイウエオ")



;;;; 未整理

;; このブロックは 
;; http://github.com/elim/dotemacs/blob/master//init-fonts.el
;; を参照
;; NTEmacs
;; http://ntemacsjp.sourceforge.jp/matsuan/FontSettingJp.html
;; (nt-p
;;  (setq w32-enable-synthesized-fonts t
;;        w32-use-w32-font-dialog t)

;;  (cond
;;   ;; emacs23
;;   ((<= 23 emacs-major-version)
;;    (set-default-font "ＭＳ ゴシック-10")
;;    (set-fontset-font (frame-parameter nil 'font)
;;                      'japanese-jisx0208
;;                      '("ＭＳ ゴシック" . "unicode-bmp")))

;;   (t
;;    (set-face-attribute 'default nil
;;                        :family "ＭＳ ゴシック"
;;                        :height 100)

;;    (set-fontset-font "fontset-default"
;;                      'japanese-jisx0208
;;                      '("ＭＳ ゴシック*" . "jisx0208-sjis"))

;;    (set-fontset-font "fontset-default"
;;                      'katakana-jisx0201
;;                      '("ＭＳ ゴシック*" . "jisx0201-katakana"))

;;    (add-to-list 'face-font-rescale-alist
;;                 `(,(encode-coding-string
;;                     ".*ＭＳ.*bold.*iso8859.*" 'emacs-mule) . 0.9))

;;    (add-to-list 'face-font-rescale-alist
;;                 `(,(encode-coding-string
;;                     ".*ＭＳ.*bold.*jisx02.*" 'emacs-mule) . 0.95)))))
