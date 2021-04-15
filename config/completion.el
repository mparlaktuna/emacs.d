(use-package company
  :defer 2
  :diminish
  :custom
  (company-begin-commands '(self-insert-command))
  (company-idle-delay .1)
  (company-minimum-prefix-length 2)
  (company-show-numbers t)
  (company-tooltip-align-annotations 't)
  (global-company-mode t))

;; (slime-setup '(slime-fancy slime-company))

;; (use-package slime-company
;;   :after (slime company)
;;   :config (setq slime-company-completion 'fuzzy
;;                 slime-company-after-completion 'slime-company-just-one-space))
(with-eval-after-load 'company
  (define-key company-active-map (kbd "<return>") nil)
  (define-key company-active-map (kbd "RET") nil)
  (define-key company-active-map (kbd "C-SPC") #'company-complete-selection))

(define-key company-active-map (kbd "\C-n") 'company-select-next)
(define-key company-active-map (kbd "\C-p") 'company-select-previous)
(define-key company-active-map (kbd "\C-d") 'company-show-doc-buffer)
(define-key company-active-map (kbd "M-.") 'company-show-location)


(require 'yasnippet)
(yas-global-mode 1)

(add-to-list 'load-path "~/.emacs.d/common-lisp-snippets")
(require 'common-lisp-snippets)
