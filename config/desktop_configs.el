(defun call-setup-script (file-name)
  (start-process-shell-command
   "setup-script" nil file-name))

(defun setup-office ()
  (interactive)
  (call-setup-script "~/setup_office.sh")
  (setq exwm-randr-workspace-output-plist '(0 "DP-5" 1 "DP-4" 2 "DP-0.1.5" 3 "DP-5" 4 "DP-4" 5 "DP-0.1.5" )))

(defun setup-home ()
  (interactive)
  (call-setup-script "~/setup_home.sh")
  (setq exwm-randr-workspace-output-plist '(0 "DP-5.2" 1 "DP-5.3" 2 "DP-4" 3 "DP-5.2" 4 "DP-5.3" 5 "DP-4")))
