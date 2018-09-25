;; Org mode configurations


(use-package org
  :mode ("\\.org\\’" . org-mode)

  :config
  ;; Set image width when use org-toggle-inline-image
  (setq org-image-actual-width '(500))

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
  (define-key org-mode-map (kbd "M-C-S-f") 'org-shiftmetaright)

  ;; Set export backends
  (setq org-export-backends '(ascii html latex md))

  ;; Clear newlines when exporting cjk characters
  (require 'ox)

  (defun clear-single-linebreak-in-cjk-string (text)
    "clear single line-break between cjk characters that is usually soft line-breaks"
    (let ((regexp "[[:multibyte:]]")
          (string text))
      ;; delete space converted from newline
      (setq string
            (replace-regexp-in-string
             (format "\\(%s\\) *\n *\\(%s\\)" regexp regexp)
             "\\1\\2" string))
      ;; delete space before bold
      (setq string
            (replace-regexp-in-string
             (format "\\(%s\\) +\\(<\\)" regexp)
             "\\1\\2" string))
      ;; delete space after bold
      (setq string
            (replace-regexp-in-string
             (format "\\(>\\) +\\(%s\\)" regexp)
             "\\1\\2" string))
      string))

  (defun ox-html-clear-single-linebreak-for-cjk (string backend info)
    (when (org-export-derived-backend-p backend 'html)
      (clear-single-linebreak-in-cjk-string string)))

  (defun ox-md-clear-single-linebreak-for-cjk (string backend info)
    (when (org-export-derived-backend-p backend 'md)
      (message string)
      (clear-single-linebreak-in-cjk-string string)))

  (add-to-list 'org-export-filter-plain-text-functions
               'ox-html-clear-single-linebreak-for-cjk)
  (add-to-list 'org-export-filter-plain-text-functions
               'ox-md-clear-single-linebreak-for-cjk))

(use-package ox-gfm
  :after ox)

(use-package org2jekyll
  :after org)


(provide 'init-org)
