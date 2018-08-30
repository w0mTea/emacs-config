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
(require 'custom)
