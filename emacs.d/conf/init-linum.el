;; -*- mode: emacs-lisp; coding: utf-8 -*-

(require 'linum)
;;; 最低幅を設定したうえで，常に右寄せで表示させる
(setq linum-format
      '(lambda (line)
        (let ((fmt
               (let ((min-w 4)
                     (w (length (number-to-string
                                 (count-lines (point-min) (point-max))))))
                 (concat "%"
                         (number-to-string (if (< min-w w) w min-w))
                         "d"))))
          (propertize (format fmt line) 'face 'linum))))
(global-linum-mode)
