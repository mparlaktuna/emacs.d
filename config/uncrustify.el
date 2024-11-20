(require 'uncrustify-mode)
(add-hook 'c-mode-common-hook 
   '(lambda ()
      (uncrustify-mode 1)))
