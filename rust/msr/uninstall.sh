#!/bin/bash
# MSR アンインストールスクリプト

MSR_DIR="$HOME/.msr"

echo "MSR をアンインストールします..."

# .msr ディレクトリが存在するか確認
if [ ! -d "$MSR_DIR" ]; then
    echo ".msr ディレクトリが見つかりません。既にアンインストールされている可能性があります。"
    exit 0
fi

# .msr ディレクトリを削除
rm -rf "$MSR_DIR"
echo ".msr ディレクトリを削除しました。"

# PATH から削除
SHELL_RC=""
if [ -n "$ZSH_VERSION" ]; then
    SHELL_RC="$HOME/.zshrc"
elif [ -n "$BASH_VERSION" ]; then
    SHELL_RC="$HOME/.bashrc"
else
    SHELL_RC="$HOME/.profile"
fi

if [ -f "$SHELL_RC" ]; then
    sed -i "/export PATH=\"$MSR_DIR\/bin:\$PATH\"/d" "$SHELL_RC"
    echo "PATH から MSR を削除しました。"
fi

echo "MSR のアンインストールが完了しました。"