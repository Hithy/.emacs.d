(provide 'init-dev-cxx)

(when (my-executable-find "ccls")
  (require-package 'ccls)

  (defun load-ccls ()
    (require 'ccls)
    ;; (setq-local indent-tabs-mode t)
    ;; (setq-local c-basic-offset 4)
    (lsp)
    )

  (add-hook 'c++-mode-hook 'load-ccls)
  (add-hook 'c-mode-hook 'load-ccls)
  (add-hook 'objc-mode-hook 'load-ccls)
  )

(require-package 'google-c-style)

(add-hook 'c-mode-common-hook 'google-set-c-style)

(add-hook 'c++-mode-hook
          (lambda ()
	    (unless (or (file-exists-p "makefile")
		        (file-exists-p "CMakeLists.txt")
		        (file-exists-p "Makefile"))
              (let ((output-file-name (concat (file-name-sans-extension buffer-file-name) ".out")))
                (set (make-local-variable 'compile-command)
		     (concat "clang++ -std=c++17 \""
                             buffer-file-name
                             "\" -o \""
                             output-file-name
                             "\" && \""
                             output-file-name
                             "\""
                             ))))))

(setq lsp-prefer-flymake nil)
(setq-default flycheck-disabled-checkers '(c/c++-clang c/c++-cppcheck c/c++-gcc))



