# Rust プロジェクト

このプロジェクトはRustで作成されたサンプルアプリケーションです。clapライブラリを使用してコマンドライン引数を処理します。

## 必要な環境
- Rust (rustc, cargo がインストール済み)
- clap ライブラリ (Cargo.toml に依存関係として追加済み)

## ビルド方法
```bash
cargo build
```

## リリースビルド
```bash
cargo build --release
```

## 実行方法
```bash
cargo run
```

または、ビルド後に:
```bash
./target/debug/rust
```

## テスト
```bash
cargo test
```

## 依存関係
- clap: コマンドライン引数パーサー

## プロジェクト構造
- `src/main.rs`: メインのソースコード
- `Cargo.toml`: プロジェクト設定と依存関係
- `Cargo.lock`: 依存関係のロックファイル

## カスタマイズ
clapを使用してコマンドラインオプションを追加できます。`src/main.rs` を編集して機能を拡張してください。