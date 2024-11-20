(add-to-list 'load-path "/home/mparlaktuna/.emacs.d/rtags/")

(use-package rtags
  :config
  ;; (unless (rtags-executable-find "rc") (error "Binary rc is not installed!"))
  ;; (unless (rtags-executable-find "rdm") (error "Binary rdm is not installed!"))

  (define-key c-mode-base-map (kbd "C-.") 'rtags-find-symbol-at-point)
  (define-key c-mode-base-map (kbd "C-,") 'rtags-find-references-at-point)
  (define-key c-mode-base-map (kbd "C-?") 'rtags-display-summary)
  (rtags-enable-standard-keybindings)
  (setq rtags-use-helm t)
    (add-hook 'kill-emacs-hook 'rtags-quit-rdm)
  :bind (("C-c E" . rtags-find-symbol)
  	 ("C-c e" . rtags-find-symbol-at-point)
  	 ("C-c O" . rtags-find-references)
  	 ("C-c o" . rtags-find-references-at-point)
  	 ("C-c s" . rtags-find-file)
  	 ("C-c v" . rtags-find-virtuals-at-point)
  	 ("C-c F" . rtags-fixit)
  	 ("C-c f" . rtags-location-stack-forward)
  	 ("C-c b" . rtags-location-stack-back)
  	 ("C-c n" . rtags-next-match)
  	 ("C-c p" . rtags-previous-match)
  	 ("C-c P" . rtags-preprocess-file)
  	 ("C-c R" . rtags-rename-symbol)
  	 ("C-c x" . rtags-show-rtags-buffer)
  	 ("C-c T" . rtags-print-symbol-info)
  	 ("C-c t" . rtags-symbol-type)
  	 ("C-c I" . rtags-include-file)
  	 ("C-c i" . rtags-get-include-file-for-symbol))
    ;; Shutdown rdm when leaving emacs.
)

(use-package company
  :config
  (global-company-mode)
  (add-hook 'after-init-hook 'global-company-mode)
  (global-set-key (kbd "M-/") 'company-rtags)
  ;; (setq company-idle-delay 0)
  )

(setq rtags-completions-enabled t)
;; (push 'company-rtags company-backends)
(setq company-backends '(( company-yasnippet company-capf company-dabbrev-code)))

(define-key c-mode-base-map (kbd "<C-tab>") (function company-complete))
(use-package flycheck

  :config
  (global-flycheck-mode))

(setq rtags-autostart-diagnostics t)
(defun my-flycheck-rtags-setup ()
  (flycheck-select-checker 'rtags)
  (setq-local flycheck-highlighting-mode nil) ;; RTags creates more accurate overlays.
  (setq-local flycheck-check-syntax-automatically nil))
(add-hook 'c-mode-hook #'my-flycheck-rtags-setup)
(add-hook 'c++-mode-hook #'my-flycheck-rtags-setup)
(add-hook 'objc-mode-hook #'my-flycheck-rtags-setup)
(define-key c-mode-base-map (kbd "<C-tab>") (function company-complete))

(use-package helm-rtags
  :config
  (setq rtags-display-result-backend 'helm))


(setq rtags-completions-enabled t)
(push 'company-rtags company-backends)
(global-company-mode)
(define-key c-mode-base-map (kbd "<C-tab>") (function company-complete))

(setq rtags-display-result-backend 'helm)
(eval-after-load 'company
  '(define-key company-active-map (kbd "C-c h") #'company-quickhelp-manual-begin))

(use-package flycheck-rtags
  :config
  (defun setup-flycheck-rtags ()
    (flycheck-select-checker 'rtags)
    (setq-local flycheck-highlighting-mode nil) ;; RTags creates more accurate overlays.
    (setq-local flycheck-check-syntax-automatically nil)
    (rtags-set-periodic-reparse-timeout 2.0)  ;; Run flycheck 2 seconds after being idle.
    )
  (add-hook 'c-mode-hook #'setup-flycheck-rtags)
  (add-hook 'c++-mode-hook #'setup-flycheck-rtags)
  )
