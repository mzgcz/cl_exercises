;;;; 24_game_slove.lisp
;;; http://rosettacode.org/wiki/24_game/Solve

(in-package #:24_game_slove)

;;; "24_game_slove" goes here. Hacks and glory await!

;;; 列表删除某个元素
(defun list-cell (list cell)
  (let ((flag 0)
        new-list)
    (dolist (var list (reverse new-list))
      (if (and (= flag 0) (equal var cell))
          (incf flag)
          (push var new-list)))))

;;; 获取n个1~9的数字
(defun get-n-num (n)
  (loop for i from 1 to n collect (1+ (random 9))))

;;; 生成列表的全排列
(defun get-num-list (num-list)
  (if (= 1 (length num-list))
      (list num-list)
      (alexandria:mappend (lambda (num)
                            (let ((rest-list (get-num-list (list-cell num-list num))))
                              (mapcar (lambda (rest-1)
                                        (cons num rest-1))
                                      rest-list)))
                          num-list)))

;;; 获取所有操作的排列组合
(defun get-op-list (n)
  (let ((ops '(+ - * /)))
    (if (= n 1)
        (mapcar #'list ops)
        (alexandria:mappend (lambda (op-1)
                              (mapcar (lambda (op-2)
                                        (cons op-2 op-1))
                                      ops))
                            (get-op-list (1- n))))))

;;; 由运算符列表和数字列表，确定组合式
(defun get-equation (op-list num-list)
  (let ((op-1 (car op-list))
        (num-1 (car num-list)))
    (if (= 1 (length op-list))
        (list (cons op-1 num-list)
              (cons op-1 (reverse num-list)))
        (alexandria:mappend (lambda (equation-1)
                              (list (list op-1 num-1 equation-1)
                                    (list op-1 equation-1 num-1)))
                            (get-equation (cdr op-list) (cdr num-list))))))

;;; 执行算术表达式
;;; 若存在除0错误，则返回最大fixnum
(defun eval-equation (equation)
  (handler-case (eval equation)
    (division-by-zero () most-positive-fixnum)))

;;; game start
(defun game-start ()
  (let ((4-num-list (get-n-num 4)))     ;获取4个1～9的随机数
    (format t "Task: Use Four Number ~S To Get 24" 4-num-list)
    (mapcar (lambda (op-list)
              (mapcar (lambda (num-list)
                        (mapcar (lambda (equation-1)
                                  (when (= 24 (eval-equation equation-1))
                                    (format t "~&There Is A Slove: ~S" equation-1)
                                    (return-from game-start)))
                                (get-equation op-list num-list))) ;生成算符和数字的所有组合
                      (get-num-list 4-num-list))) ;生成数字列表
            (get-op-list 3)))           ;生成算符列表
  (format t "~&There Is No Slove"))
