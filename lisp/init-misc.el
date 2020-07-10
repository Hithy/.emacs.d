(provide 'init-misc)

;; avy
(require-package 'avy)
(global-set-key (kbd "C-;") 'avy-goto-char)

;; highlight-symbol
(require-package 'highlight-symbol)
(global-set-key (kbd "C-<f9>") 'highlight-symbol)
(global-set-key (kbd "<f9>") 'highlight-symbol-next)
(global-set-key (kbd "M-<f9>") 'highlight-symbol-query-replace)

(global-set-key (kbd "<f5>") (lambda () (interactive) (revert-buffer nil t)))

;; org-bullet
(require-package 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

;; translage
;; (require-package 'google-translate)
;; (require 'google-translate)
;; (require 'google-translate-default-ui)
;; (setq google-translate-base-url "http://translate.google.cn/translate_a/single")
;; (setq google-translate-listen-url "http://translate.google.cn/translate_tts")
;; (setq google-translate-default-target-language "zh-CN")
;; (setq google-translate-default-source-language "auto")
;; (global-set-key "\C-ct" 'google-translate-at-point)
;; (global-set-key "\C-cT" 'google-translate-query-translate)
