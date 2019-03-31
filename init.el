(setq debug-on-error t)

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(require 'init-packages)

(require 'init-basic)
(require 'init-appearance)
(require 'init-config)
(require 'init-company)
(require 'init-irony)
(require 'init-autopair)
(require 'init-multi-cursor)

(require 'init-ivy)
(require 'init-project)
