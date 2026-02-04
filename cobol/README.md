# COBOL テストコード

このディレクトリには、COBOL言語のテストコードが含まれています。

## ファイル

- `hello.cbl`: シンプルな "Hello, World!" を表示するCOBOLプログラム。

## 実行方法

UCRT64環境（MSYS2のUCRT64）で以下のコマンドを実行してください。

1. コンパイル:
   ```
   cobc -x hello.cbl -o hello
   ```

2. 実行:
   ```
   ./hello
   ```

## 環境設定

COBOLコンパイラとしてGnuCOBOLを使用しています。UCRT64環境で利用可能です。

環境変数 `COB_CONFIG_DIR` を設定する場合:
```
export COB_CONFIG_DIR=/ucrt64/share/gnucobol/config
```

## テスト結果

実行テストを行い、"Hello, World!" が正常に出力されました。