(provide 'init-company)

(require-package 'company)
(require-package 'company-quickhelp)


(add-hook 'after-init-hook 'global-company-mode)

(after-load 'company
  (setq-default company-idle-delay 0)
  (company-quickhelp-mode)
  )

