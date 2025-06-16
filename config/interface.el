(use-package boon
  :straight t
  :config
  (require 'boon-qwerty)
  (boon-mode)
  (define-key boon-command-map "m" 'boon-toggle-comment)
  (define-key boon-command-map "C" 'my-copy-to-next-window)
  (define-key boon-command-map "S" 'save-buffer)
  (define-key boon-command-map "T" 'run-in-vterm)
  (define-key boon-command-map "U" 'ace-window))


(show-paren-mode)
(electric-pair-mode)

;; (add-hook 'slime-repl-mode-hook 'turn-off-boon-mode)
;; (add-hook 'sldb-hook 'turn-off-boon-mode)
;; (add-hook 'sly-db-hook 'turn-off-boon-mode)
;; (add-hook 'sly-mrepl-hook 'turn-off-boon-mode)
;; (global-set-key (kbd "<RET>") 'newline-and-indent)

;; (add-to-list 'load-path "~/.emacs.d/common-lisp-snippets")
;; (require 'common-lisp-snippets)
;; (yas-global-mode 1)
