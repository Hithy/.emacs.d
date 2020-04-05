(provide 'init-dev-cxx)

(when (executable-find "ccls")
  (require-package 'ccls)

  (defun load-ccls ()
    (require 'ccls)
    (lsp)
    )

  (add-hook 'c++-mode-hook 'load-ccls)
  (add-hook 'c-mode-hook 'load-ccls)
  (add-hook 'objc-mode-hook 'load-ccls)
  )

(setq lsp-prefer-flymake nil)
(setq-default flycheck-disabled-checkers '(c/c++-clang c/c++-cppcheck c/c++-gcc))



