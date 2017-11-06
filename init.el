; Configurations for Emacs
; Author: w0mTea
; Update at: 2017-11-07

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                      Set up package manager and packages
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; initialize el-get
(let ((el-get-path
       (concat user-emacs-directory "el-get/el-get")))
  (add-to-list 'load-path el-get-path))

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")

;; set el-get packages
(setq
 my:el-get-packages
 '(el-get                               ; el-get is self-hosting
   color-theme-idea-darkula             ; color theme I use
   helm                                 ; helm
   undo-tree                            ; better undo and redo
   switch-window))                      ; takes over C-x o

(setq my:el-get-packages
      (append my:el-get-packages
              (mapcar #'el-get-source-name el-get-sources)))

;; install new packages and init already installed packages
(el-get 'sync my:el-get-packages)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                                    Key bind settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; mac specific settings
(when (eq system-type 'darwin)
  (setq mac-right-command-modifier 'meta)
  (setq mac-option-modifier 'alt)
  (global-set-key [kp-delete] 'delete-char) ;; sets fn-delete to be right-delete
  )

(global-set-key (kbd "C-x o") 'switch-window)

;; helm key bindings
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-f") 'helm-find-files)

;; undo tree key bindings
(defun set-undo-tree-key-bindings ()
  (if (eq system-type 'darwin)
      (progn ;; set for mac
	(global-set-key (kbd "M-z") 'undo)
        (global-set-key (kbd "M-Z") 'undo-tree-redo))
    (progn ;; set for windows & linux
      (global-set-key (kbd "C-z") 'undo)
      (global-set-key (kbd "C-S-z") 'undo-tree-redo))
    )
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                                    Basic settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; disable the ugly tool bar
(tool-bar-mode -1)

;; enable undo tree
(global-undo-tree-mode 1)
(set-undo-tree-key-bindings)

;; stop creating backup~ files
(setq make-backup-files nil)

;; line number
(defun linum-format-func (line)
  (let ((w (length (number-to-string (count-lines (point-min) (point-max))))))
     (propertize (format (format "%%%dd \u00bb" w) line) 'face 'linum)))
(setq linum-format 'linum-format-func)
(add-hook 'find-file-hook (lambda () (linum-mode 1)))

;; set font
(set-frame-font "-*-Fira Code-normal-normal-normal-*-14-*-*-*-m-0-iso10646-1" nil t)

;; set PATH
(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell (replace-regexp-in-string
                          "[ \t\n]*$"
                          ""
                          (shell-command-to-string "$SHELL --login -i -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setq eshell-path-env path-from-shell) ; for eshell users
    (setq exec-path (split-string path-from-shell path-separator))))
(when window-system (set-exec-path-from-shell-PATH))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                                    Custom Set Variables
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (idea-darkula)))
 '(custom-safe-themes
   (quote
    ("02591317120fb1d02f8eb4ad48831823a7926113fa9ecfb5a59742420de206e0" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
