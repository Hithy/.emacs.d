(provide 'init-company)

(require-package 'company)
(require-package 'company-quickhelp)
;; (require-package 'company-lsp)

(add-hook 'after-init-hook 'global-company-mode)

(after-load 'company
  (setq-default company-idle-delay 0)
  (setq company-lsp-cache-candidates 'auto)
  (company-quickhelp-mode)
  (push 'company-capf company-backends)
  )
