(require 'boon-qwerty)
(boon-mode)
(define-key boon-command-map "m" 'boon-toggle-comment)
(define-key boon-command-map "C" 'my-copy-to-next-window)
(define-key boon-command-map "S" 'save-buffer)
(define-key boon-command-map "T" 'run-in-vterm)
(define-key boon-command-map "U" 'ace-window)
;; (add-hook 'sly-mrepl-hook 'turn-off-boon-mode)
;; (add-hook 'sly-trace-dialog-mode-hook 'turn-off-boon-mode)
;; (add-hook 'sly-db-hook 'turn-off-boon-mode)
(add-to-list 'load-path "~/.emacs.d/slime")
(require 'slime-autoloads)
;; (setq inferior-lisp-program "/usr/bin/sbcl")


(add-hook 'slime-repl-mode-hook 'turn-off-boon-mode)
(add-hook 'sldb-hook 'turn-off-boon-mode)

(show-paren-mode)
(electric-pair-mode)

