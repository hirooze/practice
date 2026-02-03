# MSR (MultiStringReplace)

MSR は、設定されたパターンに基づいて文字列やファイルの内容を置換するツールです。

## インストール

### 自動インストール

```bash
./install.sh
```

このスクリプトは、`$HOME/.msr` ディレクトリに MSR をインストールし、PATH を設定します。

### アンインストール

```bash
./uninstall.sh
```

### 手動インストール

1. 設定スクリプトを実行:
   ```bash
   ./configure
   ```

2. ビルド:
   ```bash
   make build
   # または
   cargo build --release
   ```

3. 手動でファイルを配置:
   ```bash
   mkdir -p ~/.msr/bin ~/.msr/etc ~/.msr/lib
   cp target/release/msr* ~/.msr/bin/
   cp -r etc/* ~/.msr/etc/
   cp -r lib/* ~/.msr/lib/
   export PATH="$HOME/.msr/bin:$PATH"
   ```

## 使用法

### 基本的な置換

```bash
msr "置換する文字列"
```

またはファイルの内容を置換:

```bash
msr /path/to/file
```

### サブコマンド

- `add <before> <after>`: パターンを追加
- `del <before>`: パターンを削除
- `clear`: すべてのパターンをクリア
- `list`: パターンをリスト
- `export [file]`: パターンをエクスポート (デフォルト: patterns.txt)
- `import <file>`: パターンをインポート
- `help`: ヘルプを表示
- `version`: バージョンを表示

### 例

```bash
# パターンを追加
msr add "old" "new"

# 置換
msr "old text"

# パターンをリスト
msr list
```

## 設定ファイル

- `etc/patterns.conf`: パターンファイル
- `lib/help.md`: ヘルプファイル
- `lib/version.md`: バージョン情報

## 開発

### ビルド

```bash
make all
```

### テスト

```bash
make test
```

### クリーン

```bash
make clean
```