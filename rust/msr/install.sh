#!/bin/bash
# MSR 自動インストールスクリプト

echo "MSR をインストールします..."

# ホームディレクトリに .msr ディレクトリを作成
MSR_DIR="$HOME/.msr"
echo "インストールディレクトリ: $MSR_DIR"
mkdir -p "$MSR_DIR/bin"
mkdir -p "$MSR_DIR/etc"
mkdir -p "$MSR_DIR/lib"

# 設定スクリプトを実行
if [ -f "./configure" ]; then
    ./configure
else
    echo "configure スクリプトが見つかりません。"
    exit 1
fi

# ビルド
echo "ビルド中..."
if command -v cargo &> /dev/null; then
    cargo build --release
    if [ $? -ne 0 ]; then
        echo "ビルドに失敗しました。"
        exit 1
    fi
else
    echo "Cargo がインストールされていません。Rust をインストールしてください。"
    exit 1
fi

# バイナリをコピー
echo "バイナリをコピー中..."
cp target/release/msr "$MSR_DIR/bin/"
cp target/release/msr-add "$MSR_DIR/bin/"
cp target/release/msr-clear "$MSR_DIR/bin/"
cp target/release/msr-del "$MSR_DIR/bin/"
cp target/release/msr-export "$MSR_DIR/bin/"
cp target/release/msr-help "$MSR_DIR/bin/"
cp target/release/msr-import "$MSR_DIR/bin/"
cp target/release/msr-list "$MSR_DIR/bin/"
cp target/release/msr-main "$MSR_DIR/bin/"
cp target/release/msr-version "$MSR_DIR/bin/"

# 設定ファイルをコピー
echo "設定ファイルをコピー中..."
cp -r etc/* "$MSR_DIR/etc/"
cp -r lib/* "$MSR_DIR/lib/"

# PATH に追加
SHELL_RC=""
if [ -n "$ZSH_VERSION" ]; then
    SHELL_RC="$HOME/.zshrc"
elif [ -n "$BASH_VERSION" ]; then
    SHELL_RC="$HOME/.bashrc"
else
    SHELL_RC="$HOME/.profile"
fi

if [ -f "$SHELL_RC" ]; then
    if ! grep -q "export PATH=\"$MSR_DIR/bin:\$PATH\"" "$SHELL_RC"; then
        echo "export PATH=\"$MSR_DIR/bin:\$PATH\"" >> "$SHELL_RC"
        echo "PATH を $SHELL_RC に追加しました。新しいシェルで有効になります。"
    fi
fi

echo "MSR のインストールが完了しました。"
echo "使用法: msr <input> または msr <subcommand>"
echo "アンインストール: ./uninstall.sh"