(defun my-swap-buffer ()
  "Swap buffers with next window"
  (interactive)
  (let* ((current (selected-window))
	 ;; Zero means this does not select minibuffer even if it's active
	 (other (next-window current 0))
	 (current-buf (window-buffer current)))
    (unless (or (eq current other)
		(window-minibuffer-p current))
      (set-window-buffer (selected-window) (window-buffer other))
      (set-window-buffer other current-buf)
            (select-window other))))
