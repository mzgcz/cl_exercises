;;;; 24_game_slove.asd

(asdf:defsystem #:24_game_slove
  :serial t
  :description "24 Game Slove"
  :author "mzgcz <j.wenjiao@gmail.com>"
  :license "LGPL v3"
  :depends-on (#:alexandria)
  :components ((:file "package")
               (:file "24_game_slove")))

