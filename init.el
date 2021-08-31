(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

(require 'init-env)

(require 'init-packages)
(require 'init-common) ;; common func
(require 'init-basic) ;; profiler
(require 'init-appearance)
(require 'init-config)

(require 'init-ivy)
(require 'init-multi-cursor)
(require 'init-autopair)
(require 'init-markdown)

(require 'init-project)

(require 'init-dev-common)
(require 'init-yasnippet)
(require 'init-company)
(require 'init-lsp)
(require 'init-dev-cxx)
(require 'init-dev-go)
(require 'init-python)
(require 'init-org)

(require 'init-elfeed)

(require 'init-misc)

(when (file-exists-p custom-file)
  (load custom-file))
