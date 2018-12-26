;; Some common and basic configurations


;; mac specific settings
(when (eq system-type 'darwin)
  (mac-auto-operator-composition-mode) ;; enable ligature for mac port
  (setq mac-right-command-modifier 'meta)
  (setq mac-option-modifier 'alt)
  (global-set-key [kp-delete] 'delete-char) ;; sets fn-delete to be right-delete
  )

;; maximum the emacs frame after starting up
(toggle-frame-maximized)

;; disable the ugly tool bar
(tool-bar-mode -1)

;; stop creating backup~ files
(setq make-backup-files nil)

;; enable recentf mode
(recentf-mode 1)
(setq recentf-max-menu-items 25)

;; line number
(setq nlinum-format "%d \u00bb")

(add-hook 'find-file-hook (lambda () (nlinum-mode 1)))

;; column number
(add-hook 'prog-mode-hook (lambda () (column-number-mode 1)))

;; clean white spaces
(global-set-key (kbd "C-M-w") 'whitespace-cleanup)

;; undo tree
(if (eq system-type 'darwin)
    ;;; key bindings for mac
    (use-package undo-tree
      :bind (("C-x u" . undo-tree-visualize)
             ("M-z" . undo-tree-undo)
             ("M-Z" . undo-tree-redo)))

  ;;; key bindings for windows & linux
  (use-package undo-tree
    :bind (("C-x u" . undo-tree-visualize)
           ("C-z" . undo-tree-undo)
           ("C-Z" . undo-tree-redo))))

;; switch window
(use-package switch-window
  :bind ("C-x o" . switch-window))

;; Color theme I use
(use-package idea-darkula-theme)

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

(provide 'init-basics)
