;; Configure some common keybindings
;; Package related keybindings are in init-packages.el or config files for that package

;; mac specific settings
(when (eq system-type 'darwin)
  (setq mac-right-command-modifier 'meta)
  (setq mac-option-modifier 'alt)
  (global-set-key [kp-delete] 'delete-char) ;; sets fn-delete to be right-delete
  )

(provide 'init-keybindings)
