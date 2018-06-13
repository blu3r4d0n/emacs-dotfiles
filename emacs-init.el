(setq inhibit-startup-message t)
(scroll-bar-mode -1)
(set-frame-parameter nil 'fullscreen 'fullboth)
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(jdee-server-dir "~/.jdee-server")
 '(package-selected-packages
   (quote
    (projectile dashboard markdown-mode pdf-tools elcord org-bullets 0blayout jdee all-the-icons-gnus dirtree helm emms dmenu go-mode magit simpleclip multi-term evil))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(require 'evil)
(evil-mode 1)
(require 'spaceline-config)
(spaceline-spacemacs-theme)
(load-file "~/.config/emacs/splash-screen.el")
(load-file "~/.config/emacs/projectile.el")
(load-file "~/.config/emacs/wm.el")
(use-package dirtree
  :init
  )

(require 'doom-themes)

;; Global settings (defaults)
(setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
      doom-themes-enable-italic t) ; if nil, italics is universally disabled

;; Load the theme (doom-one, doom-molokai, etc); keep in mind that each theme
;; may have their own settings.
(load-theme 'doom-dracula t)

;; Enable flashing mode-line on errors
(doom-themes-visual-bell-config)

;; Enable custom neotree theme
(doom-themes-neotree-config)  ; all-the-icons fonts must be installed!

;; Corrects (and improves) org-mode's native fontification.
(doom-themes-org-config)

;(require 'use-package
;(unless (package-installed-p 'use-package)
;  (package-refresh-contents)
;  (package-install 'use-package))
(menu-bar-mode -1)
(tool-bar-mode -1)
(require 'multi-term)
(setq multi-term-program "/bin/zsh")
(require 'simpleclip)
(simpleclip-mode 1)
(set-frame-font "Hack 13" nil t)
(use-package org-bullets
  :ensure t
  :config
    (add-hook 'org-mode-hook (lambda () (org-bullets-mode))))
;; (use-package zerodark-theme
;;   :ensure t
;;   :init
;;     (load-theme 'zerodark t))
;; (let ((class '((class color) (min-colors 89)))
;;       (default (if (true-color-p) "#abb2bf" "#afafaf"))
;;       (light (if (true-color-p) "#ccd4e3" "#d7d7d7"))
;;       (background (if (true-color-p) "#282c34" "#333333"))
;;       (background-dark (if (true-color-p) "#24282f" "#222222"))
;;       (background-darker (if (true-color-p) "#22252c" "#222222"))
;;       (mode-line-inactive (if "#1c2129" "#222222"))
;;       (mode-line-active (if (true-color-p) "#6f337e" "#875f87"))
;;       (background-lighter (if (true-color-p) "#3a3f4b" "#5f5f5f"))
;;       (background-red (if (true-color-p) "#4c3840" "#5f5f5f"))
;;       (bright-background-red (if (true-color-p) "#744a5b" "#744a5b"))
;;       (background-purple (if (true-color-p) "#48384c" "#5f5f5f"))
;;       (background-blue (if (true-color-p) "#38394c" "#444444"))
;;       (bright-background-blue (if (true-color-p) "#4e5079" "#4e5079"))
;;       (background-green (if (true-color-p) "#3d4a41" "#5f5f5f"))
;;       (bright-background-green (if (true-color-p) "#3f6d54" "#3f6d54"))
;;       (background-orange (if (true-color-p) "#4a473d" "#5f5f5f"))
;;       (hl-line (if (true-color-p) "#2c323b" "#333333"))
;;       (grey (if (true-color-p) "#cccccc" "#cccccc"))
;;       (grey-dark (if (true-color-p) "#666666" "#666666"))
;;       (highlight (if (true-color-p) "#3e4451" "#5f5f5f"))
;;       (comment (if (true-color-p) "#687080" "#707070"))
;;       (orange (if (true-color-p) "#da8548" "#d7875f"))
;;       (orange-light (if (true-color-p) "#ddbd78" "#d7af87"))
;;       (red (if (true-color-p) "#ff6c6b" "#ff5f5f"))
;;       (purple (if (true-color-p) "#c678dd" "#d787d7"))
;;       (purple-dark (if (true-color-p) "#64446d" "#5f5f5f"))
;;       (blue (if (true-color-p) "#61afef" "#5fafff"))
;;       (blue-dark (if (true-color-p) "#1f5582" "#005f87"))
;;       (green (if (true-color-p) "#98be65" "#87af5f"))
;;       (green-light (if (true-color-p) "#9eac8c" "#afaf87"))
;;       (peach "PeachPuff3")
;;       (diff-added-background (if (true-color-p) "#284437" "#284437"))
;;       (diff-added-refined-background (if (true-color-p) "#1e8967" "#1e8967"))
;;       (diff-removed-background (if (true-color-p) "#583333" "#580000"))
;;       (diff-removed-refined-background (if (true-color-p) "#b33c49" "#b33c49"))
;;       (diff-current-background (if (true-color-p) "#29457b" "#29457b"))
;;       (diff-current-refined-background (if (true-color-p) "#4174ae" "#4174ae")))

;;   (custom-theme-set-faces
;;    'zerodark

;;    `(fancy-battery-charging ((,class (:background ,background-blue :height 1.0 :bold t))))
;;    `(fancy-battery-discharging ((,class (:background ,background-blue :height 1.0))))
;;    `(fancy-battery-critical ((,class (:background ,background-blue :height 1.0))))
   
;;    ;; mode line stuff
;;    `(mode-line ((,class (:background ,background-blue :height 1.0 :foreground ,blue
;;                                      :distant-foreground ,background-blue
;;                                      :box ,(when zerodark-use-paddings-in-mode-line
;;                                              (list :line-width 6 :color background-blue))))))
   
;;    `(mode-line-inactive ((,class (:background ,background-blue :height 1.0 :foreground ,default
;;                                               :distant-foreground ,background-blue
;;                                               :box ,(when zerodark-use-paddings-in-mode-line
;;                                                       (list :line-width 6 :color background-blue))))))

;;    `(header-line ((,class (:inherit mode-line-inactive))))

;;    `(powerline-active0 ((,class (:height 1.0 :foreground ,blue :background ,background-blue
;;                                          :distant-foreground ,background-blue))))
;;    `(powerline-active1 ((,class (:height 1.0 :foreground ,blue :background ,background-blue
;;                                          :distant-foreground ,background-blue))))
;;    `(powerline-active2 ((,class (:height 1.0 :foreground ,blue :background ,background-blue
;;                                          :distant-foreground ,background-blue))))
;;    `(powerline-inactive0 ((,class (:height 1.0 :foreground ,blue :background ,background-blue
;;                                            :distant-foreground ,background-blue))))
;;    `(powerline-inactive1 ((,class (:height 1.0 :foreground ,blue :background ,background-blue
;;                                            distant-foreground ,background-blue))))
;;    `(powerline-inactive2 ((,class (:height 1.0 :foreground ,blue :background ,background-blue
;;                                            :distant-foreground ,background-blue))))

;;    `(dashboard-heading-face ((,class (:background ,background :foreground ,blue
;;                                                   :bold t :height 1.2))))
;;    `(dashboard-banner-logo-title-face ((,class (:background ,background :foreground ,blue
;;                                                             :bold t :height 1.2))))
;;    `(widget-button ((,class (:background ,background :foreground ,default :bold nil
;;                                          :underline t :height 0.9))))
   
;;    ;; erc stuff
;;    `(erc-nick-default-face ((,class :foreground ,blue :background ,background :weight bold)))

;;    ;; org stuff
;;    `(outline-1 ((,class (:foreground ,blue :weight bold :height 1.8 :bold nil))))
;;    `(outline-2 ((,class (:foreground ,purple :weight bold :height 1.7 :bold nil))))
;;    `(outline-3 ((,class (:foreground ,peach :weight bold :height 1.6 :bold nil))))
;;    `(outline-4 ((,class (:foreground ,green-light :weight bold :height 1.5 :bold nil))))
;;    `(outline-5 ((,class (:foreground ,blue :weight bold :height 1.4 :bold nil))))
;;    `(outline-6 ((,class (:foreground ,purple :weight bold :height 1.3 :bold nil))))
;;    `(outline-7 ((,class (:foreground ,peach :weight bold :height 1.2 :bold nil))))
;;    `(outline-8 ((,class (:foreground ,green-light :weight bold :height 1.1 :bold nil))))
   
;;    `(org-block-begin-line ((,class (:background ,background-blue :foreground ,blue
;;                                                 :bold t :height 1.0))))
;;    `(org-block-end-line ((,class (:background ,background-blue :foreground ,blue
;;                                               :bold t :height 1.0))))))
(shell-command "compton -b" )   
;(require 'go-mode-autoloads')
