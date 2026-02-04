# tmux 基本操作ガイド

このドキュメントは tmux の基本的な使い方を日本語で短くまとめています。tmux は端末マルチプレクサで、複数のセッション・ウィンドウ・ペインを管理できます。デフォルトのプレフィックス（接頭キー）は Ctrl-b （以降 `C-b` と表記）。

## インストール
- Debian/Ubuntu: sudo apt install tmux
- Fedora: sudo dnf install tmux
- macOS (Homebrew): brew install tmux

## セッション操作
- 新しいセッションを作成して開始: tmux new -s セッション名
- セッション一覧: tmux ls
- セッションにアタッチ: tmux attach -t セッション名
- セッションをデタッチ（tmux 内）: C-b d
- セッションを終了: exit（全ウィンドウを閉じる） または tmux kill-session -t セッション名

## ウィンドウ操作
- 新しいウィンドウを作成: C-b c
- ウィンドウ間を移動: C-b n（次）, C-b p（前）
- 指定ウィンドウに移動: C-b 数字（0〜9）
- ウィンドウ名を変更: C-b ,
- ウィンドウを閉じる: exit（そのウィンドウ内のシェルを終了）

## ペイン操作（分割）
- 水平方向に分割（上下）: C-b "
- 垂直方向に分割（左右）: C-b %
- ペイン間を移動: C-b o（順送り）または C-b 矢印キー
- ペインサイズ変更（例）: C-b : resize-pane -L 5（左へ5）
- ペインを入れ替え: C-b { または C-b }

## コピー／ペースト（コピー・モード）
- コピー・モードへ入る: C-b [
- 移動: 矢印、PageUp / PageDown、もしくは vi キーバインド
- 範囲選択開始: Space（あるいは vi では v）
- 範囲選択確定（コピー）: Enter
- ペースト: C-b ]

（tmux のバージョンや設定で挙動が異なる場合があります。`set -g mouse on` を有効にするとマウスでの選択も可能です）

## よく使うコマンド（まとめ）
- tmux new -s name         — 新規セッション作成
- tmux ls                  — セッション一覧
- tmux attach -t name      — セッションに接続
- C-b d                    — デタッチ
- C-b c / C-b n / C-b p    — ウィンドウの作成・移動
- C-b % / C-b "            — ペイン分割
- C-b [ / C-b ]            — コピー・モード入/ペースト

## シンプルな .tmux.conf の例
```
# プレフィックスを Ctrl-a に変更（好みで）
# set -g prefix C-a
# unbind C-b
# bind C-a send-prefix

# マウスでの選択・ウィンドウ切替を有効にする
set -g mouse on

# 履歴を多めに
set -g history-limit 10000

# コンフィグの再読み込みを簡単に
bind r source-file ~/.tmux.conf \; display-message "tmux config reloaded"
```

## 補足
- より高度な操作（プラグイン管理、複雑なキーバインド、スクリプト制御など）は .tmux.conf を編集してカスタマイズします。
- 公式ドキュメントやチュートリアル、tmux-cheatsheet を参照すると便利です。

以上。必要ならこの README を拡張して、キーバインド表やよく使う設定例を追加します。