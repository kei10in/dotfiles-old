;;; -*- mode: emacs-lisp; coding: utf-8 -*-

;;; init-emacs.el --- emacs global setting

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

(require 'detectenv)

;; Default major mode
(setq major-mode 'text-mode)

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

;;; Hide startup message.
(setq inhibit-startup-message t)


;;; Set initial message for *scratch* buffer.
(setq initial-scratch-message "")


;;; Menu bar:
(menu-bar-mode (if run-no-window nil t))


;;; Tool bar:
(if (not run-no-window) (tool-bar-mode -1))


;;; Cursor configurations
(blink-cursor-mode t)
;; (setq cursor-in-non-selected-windows t)


;;; Text Width Configurations
;; Truncate lines
(setq truncate-lines t)
;; Truncate-lines in partial window
(setq truncate-partial-width-windows t)


;;; Show line and column numbers
(line-number-mode t)
(column-number-mode t)


;;; Show clock
;; (setq display-time-day-and-date t
;;       display-time-24hr-format t)
;; (setq display-time-format "%m/%d(%a) %H:%M")
;; (display-time)


;;; Stop visible bell
(setq visible-bell nil)


;;; Tab indent configurations
;; Use SPC as TAB
(setq-default indent-tabs-mode nil)
;; Tab Width
(setq-default tab-width 4)
;; Follow before line indentation
(setq indent-line-function 'indent-relative-maybe)


;;;------------------------------------;
;;; line height
;;; 整数で指定するとピクセル数で、
;;; 少数で指定すると行の高さに対して
;;; 相対値で設定されます。
;;;------------------------------------;
(setq-default line-spacing 0.1)


;;; Use dialog on gui manipulation.
(setq use-dialog-box t)


;;; Change buffer name display format
(require 'uniquify)
;; forward:        bar/mumble/name  quux/mumble/name
;; reverse:        name\\mumble\\bar  name\\mumble\\quux
;; post-forward:   name|bar/mumble  name|quux/mumble
;; post-forward-angle-brackets:   name<bar/mumble>  name<quux/mumble>
;; nil:            name  name<2>
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)
;; ignore special buffer
(setq uniquify-ignore-buffers-re "*[^*]+*")


;;; Key bindings:
;; Modify C-h to Backspace.
(defun terminal-init-bobcat ()
  "Terminal initialization function for bobcat."
  ;; HP terminals usually encourage using ^H as the rubout character
  (keyboard-translate ?\177 ?\^h)
  (keyboard-translate ?\^h ?\177))
(terminal-init-bobcat)

;; Delete region by C-h
(delete-selection-mode 1)

;; Modify C-% to query-replace-regexp
(global-set-key (read-kbd-macro "C-%") 'query-replace-regexp)
(global-set-key (kbd "C-c :") 'comment-or-uncomment-region)
(global-set-key (kbd "C-c <tab>") 'ff-find-other-file)
(global-unset-key (kbd "C-z"))

;; global text scale mode
(define-globalized-minor-mode
  global-text-scale-mode
  text-scale-mode
  (lambda () (text-scale-mode 1)))
(defun global-text-scale-adjust (inc) (interactive "p")
  (if (= inc 0)
      (progn
       (global-text-scale-adjust (- text-scale-mode-amount))
       (global-text-scale-mode -1))
    (progn
     (text-scale-set 1)
     (kill-local-variable 'text-scale-mode-amount)
     (setq-default text-scale-mode-amount (+ text-scale-mode-amount inc))
     (global-text-scale-mode 1))))
(defun global-text-scale-reset () (interactive) (global-text-scale-adjust 0))
(defun global-text-scale-increase (inc) (interactive "p")
  (global-text-scale-adjust inc))
(defun global-text-scale-decrease (dec) (interactive "p")
  (global-text-scale-increase (- dec)))
(global-set-key (kbd "M-0") 'global-text-scale-reset)
(global-set-key (kbd "M-=") 'global-text-scale-increase)
(global-set-key (kbd "M--") 'global-text-scale-decrease)
(global-set-key (kbd "<M-wheel-up>") 'global-text-scale-increase)
(global-set-key (kbd "<M-wheel-down>") 'global-text-scale-decrease)


;; Find File
;; C-x C-f を find-file-at-point にする
(require 'find-file)
(global-set-key (kbd "C-c <tab>") 'ff-find-other-file)
(ffap-bindings)
(setq ff-other-file-alist
      '(
        ("\\.[hH][pP][pP]$" (".cpp" ".CPP" ".cxx" ".CXX"))
        ("\\.[cC][pP][pP]$" (".hpp" ".HPP" ".h"))

        ("\\.[hH][hH]$"  (".cc" ".CC"))
        ("\\.[cC][cC]$"  (".hh" ".HH" ".h" ".H"))

        ("\\.[cC][xX][xX]$" (".hh" ".h"))
        
        ("\\.[hH]$"   (".cpp" ".CPP" ".cc" ".CC" ".c" ".C" ".cxx" ".m" ".mm"))
        ("\\.[cC]$"   (".h" ".H"))
        
        ("\\.mm?$" (".h"))
        ))


;; help
(global-set-key "\C-x?" 'help)
(global-set-key "\M-?" 'help-for-help)


;;;; Delete new-line char by kill-line (t)
;; (setq kill-whole-line t)


;;; Mouse wheel configurations
;; Mouse wheel scroll speed
(setq mouse-wheel-scroll-amount '(3 ((shift) . 10) ((control) . nil)))
;; Mouse wheel acceleration
(setq mouse-wheel-progressive-speed nil) 


;;; emacs server
;; (server-start)


;; Auto backup
(setq make-backup-files t)


;;; Auto Save
;; Create auto save files
(setq auto-save-default nil)
;; Delete auto saved files
(setq delete-auto-save-files nil)
;; Don't make ~/.saves-PID-hostname
(setq auto-save-list-file-prefix nil)


;;; Confirm when exiting emacs
(setq confirm-kill-emacs 'y-or-n-p)


;;; To editable compressed files and prevent info written in Japanese
(auto-compression-mode t)


;;; Completion:
;; http://d.hatena.ne.jp/khiker/20061220/1166643421
;; ignore directories
(add-to-list 'completion-ignored-extensions ".svn/")
;; ignore cases
(setq completion-ignore-case t)
(setq read-file-name-completion-ignore-case t)


;;; Emacs lock:
;; disable kill-buffer *scratch*
(require 'emacs-lock)
(save-excursion
  (set-buffer "*scratch*")
  (emacs-lock-mode 'kill))


;;; Highlight line
(require 'hl-line)
(global-hl-line-mode)

;;; Emacs runtime environment
(require 'init-runtime-environment)

(load-theme 'classical-console t)

(provide 'init-emacs)
;;; init-emacs.el ends here
