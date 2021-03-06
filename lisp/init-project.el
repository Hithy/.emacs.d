(provide 'init-project)

(require-package 'projectile)

(add-hook 'after-init-hook 'projectile-mode)

(setq projectile-indexing-method 'alien)
(setq-default projectile-enable-caching t)
(setq-default projectile-completion-system 'ivy)

(after-load 'projectile
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  )

(require-package 'magit)

