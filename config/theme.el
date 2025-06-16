(use-package zenburn-theme
  :straight t
  :config
  (load-theme 'zenburn t)
  (setq zenburn-use-variable-pitch t)
  (setq zenburn-scale-org-headlines t)
  (setq zenburn-scale-outline-headlines t))

(menu-bar-mode -1)
(tool-bar-mode -1)
(toggle-scroll-bar -1)
(setq make-backup-files nil)
