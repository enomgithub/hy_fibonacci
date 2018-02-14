# 概要

Hy で書かれたモジュールをテストする例。

fibonacci.hy 内の、フィボナッチ数を求める関数

- 一般的な再帰を用いた実装 fibonacci
- メモ化を用いた実装 fibonacci_memo

をテストする。

Hy で書かれたテストモジュール (test_fibonacci_hy.hy) から unittest.main() は実行できないので、
テストモジュールを呼び出してテストを実行するモジュールが別に必要 (このリポジトリでは runtests.hy)。

テストモジュールを Python で書き、Hy で書かれたモジュールをテストすることも可能 (test_fibonacci.py)。
