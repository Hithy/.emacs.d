(require 'package)
(setq package-list '(use-package))

(setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
			 ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
			 ("org" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/")
			 ("melpa-stable" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa-stable/")))
(package-initialize) ;; You might already have this line

(unless package-archive-contents
  (package-refresh-contents))

(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (tango-dark)))
 '(package-selected-packages
   (quote
    (eglot benchmark-init company-irony-c-headers company-irony counsel ivy projectile ggtags neotree multiple-cursors autopair company helm use-package nyan-mode)))
    )
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(require 'use-package)

;; global setting
;; mode & hook
(desktop-save-mode t)
(add-hook 'after-init-hook 'global-linum-mode)
(tool-bar-mode -1)
(setq indent-tabs-mode t)
(setq c-basic-offset 8)
(c-set-offset 'substatement-open 0)

;; config
(setq scroll-step 1)
(setq scroll-conservatively 10000)
(setq auto-window-vscroll nil)

;; font
(cond
 ((string-equal system-type "windows-nt") ; Microsoft Windows
  (when (member "DejaVu Sans Mono" (font-family-list))
    (add-to-list 'initial-frame-alist '(font . "DejaVu Sans Mono-13"))
    (add-to-list 'default-frame-alist '(font . "DejaVu Sans Mono-13"))))
 ((string-equal system-type "darwin") ; macOS
  (when (member "Menlo" (font-family-list))
    (add-to-list 'initial-frame-alist '(font . "Menlo"))
    (add-to-list 'default-frame-alist '(font . "Menlo"))))
 ((string-equal system-type "gnu/linux") ; linux
  (when (member "DejaVu Sans Mono" (font-family-list))
    (add-to-list 'initial-frame-alist '(font . "DejaVu Sans Mono-12"))
    (add-to-list 'default-frame-alist '(font . "DejaVu Sans Mono-12")))))

;; keybind
(global-set-key (kbd "M-n") (quote scroll-up-line))
(global-set-key (kbd "M-p") (quote scroll-down-line))


(defun create-scratch-buffer nil
  "create a scratch buffer"
  (interactive)
  (switch-to-buffer (get-buffer-create "*scratch*"))
  (lisp-interaction-mode))
(global-set-key (kbd "C-c n") 'create-scratch-buffer)

;; others
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)

(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

;; packages config
(use-package benchmark-init
  :ensure t
  :config
  (add-hook 'after-init-hook 'benchmark-init/deactivate)
  )


(if (string-equal system-type "gnu/linux")
    (use-package ggtags
      :ensure t
      :init
      (add-hook 'c-mode-common-hook
             (lambda ()
               (when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
                 (ggtags-mode 1))))
      )
)

(use-package autopair
  :ensure t
  :config
  (autopair-global-mode)
  )

(use-package company
  :ensure t
  :hook (after-init . global-company-mode)
  :config
  (setq company-idle-delay 0)
  )

(use-package company-irony
  :ensure t
  :config
  (add-to-list 'company-backends 'company-irony)
  )

;; (use-package yasnippet
;;   :ensure t
;;   :config
;;   (yas-global-mode t)
;;   )

;; (use-package nyan-mode
;;   :ensure t
;;   :config
;;   (nyan-mode t)
;;   (nyan-start-animation)
;;   )

(use-package projectile
  :ensure t
  :config
  (projectile-mode +1)
  (setq projectile-enable-caching t)
  (setq projectile-completion-system 'ivy)
  :bind-keymap
  ("C-c p" . projectile-command-map)
  )

(use-package neotree
  :ensure t
  :bind(([f8] . neotree-toggle))
  )

(use-package multiple-cursors
  :ensure t
  :bind(
	("C-." . mc/mark-next-like-this)
	("C-," . mc/mark-previous-like-this)
	("C->" . mc/skip-to-next-like-this)
	("C-<" . mc/skip-to-previous-like-this)
	)
  )

(use-package counsel
  :ensure t
  )

(use-package swiper
  :ensure t
  )

(use-package ivy
  :ensure t
  :init
  (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "[%d/%d] ")
  :config
  (ivy-mode 1)
  :bind
  ("C-s" . swiper)
  ("M-x" . counsel-M-x)
  ("C-x C-f" . counsel-find-file)
  ("<f1> f" . counsel-describe-function)
  ("<f1> v" . counsel-describe-variable)
  ("<f1> l" . counsel-find-library)
  ("<f2> i" . counsel-info-lookup-symbol)
  ("<f2> u" . counsel-unicode-char)
  )
