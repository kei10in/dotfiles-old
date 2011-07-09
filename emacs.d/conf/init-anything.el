;;; init-anything.el --- anything configurations

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

;; (auto-install-bath "anything")

;;; Code:

(require 'init-user-profile)

(defvar anything-mode-dir
  (concat private-site-lisp-dir "anything/"))

(add-to-list 'load-path
             (expand-file-name anything-mode-dir))

(require 'anything-startup)


(global-set-key (kbd "C-x b") 'anything-for-files)

(setq anything-for-files-prefered-list
  '(anything-c-source-ffap-line
    anything-c-source-ffap-guesser
    anything-c-source-buffers+
    anything-c-source-files-in-current-dir+
    anything-c-source-recentf
    anything-c-source-bookmarks
    anything-c-source-file-cache
    anything-c-source-locate))


(provide 'init-anything)
;;; init-anything.el ends here
