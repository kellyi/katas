#!/usr/bin/env clisp
;; http://rosettacode.org/wiki/Mutual_recursion

(defun f (n)
  (cond ((= 0 n) 1)
    (t (- n (m (f (- n 1)))))))

(defun m (n)
  (cond ((= 0 n) 0)
    (t (- n (f (m (- n 1)))))))
