(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/config")
(load "theme.el")
(load "interface.el")
(load "helm_conf.el")
(load "completion.el")
(load "lisp_config.el")
;; (load "exwm_config.el")
;; (load-file ".emacs.d/completion.el")
(set-face-attribute 'default nil :height 100)

(setq tramp-verbose 10)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (cmake-mode cmake-ide helm-sly sly-asdf sly-hello-world sly-macrostep sly-named-readtables sly-quicklisp sly-repl-ansi-color sly yasnippet-snippets yasnippet-classic-snippets yasnippet company magit use-package helm boon zenburn-theme)))
 '(safe-local-variable-values
   (quote
    ((Lowercase . Yes)
     (Base . 10)
     (Syntax . ANSI-Common-Lisp)
     (Package . CLIM-DEMO)
     (indent-tabs)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'dired-find-alternate-file 'disabled nil)
