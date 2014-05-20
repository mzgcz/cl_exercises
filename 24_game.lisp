;; http://rosettacode.org/wiki/24_game

;;; 24算术游戏，给4个随机数（1 ... 9），利用加、减、乘、除以及括号，使最终结果为24

;;; 选取四个随机数
(defun get-4-random-num ()
  (let (num-list)
    (dotimes (no 4 num-list)
      (push (1+ (random 9)) num-list))))

;;; 读取用户输入
(defun read-input ()
  (read-line *standard-input* nil nil))

;;; 执行用户输入，判定是否为24
