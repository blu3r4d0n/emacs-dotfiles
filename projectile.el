(use-package projectile
  :ensure t
  :init
    (projectile-mode 1))

(global-set-key (kbd "<f5>") 'projectile-compile-project)
