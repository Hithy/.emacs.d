;;; -*- lexical-binding: t; -*-
(provide 'init-python)

;; (require-package 'lsp-python-ms)
;; (require 'lsp-python-ms)

(require-package 'lsp-pyright)
(require 'lsp-pyright)

(setq init-python-ignore-regxp '("share_protocol"))
(defun reduce_nil (a b)
  (if (and (null a) (null b))
      nil
    1
    )
  )

(defun check_python_file_need_lsp (file_path)
  (null (reduce 'reduce_nil (map 'list
                           #'(lambda (regxp-string) (string-match-p (regexp-quote regxp-string) file_path))
                           init-python-ignore-regxp
                           )
                )
        )
  )

(defun python-dev-init ()
    (setq-local indent-tabs-mode t)
    (setq python-indent-offset 8)

    (when (check_python_file_need_lsp buffer-file-name)
      (setq lsp-pyright-extra-paths (vector "./script" "./data" "./pycharm/stubs"))
      (setq-local lsp-enable-snippet nil)
      (setq-local lsp-diagnostic-package :none)
      (lsp)

      (setq-local flycheck-check-syntax-automatically '(save mode-enable))
      (flycheck-mode)
      (flycheck-select-checker 'python-pylint)
      )
    ;; (setq lsp-python-ms-extra-paths '("./script" "./data" "./pycharm/stubs"))
    )

;; (lsp-register-custom-settings '(("python.analysis.autoSearchPaths" :json-false)))
(add-hook 'python-mode-hook (lambda ()
			      (python-dev-init)
			      ))
  


