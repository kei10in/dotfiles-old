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

(setq helm-for-files-prefered-list
  '(helm-c-source-ffap-line
    helm-c-source-ffap-guesser
    helm-c-source-buffers+
    helm-c-source-files-in-current-dir
    helm-c-source-recentf
    helm-c-source-bookmarks
    helm-c-source-file-cache
    helm-c-source-locate
    helm-c-source-buffer-not-found
    ))

(setq helm-buffer-max-length 50)

(provide 'init-helm)
;;; init-helm.el ends here
