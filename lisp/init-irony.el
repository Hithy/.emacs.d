(provide 'init-irony)

(require 'init-company)

(require-package 'company-irony)

(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

(after-load 'company
  (add-to-list 'company-backends 'company-irony)
  )

