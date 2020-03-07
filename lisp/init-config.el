(provide 'init-config)

(desktop-save-mode)
(setq desktop-restore-eager 5)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(menu-bar-mode 0)

;; indent and tabs offset
(setq-default indent-tabs-mode nil)
(setq-default c-basic-offset 4)
(c-set-offset 'substatement-open 0)

(setq scroll-step 1)
(setq scroll-conservatively 10000)
(setq auto-window-vscroll nil)
(global-set-key (kbd "M-n") (quote scroll-up-line))
(global-set-key (kbd "M-p") (quote scroll-down-line))
(global-set-key (kbd "C-c n") 'create-scratch-buffer)

;; wind move
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

;; yank and search string at point
(require 'init-common)
(global-set-key (kbd "C-c f") 'swiper-isearch-thing-at-point)

(global-set-key (kbd "s-k") (lambda ()
			      (interactive)
			      (kill-new (get-string-at-point))
			      ))

(global-set-key (kbd "s-s") (lambda ()
			      (interactive)
			      (swiper (get-string-at-point))
			      ))

(global-set-key (kbd "s-h") (lambda ()
			      (interactive)
			      (highlight-word-at-point)
			      ))

(when *is-mac*
  (setq mac-command-modifier 'meta)
  (setq mac-option-modifier 'alt)
  (exec-path-from-shell-initialize)
  )

