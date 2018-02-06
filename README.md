# Git コマンドリスト

## コミットファイルの有無確認
```bash
$ git status
```

## ファイルをステージングする
```bash
$ git add -A
$ git add -u
$ git add <dir>/*
```

## ローカルリポジトリにコミットする
```bash
$ git commit -m 'message'
```
## ローカルリポジトリをリモートリポジトリへpushする
```bash
$ git push origin master
$ git push
```

## その他コマンド

## リモートリポジトリを登録する
```bash
$ git remote add <name> <url>
```

# 登録されているリモートリポジトリの詳細を確認する
```bash
$ git remote -v
```

# 登録されているリモートリポジトリを削除する
```bash
$ git remote rm <name>
```

# ブランチの一覧を表示する
```bash
$ git branch
```

# ブランチを作成する
```bash
$ git branch <branchname>
$ git branch devs
$ git checkout -b <branch> 
```

# ブランチを切り替える
```bash
$ git checkout <branchname>
$ git checkout devs
```
# ブランチを削除する
```bash
$ git branch -d <branchname> 
$ git branch -d devs
```