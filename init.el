; Configurations for Emacs
; Author: w0mTea
; Emacs Version: 26.1
; Platform: MacOS

;; Add my config file dir into load path
(add-to-list 'load-path "~/.emacs.d/config")

;; Pakcage management
(require 'init-packages)

;; Keybindings
(require 'init-keybindings)

;; Basic configurations
(require 'init-basics)

;; Custom variables
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (undo-tree use-package idea-darkula-theme helm))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:underline nil :overline nil :strike-through nil :box nil :inverse-video nil :foreground "#A9B7C6" :background "#2B2B2B" :stipple nil :inherit nil)))))
