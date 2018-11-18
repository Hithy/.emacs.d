(require 'package)
(setq package-list '(cnfonts autopair phi-search cmake-mode markdown-mode neotree git helm jedi-direx yasnippet-snippets highlight-parentheses multiple-cursors company-jedi python-mode nyan-mode company))

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

(require 'nyan-mode)
(nyan-mode t)
(nyan-start-animation)

