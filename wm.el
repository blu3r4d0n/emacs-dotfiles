(require 'exwm)
(require 'exwm-config)
(require 'exwm-randr)
(require 'exwm-systemtray)

;; Define number of workspaces.
(setq exwm-workspace-number 10)

;; "C-c o" is for switching workspaces.
(exwm-input-set-key
 (kbd "C-c o") #'exwm-workspace-switch)

;; Line-editing shortcuts
(exwm-input-set-simulation-keys
 '(([?\C-b] . left)
   ([?\C-f] . right)
   ([?\C-p] . up)
   ([?\C-n] . down)
   ([?\C-a] . home)
   ([?\C-e] . end)
   ([?\M-v] . prior)
   ([?\C-v] . next)
   ([?\C-d] . delete)))
;; No problems above here

;; Make class name the buffer name
(add-hook 'exwm-update-class-hook
	  (lambda ()
	    (exwm-workspace-rename-buffer exwm-class-name)))
;; Enable two xrandr outputs one named 'default' and another named 'other'.
(defun my-exwm-xrandr-two-outputs (default other)
  (shell-command
   (concat "xrandr --output " other " --right-of " default " --auto")))

;; Enable only one xrandr output named 'default'.
(defun my-exwm-xrandr-one-output (default)
  (shell-command (concat "xrandr --output " default " --auto")))

;; No problems below here

;; Disable xrandr output named 'output'.
(defun my-exwm-xrandr-off (output)
  (if output (shell-command (concat "xrandr --output " output " --off"))))

;; Update exwm-randr-workspace-output-plist with two outputs named
;; 'default' and 'other'.  If the 'other' output is same as 'default'
;; then all workspaces will be redirected to the 'default' output.
(defun my-exwm-xrandr-config (default other)
  (setq exwm-randr-workspace-output-plist
	(progn
	  (setq result (list 0 default))
	  (setq index 1)
	  (while (< index exwm-workspace-number)
	    (setq result (append result (list index other)))
	    (setq index (1+ index)))
	  result)))

;; Dynamically find the active xrandr outputs and update exwm
;; workspace configuration and enable xrandr outputs appropriately.
(defun my-exwm-xrandr-hook (default)
  (let* ((connected-cmd "xrandr -q|awk '/ connected/ {print $1}'")
	 (connected (process-lines "bash" "-lc" connected-cmd))
	 (previous (delete-dups (seq-remove
				 'integerp
				 exwm-randr-workspace-output-plist))))
    (cond ((member "DP1" connected)
	   (progn (my-exwm-xrandr-config default "DP1")
		  (my-exwm-xrandr-two-outputs default "DP1")))
	  ((member "DP2" connected)
	   (progn (my-exwm-xrandr-config default "DP2")
		  (my-exwm-xrandr-two-outputs default "DP2")))
	  ((member "HDMI1" connected)
	   (progn (my-exwm-xrandr-config default "HDMI1")
		  (my-exwm-xrandr-two-outputs default "HDMI1")))
	  ((member "HDMI2" connected)
	   (progn (my-exwm-xrandr-config default "HDMI2")
		  (my-exwm-xrandr-two-outputs default "HDMI2")))
	  (t (progn (my-exwm-xrandr-config default default)
		    (mapcar 'my-exwm-xrandr-off
			    (delete default previous)))))))

(setq exwm-randr-screen-change-hook
      (lambda () (my-exwm-xrandr-hook "eDP1")))

;; Pick some height for the system tray. Some applet icons don't appear
;; otherwise.
(setq exwm-systemtray-height 24)

;; Disable floating windows completely.
;(setq exwm-manage-force-tiling t)

;; show mode-line on floating windows.
(add-hook 'exwm-floating-setup-hook #'exwm-layout-show-mode-line)

;; Enable exwm.
(use-package dmenu
  :ensure t
  :bind
    ("s-SPC" . 'dmenu))
(exwm-enable)
(exwm-systemtray-enable)
(exwm-randr-enable)
