(setq package-enable-at-startup nil)
(straight-use-package 'zenburn-theme)
(straight-use-package 'use-package)

(load-file "~/.emacs.d/config/theme.el")
(load-file "~/.emacs.d/config/interface.el")

(use-package magit
  :straight t)
