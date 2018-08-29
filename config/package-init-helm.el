;; Configurations about helm

(use-package helm
  :bind (("M-x" . helm-M-x)
	 ("C-x C-f" . helm-find-files)
	 ("C-x b" . helm-buffers-list)
	 ("C-x C-r" . helm-recentf))
  )

(provide 'package-init-helm)
