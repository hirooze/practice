# Git コマンドリスト
## コミットファイルの有無確認
```bash
$ git status
```
## ファイルをステージングする
```bash
$ git add -A
```
## ローカルリポジトリにコミットする
```bash
$ git commit -m 'message'

$ git commit -S -m 'message'
```
※-Sで暗号化付与

# 直近のコミットをまとめる(例は直近からから3つ)
```bash
$ git rebase -i HEAD~3
```
viの編集画面が表示される。下記の内容を編集し、wqで保存する。
[pick]の値を下記に変更する。
s 	(Squash)：複数のコミットを一つにまとめますが、まとめ先のコミットメッセージを編集が可能。（コミットメッセージの編集が可能）
f	(fixup) ：選択したコミットが前のコミットと結合され、そのコミットメッセージが無視される。（コミットメッセージの編集が不可）


## ブランチを切り替える
```bash
$ git checkout <branchname>
$ git checkout dev
$ git checkout prep
```
## ブランチをマージする
```bash
$ git merge <branchname> 
$ git merge dev
```
## ローカルリポジトリをリモートリポジトリへpushする
```bash
$ git push
```
# その他コマンド
## 登録されているリモートリポジトリの詳細を確認する
```bash
$ git remote -v
```
## ブランチの一覧を表示する
```bash
$ git branch
```
## リモートリポジトリを登録する
```bash
$ git remote add <name> <url>
```
## 登録されているリモートリポジトリを削除する
```bash
$ git remote rm <name>
```
## ブランチを作成する
```bash
$ git branch <branchname>
$ git branch dev
$ git checkout -b <branch> 
```
## ブランチを削除する
```bash
$ git branch -d <branchname> 
$ git branch -d dev
```
