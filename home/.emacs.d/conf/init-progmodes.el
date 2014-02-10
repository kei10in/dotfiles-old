;;; init-progmodes.el --- program modeds configurations

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

;;;-------------------------
;;; Development Environment
;;;-------------------------
(require 'init-flymake)
(require 'init-pos-tip)
(require 'init-auto-complete)
(require 'init-yasnippet)

;;;==================================;
;;; Programing Language
;;;==================================;

;; cc-mode
(require 'init-cc)
;; C
(require 'init-c)
;; C++
(require 'init-c++)
;; Objective-C
(require 'init-objc)
;; C#
; (require 'init-csharp)
;; Python
(require 'init-python)
;; Ruby
(require 'init-ruby)
;; PHP
(require 'init-php)
;; Java
(require 'init-java)
;; Scala
(require 'init-scala)
;; Groovy
(require 'init-groovy)
;; Javascript
(require 'init-javascript)


(provide 'init-progmodes)
;;; init-progmodes.el ends here
