;; AoC 2023
;; day 2

(defun day-2-part-1 (file)
  (let ((input (read-input-file file))
        (rounds '())
        (points 0))
    (while input
      (let* ((line (pop input))
            (me (substring line 2 3))
            (opponent (substring line 0 1))
            (winner nil))
        ;; check if I won
        (if (or (and (equal me "Y")
                     (equal opponent "A"))
                (and (equal me "X")
                     (equal opponent "C"))
                (and (equal me "Z")
                     (equal opponent "B")))
            (progn
              ;; (insert "I won\n")
              (setq winner "me"))
          ;; check if opponent won
          (if (or (and (equal me "X")
                       (equal opponent "B"))
                  (and (equal me "Y")
                       (equal opponent "C"))
                  (and (equal me "Z")
                       (equal opponent "A")))
              (progn
                ;; (insert "Opponent won\n")
                (setq winner "opponent"))
            (progn
              ;; (insert "DRAW!\n")
              (setq winner "draw"))))
        (setq points (+ points
                        (cond
                         ((equal me "X")
                          1)
                         ((equal me "Y")
                          2)
                         ((equal me "Z")
                          3))
                        (cond
                         ((equal winner "me")
                          6)
                         ((equal winner "draw")
                          3)
                         ((equal winner "opponent")
                          0))))))
    points))

(day-2-part-1 "input")

(defun day-2-part-2 (file)
  (let ((input (read-input-file file))
        (rounds '())
        (points 0))
    (while input
      (let* ((line (pop input))
             (winner (substring line 2 3))
             (opponent (substring line 0 1))
             (me (cond
                  ((equal winner "X")
                   ;; I need to lose
                   (cond
                    ((equal opponent "A") "Z")
                    ((equal opponent "B") "X")
                    ((equal opponent "C") "Y")))
                  ((equal winner "Y")
                   ;; I need to draw
                   (cond
                    ((equal opponent "A") "X")
                    ((equal opponent "B") "Y")
                    ((equal opponent "C") "Z")))
                  ((equal winner "Z")
                   ;; I need to win
                   (cond
                    ((equal opponent "A") "Y")
                    ((equal opponent "B") "Z")
                    ((equal opponent "C") "X"))))))
        (setq points (+ points
                        (cond
                         ((equal me "X")
                          1)
                         ((equal me "Y")
                          2)
                         ((equal me "Z")
                          3))
                        (cond
                         ((equal winner "Z")
                          6)
                         ((equal winner "Y")
                          3)
                         ((equal winner "X")
                          0))))))
    points))

(day-2-part-2 "input")
