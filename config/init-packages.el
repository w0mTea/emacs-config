;; Manage Packages

;; Initialize package.el
(require 'package)
;; use emacs-china source instead
;; (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
;; (add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(setq package-archives '(("melpa" . "https://elpa.emacs-china.org/melpa/")
			 ("gnu" . "https://elpa.emacs-china.org/gnu/")
			 ("org-cn" . "https://elpa.emacs-china.org/org/")))
(package-initialize)


;; Install and initialize use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile
  (require 'use-package))
(setq use-package-always-ensure t) ;;; install packages automatically


;; Initialize packages

;; idris-mode                           ; idris mode
;; popwin                               ; popup window manager
;; switch-window))                      ; takes over C-x o

;;; helm
(use-package helm
  :bind (("M-x" . helm-M-x)
	 ("C-x C-f" . helm-find-files)
	 ("C-x b" . helm-buffers-list)
	 ("C-x C-r" . helm-recentf)))


;; projectile & helm-projectile
(use-package helm-projectile
  :bind-keymap
  ("C-c C-p" . projectile-command-map)

  :init
  (projectile-mode)

  :config
  (setq projectile-enable-caching t)
  (helm-projectile-on)
  (setq projectile-completion-system 'helm))


(provide 'init-packages)
