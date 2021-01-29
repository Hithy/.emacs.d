(provide 'init-dev-go)

(when (my-executable-find "gopls")

  (defun load-gopls ()
    (lsp)
    )

  (add-hook 'go-mode-hook 'load-gopls)
  )
