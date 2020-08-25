(provide 'init-dev-cxx)

(when (my-executable-find "ccls")
  (require-package 'ccls)

  (defun load-ccls ()
    (require 'ccls)
    (setq-local indent-tabs-mode t)
    (setq-local c-basic-offset 8)
    (lsp)
    )

  (add-hook 'c++-mode-hook 'load-ccls)
  (add-hook 'c-mode-hook 'load-ccls)
  (add-hook 'objc-mode-hook 'load-ccls)
  )

(add-hook 'c++-mode-hook
          (lambda ()
            (unless (or (file-exists-p "makefile")
                        (file-exists-p "Makefile")
                        (file-exists-p "CMakeLists.txt"))
              (set (make-local-variable 'compile-command)
                   (concat "clang++ -std=c++17 "
                           buffer-file-name
                           " -o "
                           (file-name-sans-extension buffer-file-name)
                           "; "
                           (file-name-sans-extension buffer-file-name)))
              )
            ))

(setq lsp-prefer-flymake nil)
(setq-default flycheck-disabled-checkers '(c/c++-clang c/c++-cppcheck c/c++-gcc))



