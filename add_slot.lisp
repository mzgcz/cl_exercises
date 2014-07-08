;;; http://rosettacode.org/wiki/Add_a_variable_to_a_class_instance_at_runtime

;; add a variable to a class instance at runtime

(defclass person () (name))

(defvar *I* (make-instance 'person))

(setf (slot-value *I* 'name) "jwj")

(defclass person () (name sex))

(setf (slot-value *I* 'sex) "male")

(defclass person () (name sex age))

(setf (slot-value *I* 'age) 30)

(format t "Name:~S Sex:~S Age:~S"
        (slot-value *I* 'name)
        (slot-value *I* 'sex)
        (slot-value *I* 'age))
