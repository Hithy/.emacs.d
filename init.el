(package-initialize)

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(org-babel-load-file (expand-file-name (concat user-emacs-directory "org-init.org")))
