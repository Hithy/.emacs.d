(provide 'init-basic)

(require-package 'benchmark-init)
(require 'benchmark-init)
(add-hook 'after-init-hook 'benchmark-init/deactivate)

(require-package 'neotree)
(global-set-key (kbd "<f8>") 'neotree-toggle)

(require-package 'exec-path-from-shell)

(require-package 'ripgrep)
