(provide 'init-dev-common)

(global-set-key (kbd "C-c c") 'recompile)

(when (executable-find "rg")
  (require-package 'ripgrep)
  )

(require-package 'flycheck)
