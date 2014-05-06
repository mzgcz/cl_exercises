;; http://rosettacode.org/wiki/100_doors

;;; 每次访问时，变更门的状态
(defun change-door (door)
  (not door))

;;; 第no次访问时，访问no的倍数号门
(defun access-door (no N doors)
  (loop for door in doors
     for i from 1 to N collect
       (if (= 0 (second (multiple-value-list (floor i no))))
           (change-door door)
           door)))

;;; 启动
(defun start-doors-game (&optional (N 100))
  ;;; N扇门，初始状态为关闭
  (let ((doors (make-list N :initial-element nil)))
    ;;; 访问N次
    (loop for i from 1 to N
       do (setf doors (access-door i N doors)))
    doors))

(print (start-doors-game))
