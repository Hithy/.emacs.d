;; -*- lexical-binding: t -*-
(provide 'init-packages)

(require 'package)
(setq package-archives '(("gnu"   . "https://mirrors.sjtug.sjtu.edu.cn/emacs-elpa/gnu/")
			 ("melpa" . "https://mirrors.sjtug.sjtu.edu.cn/emacs-elpa/melpa/")
			 ("org" . "https://mirrors.sjtug.sjtu.edu.cn/emacs-elpa/org/")
			 ("melpa-stable" . "https://mirrors.sjtug.sjtu.edu.cn/emacs-elpa/stable-melpa/")))
(setq package-archive-priorities
         '(("melpa-stable" . 20)
           ("org" . 10)
           ("gnu" . 10)
           ("melpa" . 50)))
(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(defun require-package (package)
  (package-installed-p package)
  (package-install package))

;; 只要内存大，要什么垃圾回收←_←
(setq gc-cons-threshold (* 10 1024 1024))

(if (fboundp 'with-eval-after-load)
    (defalias 'after-load 'with-eval-after-load)
  (defmacro after-load (feature &rest body)
    "After FEATURE is loaded, evaluate BODY."
    (declare (indent defun))
    `(eval-after-load ,feature
       '(progn ,@body))))

