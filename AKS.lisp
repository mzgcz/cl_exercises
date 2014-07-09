;;; http://rosettacode.org/wiki/AKS_test_for_primes

;; 任务：
;; 1. 创建生成 (x-1)^p的参数列表的函数
;; 2. 展示 (x-1)^p的参数列表，p从0到7
;; 3. 创建使用上述参数列表判断p是否为素数的函数
;; 4. 测试一系列35以下的素数
;; 5. 生成50以下的所有素数

;;; 排列计数
(defun Permutation (n)
  (if (zerop n)
      1
      (* n (Permutation (1- n)))))

;;; 组合计数
(defun Combination (n m)
  (/ (Permutation n) (* (Permutation (- n m)) (Permutation m))))

;;; 二项式系数列表
(defun Binomial (n &optional (constant 1))
  (loop for m from 0 to n collect (* (Combination n m) (expt constant m))))

;;; p从1-7的参数列表
(loop for i from 0 to 7 collect (Binomial i -1))

;;; 判断是否能整除
(defun divide? (n m)
  (let ((remainder (cadr (multiple-value-list (floor n m)))))
    (if (zerop remainder)
        t
        nil)))

;;; 素数判断
(defun Primes? (n)
  (let* ((binomial-list (Binomial n -1))
         (sub-list (loop for i from 0 to n collect
                        (cond ((= i 0) 1)
                              ((= i n) -1)
                              (t 0))))
         (judge-list (mapcar #'- binomial-list sub-list)))
    (dolist (no judge-list)
      (when (not (divide? no n))
        (return-from Primes? nil))))
  t)

(mapcar #'Primes? '(2 3 5 7 11 13 17 19 23 29 31))

(loop for i from 2 to 50 collect (if (Primes? i) i))
