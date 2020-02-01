(provide 'init-org)

(require-package 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

;; (require-package 'org-download)
;; (require 'org-download)
;; (setq-default org-download-image-dir "~/.emacs.d/org-img")
;; (setq org-download-screenshot-method "screenshot -i")
;; (setq org-download-screenshot-file "~/.emacs.d/org-img/tmp.png")
