(provide 'init-dev-cxx)

(when (my-executable-find "clangd")
  (defun load-lsp ()
    (setq-local indent-tabs-mode t)
    (setq-local c-basic-offset 4)
    (setq-local tab-width 4)
    (require 'clang-format)
    (lsp)
    )

  (add-hook 'c++-mode-hook 'load-lsp)
  (add-hook 'c-mode-hook 'load-lsp)
  (add-hook 'objc-mode-hook 'load-lsp)
  )

(require-package 'clang-format)

;; (require-package 'google-c-style)
;; (add-hook 'c-mode-common-hook 'google-set-c-style)

(defun is_cmake_project ()
  (let ((project-root (vc-root-dir)))
    (if (eq project-root nil)
        nil
      (file-exists-p (concat project-root "CMakeLists.txt"))
      )
    )
  )

(defun gen_cmake_gen_proj_command ()
  (if (my-executable-find "ninja")
      "cmake -B build_ninja -G \"Ninja\" ."
    "cmake -B build ."
    )
  )

(defun gen_cmake_move_cdb_file_command ()
  (if (my-executable-find "ninja")
      "cmake -E copy_if_different build_ninja/compile_commands.json compile_commands.json"
    (if (not *is-windows*)
        "cmake -E copy_if_different build/compile_commands.json compile_commands.json"
      ""
      )
    )
  )

(defun gen_cmake_compile_command (target)
  (concat
   (if (my-executable-find "ninja")
       "cmake --build build_ninja --target "
     "cmake --build build --target "
     )
   target
   )
  )

(defun gen_cmake_run_command ()
  (concat "cd " (vc-root-dir)
          " && " (gen_cmake_gen_proj_command)
          (let ((cdb_command (gen_cmake_move_cdb_file_command)))
            (if (eq cdb_command "")
                ""
              (concat " && " cdb_command))
            )
          " && " (gen_cmake_compile_command "all")
          " && " (gen_cmake_compile_command "run")
          )
  )

(defun gen_normal_run_command ()
  (message "gen normal run command")
  (let ((output-file-name (concat (file-name-sans-extension buffer-file-name) ".out")))
    (concat "clang++ -std=c++20 "
            (prin1-to-string buffer-file-name)
            " -o "
            (prin1-to-string output-file-name)
            " && "
            (prin1-to-string output-file-name))
    )
  )

(defun set_local_compile_command ()
  (set (make-local-variable 'compile-command)
       (if (is_cmake_project)
           (gen_cmake_run_command)
         (gen_normal_run_command)
         )
       )
  )

(defun cxx-run ()
  (if (eq compile-command nil)
      (set_local_compile_command)
    )
  (compile compile-command)
  )

(add-hook 'c++-mode-hook
          (lambda ()
            (set (make-local-variable 'compile-command) nil)
            (local-set-key (kbd "C-c c") (lambda ()
                                           (interactive)
                                           (cxx-run)
                                           ))
            ))

(setq lsp-prefer-flymake nil)
(setq-default flycheck-disabled-checkers '(c/c++-clang c/c++-cppcheck c/c++-gcc))



