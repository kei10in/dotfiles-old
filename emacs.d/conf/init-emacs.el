;;; -*- mode: emacs-lisp; coding: utf-8 -*-

;; ; Emacs Global Configurations

;; Default major mode
(setq default-major-mode 'text-mode)

;; デバッグ モード
(setq debug-on-error nil)

;;; Set file search path
(dolist (dir (list
              (expand-file-name "~/local/bin")
              (expand-file-name "~/local/sbin")
              "/opt/local/bin"
              "/opt/bin"
              "/usr/local/bin"
              "/usr/bin"
              "/bin"
              "/opt/local/sbin"
              "/opt/sbin"
              "/usr/local/sbin"
              "/usr/sbin"
              "/sbin"
              "/usr/X11R6/bin"
              ))
  ;; PATH と exec-path に同じ物を追加します
  (when (and (file-exists-p dir) (not (member dir exec-path)))
    (setenv "PATH" (concat dir ":" (getenv "PATH")))
    (setq exec-path (append (list dir) exec-path))))


;;;============================================================================;
;;; Global Appearances
;;; 各 Windows mode に関わる設定は別ファイルを参照
;;;============================================================================;
;;;------------------------------------;
;;; Hide startup message.
;;;------------------------------------;
(setq inhibit-startup-message t)
;;; *scratch* の初期メッセージを設定
(setq initial-scratch-message "")
;;;------------------------------------;
;;; menu bar
;;;------------------------------------;
;; (if (not run-no-window)
;;     (menu-bar-mode t)
;;   (menu-bar-mode nil))
(menu-bar-mode (if run-no-window nil t))
;;;------------------------------------;
;;; tool bar
;;;------------------------------------;
(if (not run-no-window)
    (tool-bar-mode -1))
;;;------------------------------------;
;;; Cursor configurations
;;;------------------------------------;
;(blink-cursor-mode 0)
;(setq cursor-in-non-selected-windows t)
;;;------------------------------------;
;;; Text Width Configurations
;;;------------------------------------;
;;; Truncate lines
(setq truncate-lines t)
;;; Truncate-lines in partial window
(setq truncate-partial-width-windows t)
;;;------------------------------------;
;;; Show line and column numbers
;;;------------------------------------;
(line-number-mode t)
(column-number-mode t)
;;;------------------------------------;
;;; Show clock
;;;------------------------------------;
;(setq display-time-day-and-date t
;      display-time-24hr-format t)
;(setq display-time-format "%m/%d(%a) %H:%M")
;(display-time)
;;;------------------------------------;
;;; Stop visible bell
;;;------------------------------------;
(setq visible-bell nil)
;;;------------------------------------;
;;; Tab configurations
;;;------------------------------------;
;;; Use SPC as TAB
(setq-default indent-tabs-mode nil)
;;; Tab Width
(setq-default tab-width 4)
;;; Follow before line indentation
(setq indent-line-function 'indent-relative-maybe)
;;;------------------------------------;
;;; line height
;;; 整数で指定するとピクセル数で、
;;; 少数で指定すると行の高さに対して
;;; 相対値で設定されます。
;;;------------------------------------;
(setq-default line-spacing 1)

;;;------------------------------------;
;;; Emacs Face
;;;------------------------------------;
;;; default face
(custom-set-faces
 (if run-no-window
     ;; for console emacs
     '(default ((t
                 (:background "black")
                 ;; (:background "white" :foreground "black")
                 )))
   ;; for Cocoa, X, NTEmacs
   '(default ((t
               (:background "black" :foreground "#55FF55")
               ;; (:background "white" :foreground "black")
               )))
   ))
;;; cursor face
(custom-set-faces
 '(cursor ((((class color)
             (background dark))
            (:background "#00AA00"))
           (((class color)
             (background light))
            (:background "#999999"))
           (t ())
           )))

;;; カーソルの点滅
(blink-cursor-mode t)

;; Dialog Box を使うかどうか
(setq use-dialog-box t)

;;;----------------------------------------------------------------------------;
;;; Key bindings
;;;----------------------------------------------------------------------------;
;;; Modify C-h to Backspace.
(load "term/bobcat")
(terminal-init-bobcat)
;;; Delete region by C-h
(delete-selection-mode 1)
;;; Modify C-% to query-replace-regexp
(global-set-key (read-kbd-macro "C-%") 'query-replace-regexp)
(global-set-key "\C-c:" 'comment-or-uncomment-region)
(global-set-key (kbd "C-c <tab>") 'ff-find-other-file)
;;-----------------------------------------------------------------
;; Open url URLをデフォルトブラウザで開く(C-x c)
;;-----------------------------------------------------------------
(setq browse-url-browser-function 'browse-url-generic)
(setq browse-url-generic-program "open")
(global-set-key "\C-x\C-]" 'browse-url-at-point)
;;;; help
(global-set-key "\C-x?" 'help)
(global-set-key "\M-?" 'help-for-help)
;;;; Delete new-line char by kill-line (t)
;(setq kill-whole-line t)
;; ; マウスホイールの設定
;; ;; マウスホイールでのスクロール速度の設定
(setq mouse-wheel-scroll-amount '(3 ((shift) . 10) ((control) . nil)))
;; ;; マウスホイールでのスクロールの加速をするかどうか
(setq mouse-wheel-progressive-speed nil) 


;;-----------------------------------------------------------------------------;
;; Start emacs server 
;;-----------------------------------------------------------------------------;
;; emacs 23 だとエラーになる．
;(server-start)

;;-----------------------------------------------------------------------------;
;; Auto backup
;;-----------------------------------------------------------------------------;
(setq make-backup-files t)

;;-----------------------------------------------------------------------------;
;; Auto Save
;;-----------------------------------------------------------------------------;
; Create auto save files
(setq auto-save-default nil)
; Delete auto saved files
(setq delete-auto-save-files nil)
; Don't make ~/.saves-PID-hostname
(setq auto-save-list-file-prefix nil)

;;-----------------------------------------------------------------------------;
;; Exiting Configurations
;;-----------------------------------------------------------------------------;
;;; Confirm when exiting emacs
(setq confirm-kill-emacs 'y-or-n-p)

;;-----------------------------------------------------------------------------;
;; To editable compressed files and prevent info written in Japanese
;;-----------------------------------------------------------------------------;
(auto-compression-mode t)

;;-----------------------------------------------------------------------------;
;; yes/noを、y/nで選択できるようにする。
;;-----------------------------------------------------------------------------;
;(fset 'yes-or-no-p 'y-or-n-p)

;;-----------------------------------------------------------------
;; Completion
;; http://d.hatena.ne.jp/khiker/20061220/1166643421
;;-----------------------------------------------------------------
; ignore directories
(add-to-list 'completion-ignored-extensions ".svn/")
; ignore cases
(setq completion-ignore-case t)
(setq read-file-name-completion-ignore-case t)

;;-----------------------------------------------------------------
;; Gabage Collection
;;-----------------------------------------------------------------
;(setq gc-cons-threshold (* 64 (* 1024 1024)))

;;-----------------------------------------------------------------
;; Open path under the cursor (move caret to path and C-x f)
;;-----------------------------------------------------------------
(ffap-bindings)

;;-----------------------------------------------------------------
;; Add private info directory
;;-----------------------------------------------------------------
;(setq Info-default-directory-list
;      (cons "~/.emacs.d/info/" Info-default-directory-list))

;;-----------------------------------------------------------------
;; 記号やその他の文字等を正しくマッピングする
;; Emacs辞典p.395
;; http://www.pqrs.org/~tekezo/emacs/doc/wide-character/index.html
;;-----------------------------------------------------------------
(when run-emacs22
  (utf-translate-cjk-set-unicode-range
   '((#x00a2 . #x00a3)
	 (#x00a7 . #x00a8)
	 (#x00ac . #x00ac)
	 (#x00b0 . #x00b1)
	 (#x00b4 . #x00b4)
	 (#x00b6 . #x00b6)
	 (#x00d7 . #x00d7)
	 (#X00f7 . #x00f7)
	 (#x0370 . #x03ff)
	 (#x0400 . #x04FF)
	 (#x2000 . #x206F)
	 (#x2100 . #x214F)
	 (#x2190 . #x21FF)
	 (#x2200 . #x22FF)
	 (#x2300 . #x23FF)
	 (#x2500 . #x257F)
	 (#x25A0 . #x25FF)
	 (#x2600 . #x26FF)
	 (#x2e80 . #xd7a3)
	 (#xff00 . #xffef)))
  )