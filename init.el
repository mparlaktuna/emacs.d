
;;; init.el --- mustafa parlaktuna emacs init file

;;; Code:

(setq package-enable-at-startup nil)
(setq load-prefer-newer t)

(progn ;    `borg'
  (add-to-list 'load-path (expand-file-name "lib/borg" user-emacs-directory))
  (require  'borg)
(borg-initialize))

;;; init.el ends here
