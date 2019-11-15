(provide 'init-ccls)

(require-package 'ccls)

(defun load-ccls ()
  (require 'ccls)
  (lsp)
  )

(setq lsp-prefer-flymake nil)
(setq-default flycheck-disabled-checkers '(c/c++-clang c/c++-cppcheck c/c++-gcc))

(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
(add-hook 'c++-mode-hook 'load-ccls)
(add-hook 'c-mode-hook 'load-ccls)
(add-hook 'objc-mode-hook 'load-ccls)
