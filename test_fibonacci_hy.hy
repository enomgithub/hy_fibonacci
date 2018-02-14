#!/usr/bin/env hy
;; -*- coding: utf-8 -*-
(import unittest)

(import [fibonacci [fibonacci fibonacci-memo]])


(defclass TestFibonacci [(. unittest TestCase)]
  (defn test--n-0 [self]
    (setv actual (fibonacci 0))
    ((. self assertEqual) actual 0))

  (defn test--n-1 [self]
    (setv actual (fibonacci 1))
    ((. self assertEqual) actual 1))

  (defn test--n-gte-2 [self]
    (setv actual (fibonacci 7))
    ((. self assertEqual) actual 13))

  (defn test--n-lt-0 [self]
    ((. self assertRaises) AssertionError fibonacci -1))

  (defn test--n-not-int [self]
    ((. self assertRaises) AssertionError fibonacci 1.0)
    ((. self assertRaises) AssertionError fibonacci -1.2)
    ((. self assertRaises) AssertionError fibonacci "Hello World")))


(defclass TestFibonacciMemo [(. unittest TestCase)]
  (defn test--n-0 [self]
    (setv actual (fibonacci-memo 0))
    ((. self assertEqual) actual 0))

  (defn test--n-1 [self]
    (setv actual (fibonacci-memo 1))
    ((. self assertEqual) actual 1))

  (defn test--n-gte-2 [self]
    (setv actual (fibonacci-memo 7))
    ((. self assertEqual) actual 13))

  (defn test--n-lt-0 [self]
    ((. self assertRaises) AssertionError fibonacci-memo -1))

  (defn test--n-not-int [self]
    ((. self assertRaises) AssertionError fibonacci-memo 1.0)
    ((. self assertRaises) AssertionError fibonacci-memo -1.2)
    ((. self assertRaises) AssertionError fibonacci-memo "Hello World")))
