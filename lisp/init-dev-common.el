(provide 'init-dev-common)

(require-package 'ag)

(global-set-key (kbd "M-s f") 'counsel-ag)
(global-set-key (kbd "C-c c") 'recompile)
