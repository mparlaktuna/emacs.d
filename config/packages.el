(require 'package)

(setq package-list '(zenburn-theme
		     magit
		     yasnippet
		     company
		     flycheck
		     markdown-mode
		     ace-window
		     ace-jump-mode
		     helm
		     projectile
		     helm-projectile
		     dockerfile-mode
		     docker
		     boon
		     bazel
		     geiser
		     geiser-guile
		     tree-sitter
		     tree-sitter-langs
		     tree-sitter-indent
		     shackle
		     uncrustify-mode
		     auctex))

(unless package-archive-contents
  (package-refresh-contents))

(package-initialize)

; fetch the list of packages available 
(unless package-archive-contents
  (package-refresh-contents))

(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))
