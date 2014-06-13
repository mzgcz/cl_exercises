;;; http://rosettacode.org/wiki/ABC_Problem

;; 给定由双元素组成的单词表
;; 单词表中每个元素仅能使用一次
;; 判断给定单词能否由单词表组成

;;; 单词表
(defparameter *word-list* '((B O) (X K) (D Q) (C P) (N A)
                            (G T) (R E) (T G) (Q D) (F S)
                            (J W) (H U) (V I) (A N) (O B)
                            (E R) (F S) (L Y) (P C) (Z M)))

;;; 列表删除某个元素
(defun list-cell (list cell)
  (let ((flag 0)
        new-list)
    (dolist (var list (reverse new-list))
      (if (and (= flag 0) (equal var cell))
          (incf flag)
          (push var new-list)))))

;;; 判断给定单词是否能由单词表组成
(defun can-make-word (word word-list)
  (if (> (length word) 0)
      ;; 判断首字母能否由word-list组成
      ;; 若能，判断剩余字母能否由剩余word-list组成
      ;; 若否，则返回nil
      (dolist (rest-word-list (can-make-letter (char-upcase (aref word 0)) word-list) nil)
        (if (can-make-word (subseq word 1) rest-word-list)
            (return t)))
      t))

;;; 判断给定字母是否能由单词表组成
(defun can-make-letter (letter word-list)
  (let (rest-word-list)
    (dolist (word word-list)
      (if (member letter (mapcar #'character word))
          (push (list-cell word-list word) rest-word-list)))
    rest-word-list))
