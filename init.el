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
    (multiple-cursors yasnippet autopair company helm use-package nyan-mode))))
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

;; config
(setq scroll-step 1)
(setq scroll-conservatively 10000)
(setq auto-window-vscroll nil)

;; keybind
(global-set-key (kbd "M-n") (quote scroll-up-line))
(global-set-key (kbd "M-p") (quote scroll-down-line))

(defun create-scratch-buffer nil
       "create a scratch buffer"
       (interactive)
       (switch-to-buffer (get-buffer-create "*scratch*"))
       (lisp-interaction-mode))
(global-set-key (kbd "C-c n") 'create-scratch-buffer)


;; packages config
(use-package autopair
  :ensure t
  :config
  (autopair-global-mode)
  )

(use-package company
  :ensure t
  :init
  (add-hook 'after-init-hook 'global-company-mode)
  :config
  (setq company-idle-delay 0)
  )

(use-package yasnippet
  :ensure t
  :config
  (yas-global-mode t)
  )

(use-package nyan-mode
  :ensure t
  :config
  (nyan-mode t)
  (nyan-start-animation)
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

(use-package helm
  :ensure t
  :config
  (setq helm-M-x-fuzzy-match t
	helm-buffers-fuzzy-matching t
	helm-recentf-fuzzy-match t
	helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
	helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
	helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
	helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
	helm-ff-file-name-history-use-recentf t
	helm-echo-input-in-header-line t
	)
  :bind (
	 ("M-x" . helm-M-x)
	 ("M-y" . helm-show-kill-ring)
	 ("C-x C-f" . helm-find-files)
	 ("C-x b" . helm-mini)
	 ("C-c h o" . helm-occur)
	 )
  )
