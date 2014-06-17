;;; http://rosettacode.org/wiki/Ackermann_function

;; if m=0, A(m,n)=n+1
;; if m>0 and n=0, A(m,n)=A(m-1,1)
;; if m>0 and n>0, A(m,n)=A(m-1,A(m,n-1))

(defun ackermann_function (m n)
  (cond ((= m 0) (1+ n))
        ((= n 0) (ackermann_function (1- m) 1))
        (t (ackermann_function (1- m) (ackermann_function m (1- n))))))

(print (ackermann_function 0 5))
(print (ackermann_function 0 6))
(print (ackermann_function 1 4))
(print (ackermann_function 1 5))
(print (ackermann_function 2 3))
(print (ackermann_function 2 4))
(print (ackermann_function 3 2))
(print (ackermann_function 3 3))
(print (ackermann_function 3 4))
