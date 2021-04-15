;; (add-to-list 'load-path "~/.emacs.d/slime")
;; (require 'slime-autoloads)

(setq inferior-lisp-program "/usr/bin/sbcl --dynamic-space-size 8000")

(eval-after-load 'sly
  `(define-key sly-prefix-map (kbd "M-h") 'sly-documentation-lookup))
