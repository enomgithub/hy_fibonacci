#!/usr/bin/env hy
;; -*- coding: utf-8 -*-


(defn main []
  ((. unittest main) (get (. sys modules) "test_fibonacci_hy"))
  0)


(when (= --name-- "__main__")
      (import sys)
      (import unittest)
      (import test-fibonacci-hy)
      ((. sys exit) (main)))
