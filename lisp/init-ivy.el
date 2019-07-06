(provide 'init-ivy)

(require-package 'ivy)
(require-package 'swiper)
(require-package 'counsel)
(require-package 'ivy-xref)

(setq-default ivy-use-virtual-buffers t)
(setq-default ivy-count-format "[%d/%d] ")

(setq xref-show-xrefs-function #'ivy-xref-show-xrefs)


(add-hook 'after-init-hook 'ivy-mode)
(after-load 'ivy
  (global-set-key (kbd "C-s") 'swiper)
  (global-set-key (kbd "M-x") 'counsel-M-x)
  (global-set-key (kbd "C-x C-f") 'counsel-find-file)
  (global-set-key (kbd "<f1> f") 'counsel-describe-function)
  (global-set-key (kbd "<f1> v") 'counsel-describe-variable)
  (global-set-key (kbd "<f1> l") 'counsel-find-library)
  (global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
  (global-set-key (kbd "<f2> u") 'counsel-unicode-char)
  )


