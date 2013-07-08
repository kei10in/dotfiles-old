;;; init-helm.el --- helm configurations

;; Copyright (C) 2011  Keisuke Ijuin

;; Author: Keisuke Ijuin <kei10in@gmail.com>
;; Keywords: extensions

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

;;; Code:

(require 'init-user-profile)

(require 'helm)
(require 'helm-config)

(global-set-key (kbd "C-x b") 'helm-for-files)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-f") 'helm-find-files)

(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action)
(define-key helm-map (kbd "C-z") 'helm-select-action)

(helm-mode 1)
(add-to-list 'helm-completing-read-handlers-alist '(find-file-at-point . nil))
(add-to-list 'helm-completing-read-handlers-alist '(dired-at-point . nil))


(setq helm-ff-auto-update-initial-value nil)
(setq helm-idle-delay 0.001)
(setq helm-input-idle-delay 0.001)
(setq helm-buffer-max-length 50)


(defvar my/helm-source-files-in-current-dir
  `((name . "Files from Current Directory")
    (candidates . (lambda ()
                    (with-helm-current-buffer
                      (let ((dir (helm-current-directory)))
                        (when (file-accessible-directory-p dir)
                          (directory-files dir nil))))))
    (keymap . ,helm-generic-files-map)
    (no-delay-on-input)
    (help-message . helm-generic-file-help-message)
    (mode-line . helm-generic-file-mode-line-string)
    (type . file)))

(setq helm-for-files-preferred-list
  '(helm-source-buffers-list
    my/helm-source-files-in-current-dir
    helm-source-recentf
    helm-source-bookmarks
    helm-source-file-cache
    helm-source-buffer-not-found
    ))

(provide 'init-helm)
;;; init-helm.el ends here
