;;; init-textmodes.el --- text modes configurations

;; Copyright (C) 2013  Keisuke Ijuin

;; Author: Keisuke Ijuin <kei10in@gmail.com>
;; Keywords: 

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


;; HTML + CSS
(require 'init-html)
(require 'init-css)
;; reStructured Text
(require 'init-rst)
;; Markdown
(require 'init-markdown)
;; Org Mode
(require 'init-org)

(provide 'init-textmodes)
;;; init-textmodes.el ends here
