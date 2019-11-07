(provide 'init-basic)

(require-package 'benchmark-init)
(require 'benchmark-init)
(add-hook 'after-init-hook 'benchmark-init/deactivate)

(require-package 'neotree)
(global-set-key (kbd "<f8>") 'neotree-toggle)

(require-package 'exec-path-from-shell)
(global-wakatime-mode)
(custom-set-variables '(wakatime-api-key "05f6075d-e15c-4381-af98-c1150505228c"))

(require-package 'ripgrep)
