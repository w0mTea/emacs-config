; Some common and basic configurations

;; enable ligature for mac port
(mac-auto-operator-composition-mode)

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
(defun linum-format-func (line)
  (let ((w (length (number-to-string (count-lines (point-min) (point-max))))))
     (propertize (format (format "%%%dd \u00bb" w) line) 'face 'linum)))
(setq linum-format 'linum-format-func)
(add-hook 'find-file-hook (lambda () (linum-mode 1)))

;; column number
(add-hook 'prog-mode-hook (lambda () (column-number-mode 1)))

;; clean up whitespaces before saving
(add-hook 'before-save-hook 'whitespace-cleanup)

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
