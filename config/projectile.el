(use-package projectile
  :config
  (projectile-global-mode)
  (setq projectile-enable-caching t)
  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
  ;; (setq projectile-project-search-path '("~/percv_workspace"))
  )


(use-package helm-projectile
  :config
  (setq projectile-completion-system 'helm)
  (helm-projectile-on)
)

(defcustom projectile-project-root-functions
  '(projectile-root-local
    projectile-root-marked
    projectile-root-bottom-up
    projectile-root-top-down
    projectile-root-top-down-recurring)
  "A list of functions for finding project roots."
  :group 'projectile
  :type '(repeat function))
