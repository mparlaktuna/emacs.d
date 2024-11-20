

(setq org-clock-persist 'history)
(org-clock-persistence-insinuate)
(setq org-list-description-max-indent 5)
(setq org-adapt-indentation nil)
(global-visual-line-mode)

(setq org-agenda-files (directory-files-recursively "~/org_files/" "\\.org$")
      org-log-done 'time)

(global-set-key (kbd "C-c l") #'org-store-link)
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)
