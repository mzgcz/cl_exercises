;; http://rosettacode.org/wiki/24_game

;;; 24算术游戏，给4个随机数（1 ... 9），利用加、减、乘、除以及括号，使最终结果为24

;;; 选取N个1~9的随机数
(defun get-nums (num)
  (let (num-list)
    (dotimes (no num num-list)
      (push (1+ (random 9)) num-list))))

;;; 读取用户输入
(defun read-input ()
  (format t "~&Please Input Your Slove: ")
  (read *standard-input* nil nil))

;;; 执行用户输入，判定是否为24
(defun judge-24 ()
  (if (= 24 (eval (read-input)))
      t
      nil))

;;; 启动
(defun start-24-game ()
  ;; 选取四个1~9的随机数
  (format t "Task: Use Four Number ~S To Get 24" (get-nums 4))
  (if (judge-24)
      (format t "Well Done!")
      (format t "Sorry, Try Again!")))

(start-24-game)
