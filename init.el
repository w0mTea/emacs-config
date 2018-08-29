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
