(setq package-archives '(("melpa" . "http://melpa.org/packages/")
			 ("nongnu" . "https://elpa.nongnu.org/nongnu/")))

(add-to-list 'load-path "~/.emacs.d/extra")
(add-to-list 'default-frame-alist '(fullscreen . maximized))

(progn ;     startup
  (defvar before-user-init-time (current-time)
    "Value of `current-time' when Emacs begins loading `user-init-file'.")
  (message "Loading Emacs...done (%.3fs)"
           (float-time (time-subtract before-user-init-time
                                      before-init-time)))
  (setq user-init-file (or load-file-name buffer-file-name))
  (setq user-emacs-directory (file-name-directory user-init-file))
  (message "Loading %s..." user-init-file)
  (setq package-enable-at-startup nil)
  (setq inhibit-startup-buffer-menu t)
  (setq inhibit-startup-screen t)
  (setq inhibit-startup-echo-area-message "locutus")
  (setq initial-buffer-choice t)
  (setq initial-scratch-message "")
  (setq load-prefer-newer t)
  (scroll-bar-mode 0)
  (tool-bar-mode 0)
  (menu-bar-mode 0)
  (set-face-attribute 'default nil :height 130)
  (electric-pair-mode 1)
  (setq make-backup-files nil)
  (setq auto-save-default nil)
  (global-auto-revert-mode t)
  (setq global-display-line-numbers-mode t)
  (setq compilation-ask-about-save nil)
  )

(setq geiser-guile-scheme-dir "/home/mparlaktuna/.emacs.d/elpa/geiser-guile-20240314.1950/src")
(setq geiser-guile-scheme-local-dir t)

(defun load-config (fn)
  (load (concat "~/.emacs.d/config/" fn)))

(require 'cc-mode)
(load-config "exwm.el")
(load-config "theme.el")
(load-config "packages.el")
(load-config "bazel.el")
(load-config "ssh.el")
(load-config "org.el")
(load-config "cpp.el")
(load-config "rtags.el")
(load-config "rtags_doxygen.el")
(load-config "magit.el")
(load-config "vterm.el")
(load-config "boon.el")
(load-config "yasnippet.el")
(load-config "helm.el")
(load-config "ace.el")
(load-config "uncrustify.el")
(load-config "projectile.el")
(load-config "auctex.el")
(load-config "complete.el")
(load-config "desktop_configs.el")
(load-config "registers.el")
;; (load-config "cppcheck.el")

;; (load "tree_sitter.el")
;; (load "docker.el")



;; (setq es-cc-endpoint "https://localhost:9200") ;





;; (use-package markdown-mode
;;   :ensure t
;;   :commands (markdown-mode gfm-mode)
;;   :mode (("README\\.md\\'" . gfm-mode)
;;          ("\\.md\\'" . markdown-mode)
;;          ("\\.markdown\\'" . markdown-mode))
;;   :init (setq markdown-command "multimarkdown"))




;; (setq neo-smart-open t)
;; (setq projectile-indexing-method 'native)

;; (global-set-key [f8] 'neotree-toggle)

;; (add-hook 'c-mode-common-hook (lambda() (local-set-key (kbd "C-c TAB") 'ff-find-other-file)))

;; (setq compilation-ask-about-save nil)

;; (mapc (lambda (item)
;; 	(add-to-list 'projectile-globally-ignored-directories item))
;;       '("-/bazel*" "-/html*" "-/output*" "-/coverage*"  "-/external*" "-/.git*" "*backup*"))

;; (load "rtags_config.el")
;; (load "rtags-doxygen.el")
;; (shackle-mode t)
;; (setq helm-display-function 'pop-to-buffer) ; make helm play nice
;; (setq shackle-rules '((compilation-mode :ignore t)
;; 		      ("\\`\\*helm.*?\\*\\'" :regexp t :popup t:align t :size 0.2)))


;; (global-set-key "\M- " 'hippie-expand)
;; (global-set-key (kbd "C-x C-p") 'string-inflection-lower-camelcase)
;; (put 'downcase-region 'disabled nil)

;; ;; For `eat-eshell-mode'.
;; (add-hook 'eshell-load-hook #'eat-eshell-mode)

;; ;; For `eat-eshell-visual-command-mode'.
;; (add-hook 'eshell-load-hook #'eat-eshell-visual-command-mode)

;; (use-package savehist
;;   :demand t
;;   :config
;;   (savehist-mode))

;; (use-package saveplace
;;   :defer 3
;;   :init
;;   (save-place-mode 1)
;;   :custom
;;   (save-place-ignore-files-regexp
;;    "\\(?:COMMIT_EDITMSG\\|hg-editor-[[:alnum:]]+\\.txt\\|elpa\\|svn-commit\\.tmp\\|bzr_log\\.[[:alnum:]]+\\)$")
;;   (save-place-file (concat user-emacs-directory ".my-saved-places"))
;;   (save-place-forget-unreadable-files t))

;; (define-coding-system-alias 'ascii 'us-ascii)
;; (define-coding-system-alias 'UTF-8 'utf-8)
;; (define-coding-system-alias 'utf-8 'UTF-8)

;; (setq gdb-many-windows t)
;; (setq gdb-show-main t)
;; (add-to-list 'geiser-guile-load-path "/usr/share/guile/3.0")
;; (setq geiser-guile-load-init-file t)

;; (add-hook 'find-file-hook
;;           (lambda ()
;;             (when (file-remote-p default-directory)
;;               (setq-local projectile-mode-line "Projectile"))))

(add-hook 'dired-mode-hook
      (lambda ()
        (dired-hide-details-mode)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-view-program-selection
   '(((output-dvi has-no-display-manager) "dvi2tty")
     ((output-dvi style-pstricks) "dvips and gv") (output-dvi "xdvi")
     (output-pdf "PDF Tools") (output-html "xdg-open")))
 '(geiser-guile-warning-level 'high)
 '(logview-additional-submodes nil)
 '(markdown-command "/usr/bin/pandoc")
 '(org-agenda-files
   '("/home/mparlaktuna/org_files/misc/1on1.org"
     "/home/mparlaktuna/org_files/misc/devops_project_cleanup.org"
     "/home/mparlaktuna/org_files/misc/truck_hardware.org"
     "/home/mparlaktuna/org_files/mlops/meetings.org"
     "/home/mparlaktuna/org_files/notes/fye24/sprint11.org"
     "/home/mparlaktuna/org_files/percv/charting_questions.org"
     "/home/mparlaktuna/org_files/percv/documentation.org"
     "/home/mparlaktuna/org_files/percv/meeting_notex.org"
     "/home/mparlaktuna/org_files/percv/planning_2025.org"
     "/home/mparlaktuna/org_files/percv/requirements.org"
     "/home/mparlaktuna/org_files/percv/touchpoint2.org"
     "/home/mparlaktuna/org_files/percv/transform.org"
     "/home/mparlaktuna/org_files/planning/initial_meeting.org"
     "/home/mparlaktuna/org_files/code_reading.org"
     "/home/mparlaktuna/org_files/incoming.org"
     "/home/mparlaktuna/org_files/rgo.org"
     "/home/mparlaktuna/org_files/sprint.org"
     "/home/mparlaktuna/org_files/thorofair.org"
     "/home/mparlaktuna/org_files/vlt.org"))
 '(package-selected-packages
   '(ace-jump-mode ace-window bazel counsel desktop-environment
		   docker-api docker-cli docker-compose-mode es-mode
		   eterm-256color flycheck-color-mode-line
		   flycheck-guile flymake-easy flymake-markdownlint
		   highlight-symbol image+ lgr logview lsp-scheme
		   lsp-ui magit markdown-preview-mode markdownfmt
		   mermaid-mode pdf-tools perspective-exwm
		   project-explorer sly tikz tree-sitter
		   tree-sitter-indent uncrustify-mode vlf
		   yasnippet-snippets))
 '(vterm-max-scrollback 10000)
 '(vterm-term-environment-variable "eterm-color")
 '(warning-suppress-log-types '((mule))))
;; (add-hook
;;   'eat-mode-hook
;;   (lambda ()
;;     (face-remap-add-relative
;;      'default
;;      :foreground "#ffffff"
;;      :background "#000000")
;;     (face-remap-add-relative
;;       'fringe
;;      :foreground "#ffffff"
;;      :background "#000000")))

(add-to-list 'auto-mode-alist '("\\.percv\\'" . scheme-mode))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(aw-leading-char-face ((t (:inherit ace-jump-face-foreground :height 3.0)))))
(put 'dired-find-alternate-file 'disabled nil)
