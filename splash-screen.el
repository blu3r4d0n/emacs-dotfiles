(use-package dashboard
  :ensure t
  :config
    (dashboard-setup-startup-hook)
    (setq dashboard-startup-banner "~/.config/emacs/icon.png")
    (setq dashboard-items '((recents  . 5)
                            (projects . 5)))
    (setq dashboard-banner-logo-title ""))
