;;; http://rosettacode.org/wiki/24_game/Solve

;;; 选取N个1~9的随机数
(defun get-nums (num)
  (let (num-list)
    (dotimes (no num num-list)
      (push (1+ (random 9)) num-list))))

;;; 生成4个1～9的随机数
(get-nums 4)

;;; 进行所有操作的排列组合
(defun op-list ()
  (let (lists)
    (loop for op1 in '(+ - * /)
       do (loop for op2 in '(+ - * /)
             do (loop for op3 in '(+ - * /)
                   do (push (list op1 op2 op3) lists))))
    lists))

;;; 生成各种排列
(defun permutation-list (l)
  (let (lists)
    (loop for 1st from 0 below 4
       do (loop for 2nd from 0 below 4
             do (loop for 3rd from 0 below 4
                   do (loop for 4th from 0 below 4
                         do (if (/= 1st 2nd 3rd 4th)
                                (push (list (nth 1st l) (nth 2nd l) (nth 3rd l) (nth 4th l)) lists))))))
    lists))

;;; 判断操作结果是否为24
