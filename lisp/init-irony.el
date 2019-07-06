(provide 'init-irony)

(require 'init-company)

(require-package 'company-irony)
(require-package 'company-irony-c-headers)

(defun my-irnoy-mode-hook ()
  (define-key irony-mode-map [remap completion-at-point] 'counsel-irony)
  (define-key irony-mode-map [remap complete-symbol] 'counsel-irony)
  )

(setq irony-additional-clang-options '("-std=c++11"
				       "-I/usr/local/opt/llvm/bin/../include/c++/v1"
				       "-I/usr/local/include"
				       "-I/usr/local/Cellar/llvm/8.0.0_1/lib/clang/8.0.0/include"))

(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)
(add-hook 'irony-mode-hook 'my-irnoy-mode-hook)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

(after-load 'company
  (add-to-list 'company-backends '(company-irony-c-headers company-irony))
  )

