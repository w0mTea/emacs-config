;; Manage Packages

;; Initialize package.el
(require 'package)
;; use emacs-china source instead
(setq package-archives '(("melpa-cn" . "http://elpa.emacs-china.org/melpa/")
                         ("gnu-cn" . "http://elpa.emacs-china.org/gnu/")
                         ("org-cn" . "http://elpa.emacs-china.org/org/")
			             ("melpa" . "http://melpa.org/packages/")
			             ("org" . "http://orgmode.org/elpa/")))
(package-initialize)


;; Install and initialize use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile
  (require 'use-package))
(setq use-package-always-ensure t) ;;; install packages automatically


;; Initialize packages

;;; popwin
(use-package popwin
  :demand ;; load popwin when emacs starts
  :bind-keymap
  ("C-x C-p" . popwin:keymap)
  :config
  (popwin-mode))


;;; helm
(use-package helm
  :bind (("M-x" . helm-M-x)
         ("C-x C-f" . helm-find-files)
         ("C-x b" . helm-buffers-list)
         ("C-x C-r" . helm-recentf))
  :config ;; configure popwin for helm
  (push '("*helm M-x*"
          :position bottom
          :height 0.3
          :stick t
          :noselect nil)
        popwin:special-display-config))


;;; projectile & helm-projectile
(use-package helm-projectile
  :bind-keymap
  ("C-c p" . projectile-command-map)

  :init
  (projectile-mode)

  :config
  (setq projectile-enable-caching t)
  (helm-projectile-on)
  (setq projectile-completion-system 'helm))


;;; nlinum-mode
(use-package nlinum)

;;; adoc-mode
(use-package adoc-mode
  :mode "\\.asciidoc$")

(provide 'init-packages)
