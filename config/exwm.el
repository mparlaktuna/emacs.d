(defun efs/exwm-update-class ()
   (exwm-workspace-rename-buffer exwm-class-name))

(defun efs/run-in-background (command)
  (let ((command-parts (split-string command "[ ]+")))
    (apply #'call-process `(,(car command-parts) nil 0 nil ,@(cdr command-parts)))))

(defun efs/set-wallpaper ()
  (interactive)
  ;; NOTE: You will need to update this to a valid background path!
  (start-process-shell-command
   "feh" nil  "feh --bg-scale ~/Pictures/wallpaper.jpg"))

(defun efs/exwm-init-hook ()
  ;; Make workspace 1 be the one where we land at startup
  (exwm-workspace-switch-create 1)

  ;; Show battery status in the mode line
  (display-battery-mode 1)

  ;; Show the time and date in modeline
  (setq display-time-day-and-date t)
  (display-time-mode 1)
  ;; Also take a look at display-time-format and format-time-string

  ;; Launch apps that will run in the background
  (efs/run-in-background "nm-applet")
  (efs/run-in-background "pasystray")
  (efs/run-in-background "blueman-applet"))

(defun efs/exwm-update-title ()
  (pcase exwm-class-name
    ("Firefox" (exwm-workspace-rename-buffer (format "Firefox: %s" exwm-title)))))

(defun efs/configure-window-by-class ()
  (interactive)
  (pcase exwm-class-name
    ("Firefox" (exwm-workspace-move-window 2))
    ("Sol" (exwm-workspace-move-window 3))
    ("mpv" (exwm-floating-toggle-floating)
     (exwm-layout-toggle-mode-line))))

(setq my/exwm-last-workspaces '(1))

(defun my/exwm-store-last-workspace ()
  "Save the last workspace to `my/exwm-last-workspaces'."
  (setq my/exwm-last-workspaces
        (seq-uniq (cons exwm-workspace-current-index
                        my/exwm-last-workspaces))))

(add-hook 'exwm-workspace-switch-hook
          #'my/exwm-store-last-workspace)

(defun my/exwm-last-workspaces-clear ()
  "Clean `my/exwm-last-workspaces' from deleted workspaces."
  (setq my/exwm-last-workspaces
        (seq-filter
         (lambda (i) (nth i exwm-workspace--list))
         my/exwm-last-workspaces)))

(use-package counsel
  :custom
  (counsel-linux-app-format-function #'counsel-linux-app-format-function-name-only))

(use-package perspective
  :bind
  ("C-x C-b" . persp-list-buffers)         ; or use a nicer switcher, see below
  :custom
  (persp-mode-prefix-key (kbd "C-c M-p"))  ; pick your own prefix key here
  :init
  (persp-mode))

(use-package perspective-exwm
  :config
  (setq perspective-exwm-override-initial-name
      '((1 . "code1") 			;wide
        (2 . "code-debug")		;side
	(3 . "code2")			;wide
	(4 . "devops")			;wide
        (5 . "browser")			;side
        (6 . "doc")			;side
        (7 . "comm")			;laptop
	(0 . "term"))))			;laptop


(defun efs/exwm-configure-window ()
  (interactive)
  (pcase exwm-class-name
    ("Nyxt"
     (perspective-exwm-assign-window
      :workspace-index 5
      :persp-name "browser"))
    ("Projects"
     (perspective-exwm-assign-window
      :workspace-index 4
      :persp-name "devops")
     (perspective-exwm-get-exwm-buffer-name
      "devops"))
    ("Alacritty"
     (perspective-exwm-assign-window
      :workspace-index 0
      :persp-name "term"))))
    
(use-package exwm
  :config
  ;; Set the default number of workspaces
  (setq exwm-workspace-number 10)

  ;; When window "class" updates, use it to set the buffer name
  (add-hook 'exwm-update-class-hook #'efs/exwm-update-class)

  ;; When window title updates, use it to set the buffer name
  (add-hook 'exwm-update-title-hook #'efs/exwm-update-title)
  
  ;; Configure windows as they're created
  (add-hook 'exwm-manage-finish-hook #'efs/exwm-configure-window)

  ;; When EXWM starts up, do some extra confifuration
  (add-hook 'exwm-init-hook #'efs/exwm-init-hook)
  
  ;; swap ctrl and caps
  (start-process-shell-command "xmodmap" nil "xmodmap ~/.emacs.d/config/Xmodmap")
  (setq exwm-randr-workspace-monitor-plist '(0 "DP-4"))
  (require 'exwm-randr)
  (start-process-shell-command "xrandr" nil "~/.screenlayout/mobile.sh")
  (setq exwm-workspace-warp-cursor t)
  (setq mouse-autoselect-window t
	focus-follows-mouse t)
  (exwm-randr-enable)

  (efs/set-wallpaper)

  (require 'exwm-systemtray)
  (setq exwm-systemtray-height 40)
  (exwm-systemtray-enable)

  (exwm-input-set-key (kbd "s-SPC") 'counsel-linux-app)
  (exwm-input-set-key (kbd "s-f") 'exwm-layout-toggle-fullscreen)
  
  ;; These keys should always pass through to Emacs
  (setq exwm-input-prefix-keys
    '(?\C-x
      ?\C-u
      ?\C-h
      ?\M-x
      ?\M-`
      ?\M-&
      ?\M-:
      ?\C-\M-j  ;; Buffer list
      ?\C-\ ))  ;; Ctrl+Space

  ;; Ctrl+Q will enable the next key to be sent directly
  (define-key exwm-mode-map [?\C-q] 'exwm-input-send-next-key)
  (setq window-divider-default-bottom-width 2
      window-divider-default-right-width 2)
  (window-divider-mode)


  ;; Set up global key bindings.  These always work, no matter the input state!
  ;; Keep in mind that changing this list after EXWM initializes has no effect.
  (setq exwm-input-global-keys
        `(
          ;; Reset to line-mode (C-c C-k switches to char-mode via exwm-input-release-keyboard)
          ([?\s-r] . exwm-reset)

	  (,(kbd "s-,") . persp-prev)
          (,(kbd "s-.") . persp-next)
	  (,(kbd "s-<escape>") . perspective-exwm-switch-perspective)
          ;; EXWM buffers
          (,(kbd "s-[") . perspective-exwm-cycle-exwm-buffers-backward)
          (,(kbd "s-]") . perspective-exwm-cycle-exwm-buffers-forward)

          ;; Move between windows
          ([s-left] . windmove-left)
          ([s-right] . windmove-right)
          ([s-up] . windmove-up)
          ([s-down] . windmove-down)

          ;; Launch applications via shell command
          ([?\s-&] . (lambda (command)
                       (interactive (list (read-shell-command "$ ")))
                       (start-process-shell-command command nil command)))

          ;; Switch workspace
          ([?\s-w] . exwm-workspace-switch)

          ;; 's-N': Switch to certain workspace with Super (Win) plus a number key (0 - 9)
          ,@(mapcar (lambda (i)
                      `(,(kbd (format "s-%d" i)) .
                        (lambda ()
                          (interactive)
                          (exwm-workspace-switch-create ,i))))
                    (number-sequence 0 9))))
  (exwm-enable))

(use-package desktop-environment
  :after exwm
  :config (desktop-environment-mode)
  :custom
  (desktop-environment-brightness-small-increment "2%+")
  (desktop-environment-brightness-small-decrement "2%-")
  (desktop-environment-brightness-normal-increment "5%+")
  (desktop-environment-brightness-normal-decrement "5%-"))

(perspective-exwm-mode)

(setf epg-pinentry-mode 'loopback)
(defun pinentry-emacs (desc prompt ok error)
  (let ((str (read-passwd
              (concat (replace-regexp-in-string "%22" "\""
                                                (replace-regexp-in-string "%0A" "\n" desc)) prompt ": "))))
    str))

(defun office-workspace ()
  (interactive)
  (start-process-shell-command "autorandr" nil "autorandr --change --force office")
  (setq exwm-randr-workspace-monitor-plist '(0 "DP-4" 1 "DP-5" 2 "DP-0.1.5" 3 "DP-5" 4 "DP-5" 5 "DP-0.1.5"  6 "DP-0.1.5" 7 "DP-4" ))
  (exwm-randr-refresh))

(defun home-workspace ()
  (interactive)
  (start-process-shell-command "autorandr" nil "autorandr --change --force home")
  (setq exwm-randr-workspace-monitor-plist '(0 "DP-4" 1 "DP-5.3" 2 "DP-5.2" 3 "DP-5.3" 4 "DP-5.3" 5 "DP-5.2"  6 "DP-5.2" 7 "DP-4" ))
  (exwm-randr-refresh))

(defun mobile-workspace ()
  (interactive)
  (start-process-shell-command "autorandr" nil "autorandr --change --force mobile")
  (setq exwm-randr-workspace-monitor-plist '(0 "DP-4 "1 "DP-4" 2 "DP-4" 3 "DP-4" 4 "DP-4" 5 "DP-4"))
  (exwm-randr-refresh))

;; ;; let's get encryption established
;; (use-package helm-exwm
;;   :ensure t
;;   :config
;;   (setq helm-exwm-emacs-buffers-source (helm-exwm-build-emacs-buffers-source))
;;   (setq helm-exwm-source (helm-exwm-build-source))
;;   (setq helm-mini-default-sources `(helm-exwm-emacs-buffers-source
;;                                     helm-exwm-source
;;                                     helm-source-recentf)))
