;; Coding related configurations


;; Common coding configurations

;;; Never use tab to indent
(setq-default indent-tabs-mode nil)

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
  :hook (magit-mode . turn-on-magit-gitflow)
  :init (setq magit-gitflow-popup-key "C-M-f"))


;; Language related configurations

;;; Idris
(use-package idris-mode
  :mode "\\.idr\\’"
  :interpreter "idris"

  :bind (:map idris-hole-list-mode-map
              ("n" . forward-button)
              ("p" . backward-button)

              :map idris-mode-map
              ("C-c C-q" . idris-quit))
  :config
  ;; unset "C-c C-p" which shadows the shortkey for projectile
  (define-key idris-mode-map (kbd "C-c C-p") nil)

  ;; popwin settings
  (push 'idris-compiler-notes-mode
        popwin:special-display-config)
  (push '(idris-repl-mode
          :noselect nil
          :position bottom
          :height 0.4
          :stick t)
        popwin:special-display-config)
  (push '(idris-hole-list-mode
          :noselect t
          :position bottom
          :height 0.4
          :stick t)
        popwin:special-display-config)
  (push '(idris-info-mode
          :noselect nil
          :position bottom
          :height 0.2
          :stick t)
        popwin:special-display-config))


;;; Haskell
(use-package haskell-mode
  :mode "\\.[l]hs\\'"
  :interpreter "ghci"

  :bind
  (("C-c C-l" . haskell-process-load-or-reload))

  :config
  ;; popwin settings
  (push '("*haskell*"
          :noselect nil
          :position bottom
          :height 0.4
          :stick t)
        popwin:special-display-config))

(use-package dante
  :hook ((haskell-mode . dante-mode)
         (haskell-mode . flycheck-mode))
  :bind (:map dante-mode-map
              ("C-c C-t" . dante-type-at)
              ("C-c C-d i" . dante-info)))

(provide 'init-coding)
