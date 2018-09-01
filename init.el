;; Configurations for Emacs
;; Author: w0mTea
;; Emacs Version: 26.1
;; Platform: MacOS

;; Add my config file dir into load path
(add-to-list 'load-path "~/.emacs.d/config")

;; Pakcage management
(require 'init-packages)

;; Basic configurations
(require 'init-basics)

;; Coding configurations
(require 'init-coding)


;; Custom variables
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (idris-mode popwin switch-window helm-projectile use-package undo-tree rainbow-delimiters magit-gitflow idea-darkula-theme helm company aggressive-indent))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:underline nil :overline nil :strike-through nil :box nil :inverse-video nil :foreground "#A9B7C6" :background "#2B2B2B" :stipple nil :inherit nil))))
 '(rainbow-delimiters-depth-1-face ((t (:inherit rainbow-delimiters-base-face :foreground "red"))))
 '(rainbow-delimiters-depth-2-face ((t (:inherit rainbow-delimiters-base-face :foreground "cyan"))))
 '(rainbow-delimiters-depth-3-face ((t (:inherit rainbow-delimiters-base-face :foreground "dark orange"))))
 '(rainbow-delimiters-depth-4-face ((t (:inherit rainbow-delimiters-base-face :foreground "DodgerBlue1"))))
 '(rainbow-delimiters-depth-5-face ((t (:inherit rainbow-delimiters-base-face :foreground "yellow2"))))
 '(rainbow-delimiters-depth-6-face ((t (:inherit rainbow-delimiters-base-face :foreground "purple1"))))
 '(rainbow-delimiters-depth-7-face ((t (:inherit rainbow-delimiters-base-face :foreground "spring green")))))
