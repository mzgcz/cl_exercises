;;; http://rosettacode.org/wiki/Accumulator_factory

;; 累加器
;; x = foo(1);
;; x(5);
;; foo(3);
;; print x(2.3);
;; it's 8.3

(defun accumulator_factory (sum)
  (lambda (plus)
    (incf sum plus)))

(defvar x (accumulator_factory 1))

(funcall x 5)

(accumulator_factory 3)

(print (funcall x 2.3))
