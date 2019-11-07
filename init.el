(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(require 'init-common)
(require 'init-packages)
(require 'init-basic)
(require 'init-appearance)
(require 'init-config)
(require 'init-flycheck)
(require 'init-lsp)
(require 'init-company)
(require 'init-ccls)
;;(require 'init-irony)
(require 'init-autopair)
(require 'init-multi-cursor)
(require 'init-yasnippet)
(require 'init-python)
(require 'init-dev-common)

(require 'init-ivy)
(require 'init-project)

(require 'init-grep)
(require 'init-markdown)

(require 'init-misc)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(ripgrep telega cmake-mode pdf-tools racket-mode highlight-symbol wakatime-mode irony markdown-mode projectile counsel swiper ivy yasnippet-snippets yasnippet multiple-cursors autopair company-irony company-quickhelp company nyan-mode cnfonts neotree benchmark-init))
 '(wakatime-api-key "05f6075d-e15c-4381-af98-c1150505228c"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
