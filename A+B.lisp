;;; http://rosettacode.org/wiki/A%2BB

(defun A+B ()
  (format t "Please Input Two Numbers: ")
  (let ((A (read))
        (B (read)))
    (format t "~S + ~S = ~S~%" A B (+ A B))))
