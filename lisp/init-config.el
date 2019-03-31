(provide 'init-config)

(add-hook 'after-init-hook 'global-linum-mode)

(desktop-save-mode)
(tool-bar-mode -1)

;; indent and tabs offset
(setq-default indent-tabs-mode t)
(setq-default c-basic-offset 8)
(c-set-offset 'substatement-open 0)

(setq scroll-step 1)
(setq scroll-conservatively 10000)
(setq auto-window-vscroll nil)
(global-set-key (kbd "M-n") (quote scroll-up-line))
(global-set-key (kbd "M-p") (quote scroll-down-line))


(defun create-scratch-buffer nil
  "create a scratch buffer"
  (interactive)
  (switch-to-buffer (get-buffer-create "*scratch*"))
  (lisp-interaction-mode))
(global-set-key (kbd "C-c n") 'create-scratch-buffer)

;; wind move
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))


;; (if (string-equal system-type "gnu/linux")
;;     (use-package ggtags
;;       :ensure t
;;       :init
;;       (add-hook 'c-mode-common-hook
;;              (lambda ()
;;                (when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
;;                  (ggtags-mode 1))))
;;       )
;; )


