;;; -*- mode: emacs-lisp; coding: utf-8 -*-

;;; init-fundamentals.el --- emacs global setting

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
(require 'init-user-profile)
(require 'init-package)


;;; Info Mode:
(eval-after-load "info" '(require 'info+))
(require 'info)
(setq Info-default-directory-list
  (cons (expand-file-name "~/.emacs.d/info/")
        Info-default-directory-list))


;;; Grep
(require 'igrep)
(require 'grep-a-lot)
(grep-a-lot-setup-keys)
;; for igrep users
(grep-a-lot-advise igrep)
(setq igrep-options "--exclude-dir=.svn --exclude-dir=.git --exclude-dir=.hg -EIr")


;;; Ack - http://betterthangrep.com/
(require 'full-ack)
(setq ack-context 0)
(setq ack-prompt-for-directory t)


;;; Goto last change
(require 'goto-chg)
(global-set-key (kbd "C-.") 'goto-last-change)
(global-set-key (kbd "C-,") 'goto-last-change-reverse)


;;; Undo / Redo
(require 'undo-tree)
(global-undo-tree-mode)
;; 大量の undo に耐えれるようにする．
(setq undo-limit 60000)
(setq undo-strong-limit 90000)


(provide 'init-fundamentals)
;;; init-fundamentals.el ends here
