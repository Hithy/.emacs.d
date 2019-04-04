(provide 'init-common)

(defun get-string-at-point ()
  (let ((bounds (bounds-of-thing-at-point 'symbol)))
    (when bounds
      (buffer-substring-no-properties (car bounds) (cdr bounds))
      )
    )
  )

(setq-default current-highlight-regexp nil)

(add-to-list 'after-change-major-mode-hook (lambda ()
					     (make-local-variable 'current-highlight-regexp)
					     ))

(defun highlight-word-at-point()
  
  (defun clear-highlight()
    (unhighlight-regexp current-highlight-regexp)
    (setq current-highlight-regexp nil)
    )
  
  (let ((word (get-string-at-point)))
    (if (eq word nil)
	(clear-highlight)
      (let ((new-regexp (regexp-quote word)))
	(if (string-equal new-regexp current-highlight-regexp)
	    (clear-highlight)
	  (unhighlight-regexp current-highlight-regexp)
	  (highlight-regexp new-regexp)
	  (setq current-highlight-regexp new-regexp)
	    )
	)
      )
    )
  )





