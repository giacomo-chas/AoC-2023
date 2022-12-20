;; AoC 2023
;; day 1

(defun day-1-part-1 (file)
  (let ((input (read-input-file file))
        (elves '(())))
    (mapcar (lambda (line)
              (if (equal line "")
                  (push '() elves)
                (push (string-to-number line) (car elves))))
            input)
    (message (format "%d" (apply 'max (mapcar (lambda (x) (apply '+ x)) elves))))))

(day-1-part-1 "input")

(defun day-1-part-2 (file)
  (let ((input (read-input-file file))
        (elves '(())))
    (mapcar (lambda (line)
              (if (equal line "")
                  (push '() elves)
                (push (string-to-number line) (car elves))))
            input)
    (let ((result (sort (mapcar (lambda (x) (apply '+ x)) elves)
                                '>)))
      (+ (nth 0 result)
         (nth 1 result)
         (nth 2 result)))))

(day-1-part-2 "input")
