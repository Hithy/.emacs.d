(provide 'init-org)

(require-package 'org-bullets)

(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
