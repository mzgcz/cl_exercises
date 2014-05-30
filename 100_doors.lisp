;; http://rosettacode.org/wiki/100_doors

;;; 每次访问时，变更门的状态
(defun switch-door (door)
  (not door))

;;; 第no次访问时，访问no的倍数号门
(defun access-door (no N doors)
  (let ((copy-doors (copy-list doors)))
    (loop for i from no upto N by no
       do (setf (nth (1- i) copy-doors) (switch-door (nth (1- i) copy-doors))))
    copy-doors))

;;; 启动
(defun start-doors-game (&optional (N 100))
  ;;; N扇门，初始状态为关闭
  (let ((doors (make-list N :initial-element nil))
        (no-list (loop for i from 1 upto 100 collect i)))
    ;;; 访问N次
    (mapcar (lambda (no)
              (setf doors (access-door no N doors)))
            no-list)
    doors))

(print (start-doors-game))
