;;; init-twitter.el --- twitter mode setting

;; Copyright (C) 2010  Keisuke Ijuin

;; Author: Keisuke Ijuin <kei10in@gmail.com>
;; Keywords: twitter

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


;;; http://twmode.sourceforge.net/ja/


(require 'twittering-mode)

(setq twittering-icon-mode t)
(setq twittering-auth-method 'xauth)

(setq twittering-status-format
      "%i %s (%S),  %C{%H:%M:%S}:\n%FOLD[  ]{%T \nfrom %f%L%r%R}\n ")

(provide 'init-twitter)
;;; init-twitter.el ends here
