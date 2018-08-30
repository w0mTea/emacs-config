;; Coding related configurations


;; Common coding configurations

;;; Company mode
(use-package company
  :hook (after-init . global-company-mode))

;;; Show parentheses
(add-hook 'prog-mode-hook 'show-paren-mode)

;;; Enable electric pair and quote mode
(add-hook 'prog-mode-hook 'electric-pair-mode)
(add-hook 'prog-mode-hook 'electric-quote-mode)

;;; Rainbow delimiters
(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode)
  :custom
  (rainbow-delimiters-max-face-count 7)
  :custom-face
  (rainbow-delimiters-depth-1-face ((t (:inherit rainbow-delimiters-base-face :foreground "red"))))
  (rainbow-delimiters-depth-2-face ((t (:inherit rainbow-delimiters-base-face :foreground "cyan"))))
  (rainbow-delimiters-depth-3-face ((t (:inherit rainbow-delimiters-base-face :foreground "dark orange"))))
  (rainbow-delimiters-depth-4-face ((t (:inherit rainbow-delimiters-base-face :foreground "DodgerBlue1"))))
  (rainbow-delimiters-depth-5-face ((t (:inherit rainbow-delimiters-base-face :foreground "yellow2"))))
  (rainbow-delimiters-depth-6-face ((t (:inherit rainbow-delimiters-base-face :foreground "purple1"))))
  (rainbow-delimiters-depth-7-face ((t (:inherit rainbow-delimiters-base-face :foreground "spring green")))))

;;; Aggressive indent
(use-package aggressive-indent
  :hook (emacs-lisp-mode . aggressive-indent-mode))


;; Git related configurations
(use-package magit
  :bind (:map prog-mode-map
	      ("C-x C-g" . magit-status)))
(use-package magit-gitflow
  :hook (magit-mode . turn-on-magit-gitflow))


;; Language related configurations


(provide 'init-coding)
