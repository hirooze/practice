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
```
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
