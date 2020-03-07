(provide 'init-python)

(require-package 'lsp-python-ms)
(require 'lsp-python-ms)

(defun python-dev-init ()
    (setq-local indent-tabs-mode t)
    (setq python-indent-offset 8)
    (flycheck-mode)
    (flycheck-select-checker 'python-pylint)
    ;; (setq lsp-python-ms-extra-paths '("./script" "./data" "./pycharm/stubs"))
    (lsp)
    )

(lsp-register-custom-settings '(("python.analysis.autoSearchPaths" :json-false)))
(add-hook 'python-mode-hook (lambda ()
			      (python-dev-init)
			      ))
  


