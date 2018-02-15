#!/usr/bin/env hy
;; -*- coding: utf-8 -*-
(import argparse)
(import re)
(import unittest)


(defn main []
  (setv parser ((. argparse ArgumentParser) :description "Run tests"))
  ((. parser add-argument) "test_module"
                           :type str
                           :help "Name of a test module (no extension)")
  (setv args ((. parser parse-args)))
  (if ((. re search) "\.hy|\.py$" (. args test-module))
      (print "Remove extension '.hy' or '.py', and retry.")
      (try
        (do (exec (+ "import " (. args test-module)))
            ((. unittest main) (exec (. args test-module))))
        (except [ModuleNotFoundError]
                (print "Module not found."))
        (except [SyntaxError]
                (print "Invalid module name."))))
  0)


(when (= --name-- "__main__")
      (import sys)
      ((. sys exit) (main)))
