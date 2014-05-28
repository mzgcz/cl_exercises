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

;;; game start
(defun game-start ()
  ;; 获取四个1～9的随机数
  (let ((4-num-list (get-n-num 4)))
    (format t "Task: Use Four Number ~S To Get 24" 4-num-list)
    (mapcar (lambda (op-list)
              (mapcar (lambda (num-list)
                        (let ((op `(,(caddr op-list)
                                     (,(cadr op-list)
                                       (,(car op-list)
                                         ,(nth 0 num-list)
                                         ,(nth 1 num-list))
                                       ,(nth 2 num-list))
                                     ,(nth 3 num-list))))
                          ;; 判断操作结果是否为24
                          (if (= 24 (eval op))
                              (progn
                                (format t "~&There Is A Slove: ~S" op)
                                (return-from game-start)))))
                      (get-num-list 4-num-list)))
            (get-op-list 3)))
  (format t "~&There Is No Slove"))
