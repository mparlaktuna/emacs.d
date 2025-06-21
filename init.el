'(package-archives
   '(("gnu" . "https://elpa.gnu.org/packages/")
     ("nongnu" . "https://elpa.nongnu.org/nongnu/")
     ("melpa" . "https://melpa.org/packages/")))

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
        "straight/repos/straight.el/bootstrap.el"
        (or (bound-and-true-p straight-base-dir)
            user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(setq package-enable-at-startup nil)
(straight-use-package 'zenburn-theme)
;; (straight-use-package
;;  '(emacs-bazel-mode
;;    :type git
;;    :host github
;;    :repo "bazelbuild/emacs-bazel-mode/bazel.el"))

(straight-use-package 'use-package)

(load-file "~/.emacs.d/config/theme.el")
(load-file "~/.emacs.d/config/bazel.el")
(load-file "~/.emacs.d/config/interface.el")
(load-file "~/.emacs.d/config/helm_conf.el")

(use-package magit
  :straight t)

(setq-default dired-listing-switches "-alh")

;; (use-package bazel
;;   :straight t
;;   :config
;;   (load-file "bazel.el"))
(put 'dired-find-alternate-file 'disabled nil)
(yas-global-mode)
