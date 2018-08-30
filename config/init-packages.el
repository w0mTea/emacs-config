; Manage Packages

;; Initialize package.el
(require 'package)
;; use emacs-china source instead
;; (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
;; (add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(setq package-archives '(("gnu" . "https://elpa.emacs-china.org/gnu/")
			 ("melpa" . "https://elpa.emacs-china.org/melpa/")
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
   ;; projectile                           ; project management
   ;; helm-projectile                      ; helm projectile
   ;; switch-window))                      ; takes over C-x o

;;; helm
(require 'package-init-helm)


(provide 'init-packages)
