;; php-mode
(load-library "php-mode")
(require 'php-mode)
(add-hook 'php-mode-hook
          '(lambda ()
			 (setq c-basic-offset 4)
			 (setq indent-tabs-mode nil)
			 ))
		  