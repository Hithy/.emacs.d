(provide 'init-lsp)

(require-package 'lsp-mode)
(require-package 'lsp-ui)
(require-package 'company-lsp)
(require-package 'yasnippet)

(setq company-lsp-cache-candidates 'auto)
(setq lsp-ui-sideline-enable nil)

(after-load 'company
  (add-to-list 'company-backends 'company-lsp)
  )
