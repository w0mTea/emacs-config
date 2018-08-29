; Manage Packages

;; Initialize package.el
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(package-initialize)


;; Install and initialize use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile
  (require 'use-package))
(setq use-package-always-ensure t) ;;; install packages automatically


;; Initialize packages

;;; Color theme I use
(use-package idea-darkula-theme)

;;; helm
(require 'package-init-helm)

(provide 'init-packages)
