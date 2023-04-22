(defun gen ()
  (list
   (hero)
   'defeated
   'the
   (monster)))

(defun hero ()
  (let ((r (random (- 4 1))))
    (nth r '(bob sally sue george))))

(defun monster ()
  (let ((r (random (- 4 1))))
    (nth r '(fish spider dragon roach))))

(defun test ()
  (gen))
