(defun read-input-file (file)
  "Read FILE and get out a list of strings, once for each line"
  (with-temp-buffer
    (insert-file-contents file)
    (beginning-of-buffer)
    (split-string (buffer-substring (point-min) (point-max)) "\n")))
