(provide 'init-appearance)

(require-package 'all-the-icons)

(require-package 'unicode-fonts)
(require 'unicode-fonts)
(unicode-fonts-setup)

;; (require-package 'nyan-mode)
;; (nyan-mode t)
;; (nyan-start-animation)

;; doom mode line and themes
(require-package 'doom-modeline)
(setq doom-modeline-buffer-file-name-style 'relative-to-project)
(doom-modeline-mode 1)
(require-package 'doom-themes)
(load-theme 'doom-vibrant t)
