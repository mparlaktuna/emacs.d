(add-to-list 'auto-mode-alist '("\\.cu\\'" . c++-mode))

(defun add-semicolon ()
  (interactive)
  ;; Keep cursor motion within this block (don't move the users cursor).
  (save-excursion
    ;; Typically mapped to the "End" key.
    (call-interactively 'move-end-of-line)
    (insert ";")))
