(provide 'init-appearance)

(require-package 'all-the-icons)
(require-package 'cnfonts)
(add-hook 'after-init-hook 'cnfonts-enable)
(add-hook 'cnfonts-set-font-finish-hook
	  (lambda (fontsize-list)
	    (set-fontset-font t 'unicode (font-spec :family "all-the-icons") nil 'append)
	    (set-fontset-font t 'unicode (font-spec :family "file-icons") nil 'append)
	    (set-fontset-font t 'unicode (font-spec :family "Material Icons") nil 'append)
	    (set-fontset-font t 'unicode (font-spec :family "github-octicons") nil 'append)
	    (set-fontset-font t 'unicode (font-spec :family "FontAwesome") nil 'append)
	    (set-fontset-font t 'unicode (font-spec :family "Weather Icons") nil 'append)))

(require-package 'nyan-mode)
(nyan-mode t)
(nyan-start-animation)

;; doom mode line and themes
(require-package 'doom-modeline)
(setq doom-modeline-buffer-file-name-style 'relative-to-project)
(doom-modeline-mode 1)
(require-package 'doom-themes)
(load-theme 'doom-vibrant t)
