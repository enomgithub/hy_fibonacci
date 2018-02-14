#!usr/bin/env hy
; -*- coding: utf-8 -*-


(defn fibonacci [n]
  "
  Calculate nth Fibonacci number

  Usage:
  (fibonacci n)
  :param n: int
  :return: int
  (where n >= 0)

  => (fibonacci 0)
  0
  => (fibonacci 1)
  1
  => (fibonacci 7)
  13
  "
  (assert (= (type n) int) "n: int is required.")
  (assert (>= n 0) "n >= 0 is required.")
  (cond [(= n 0) 0]
        [(= n 1) 1]
        [True (+ (fibonacci (- n 1))
                 (fibonacci (- n 2)))]))


(defn fibonacci-memo [n]
  "
  Calculate nth Fibonacci number using Memoization

  Usage:
  (fibonacci-memo n)
  :param n: int
  :return: int
  (where n >= 0)

  => (fibonacci-memo 0)
  0
  => (fibonacci-memo 1)
  1
  => (fibonacci-memo 7)
  13
  "
  (assert (= (type n) int) "n: int is required.")
  (assert (>= n 0) "n >= 0 is required.")
  (cond [(= n 0) 0]
        [(= n 1) 1]
        [True (+ (-fib-memo (- n 1) {})
                 (-fib-memo (- n 2) {}))]))


(defn -fib-memo [n dic]
  (cond [(= n 0) 0]
        [(= n 1) 1]
        [(in n dic) (get dic n)]
        [True (setv m (+ (-fib-memo (- n 1) dic)
                         (-fib-memo (- n 2) dic)))
              (setv (. dic [n]) m)
              m]))


(defn main []
  (setv n 20)
  (setv m 42)
  (print ((. "Normal     : Fibonacci number f(n) = {}: n = {}" format)
          (fibonacci n) n))
  (print ((. "Memoization: Fibonacci number f(n) = {}: n = {}" format)
          (fibonacci-memo m) m))
  0)


(when (= --name-- "__main__")
      (import sys)
      ((. sys exit) (main)))
