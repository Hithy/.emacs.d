(provide 'init-appearance)

;; (load-theme 'tango-dark)
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

(require-package 'cnfonts)
(add-hook 'after-init-hook 'cnfonts-enable)

(require-package 'nyan-mode)
(nyan-mode t)
(nyan-start-animation)
