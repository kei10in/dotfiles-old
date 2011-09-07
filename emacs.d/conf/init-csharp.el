;;; init-csharp.el --- setup csharp-mode

;; Copyright (C) 2011  Keisuke Ijuin

;; Author: Keisuke Ijuin <kei10in@gmail.com>
;; Keywords: tools

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

;; Project Home Page
;; http://code.google.com/p/csharpmode/

;; (install-elisp-from-emacswiki "csharp-mode.el")

;;; Code:


(require 'init-cc)
(require 'csharp-mode)


(setq auto-mode-alist
      (append '(("\\.cs$" . csharp-mode)) auto-mode-alist))

(add-hook 'csharp-mode-hook
          '(lambda ()
             (local-unset-key (kbd "{"))
             ))


(provide 'init-csharp)
;;; init-csharp.el ends here
