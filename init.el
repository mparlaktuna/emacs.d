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
(set-face-attribute 'default nil :height 120)

(global-set-key (kbd "C-c <left>")  'windmove-left)
(global-set-key (kbd "C-c <right>") 'windmove-right)
(global-set-key (kbd "C-c <up>")    'windmove-up)
(global-set-key (kbd "C-c <down>")  'windmove-down)

(iswitchb-mode 1)
(setq tramp-verbose 10)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (elf-mode rtags geiser-mit geiser geiser-guile markdown-preview-mode markdown-mode helm-sly sly sly-asdf sly-hello-world sly-macrostep sly-named-readtables sly-quicklisp sly-repl-ansi-color dockerfile-mode yaml-mode yaml zzz-to-char cmake-mode cmake-ide yasnippet-snippets yasnippet-classic-snippets yasnippet company magit use-package helm boon zenburn-theme)))
 '(safe-local-variable-values
   (quote
    ((eval cl-flet
	   ((enhance-imenu-lisp
	     (&rest keywords)
	     (dolist
		 (keyword keywords)
	       (add-to-list
		(quote lisp-imenu-generic-expression)
		(list
		 (purecopy
		  (concat
		   (capitalize keyword)
		   (if
		       (string=
			(substring-no-properties keyword -1)
			"s")
		       "es" "s")))
		 (purecopy
		  (concat "^\\s-*("
			  (regexp-opt
			   (list
			    (concat "define-" keyword))
			   t)
			  "\\s-+\\(" lisp-mode-symbol-regexp "\\)"))
		 2)))))
	   (enhance-imenu-lisp "bookmarklet-command" "class" "command" "ffi-method" "function" "mode" "parenscript" "user-class"))
     (movitz-mode . t)
     (Lowercase . Yes)
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
