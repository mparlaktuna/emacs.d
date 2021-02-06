(require 'boon-qwerty)
(boon-mode)
(define-key boon-command-map "m" 'boon-toggle-comment)
(define-key boon-command-map "C" 'my-copy-to-next-window)
(define-key boon-command-map "S" 'save-buffer)
(define-key boon-command-map "T" 'run-in-vterm)
(define-key boon-command-map "U" 'ace-window)

(add-hook 'slime-repl-mode-hook 'turn-off-boon-mode)
(add-hook 'sldb-hook 'turn-off-boon-mode)

(show-paren-mode)
(electric-pair-mode)

(add-to-list 'load-path "~/.emacs.d/common-lisp-snippets")
(require 'common-lisp-snippets)
(yas-global-mode 1)
