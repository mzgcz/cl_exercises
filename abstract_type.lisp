;; http://rosettacode.org/wiki/Abstract_type

;;; 抽象类型

(defclass people () (sex age))

(defclass teacher (people) (subject))

(defclass student (people) (id))

(let ((teacher-1 (make-instance 'teacher))
      (student-1 (make-instance 'student)))
  (print (type-of teacher-1))
  (print (type-of student-1))
  (print (typep teacher-1 'people))
  (print (typep student-1 'people)))
