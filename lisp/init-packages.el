;; -*- lexical-binding: t -*-
(provide 'init-packages)

(require 'package)
(setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
			 ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
			 ("org" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/")
			 ("melpa-stable" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa-stable/")))
(setq package-archive-priorities
         '(("melpa-stable" . 20)
           ("org" . 10)
           ("gnu" . 10)
           ("melpa" . 5)))
(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(defun require-package (package)
  (package-installed-p package)
  (package-install package))

(let ((normal-gc-cons-threshold (* 20 1024 1024))
      (init-gc-cons-threshold (* 128 1024 1024)))
  (setq gc-cons-threshold init-gc-cons-threshold)
  (add-hook 'emacs-startup-hook
            (lambda () (setq gc-cons-threshold normal-gc-cons-threshold))))

(if (fboundp 'with-eval-after-load)
    (defalias 'after-load 'with-eval-after-load)
  (defmacro after-load (feature &rest body)
    "After FEATURE is loaded, evaluate BODY."
    (declare (indent defun))
    `(eval-after-load ,feature
       '(progn ,@body))))
