;; Org mode configurations


(use-package org
  :mode ("\\.org\\’" . org-mode)

  :config
  ;; Add magit keybingings for org-mode
  (define-key org-mode-map (kbd "C-x C-g") 'magit-status)

  ;; Bind org-meta and org-shiftmeta series commands
  (define-key org-mode-map (kbd "M-C-p") 'org-metaup)
  (define-key org-mode-map (kbd "M-C-n") 'org-metadown)
  (define-key org-mode-map (kbd "M-C-b") 'org-metaleft)
  (define-key org-mode-map (kbd "M-C-f") 'org-metaright)
  (define-key org-mode-map (kbd "M-C-S-p") 'org-shiftmetaup)
  (define-key org-mode-map (kbd "M-C-S-n") 'org-shiftmetadown)
  (define-key org-mode-map (kbd "M-C-S-b") 'org-shiftmetaleft)
  (define-key org-mode-map (kbd "M-C-S-f") 'org-shiftmetaright))


(provide 'init-org)
