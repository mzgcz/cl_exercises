;;; http://rosettacode.org/wiki/99_Bottles_of_Beer

;; X bottles of beer on the wall
;; X bottles of beer
;; Take one down, pass it around
;; X-1 bottles of beer on the wall

;; X-1 bottles of beer on the wall
;; ...
;; Take one down, pass it around
;; 0 bottles of beer on the wall

;;; 生成n~0的列表，表示N+1个轮回
(defun get-bottles-list (&optional (n 99))
  (loop for no from n downto 1 collect no))

;;; 按列表信息打印诗歌
(defun print-song (l)
  (mapcar (lambda (x)
            (format t "~S bottle~P of beer on the wall~%" x x)
            (format t "~S bottle~P of beer~%" x x)
            (format t "Take one down, pass it around~%")
            (format t "~S bottle~P of beer on the wall~%" (1- x) (1- x))
            (if (/= 1 x) (format t "~%")))
          l))

;;; 游戏开始
(defun game-start ()
  (print-song (get-bottles-list))
  'done)
