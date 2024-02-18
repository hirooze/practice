# バッチコマンドリスト
### ディスククリーンアップ（自動化用）
```bash
Cleanmgr /sagerun
```
### 単一ファイルを対象としたcutコマンド
```bash
for /f "tokens=2" %i in ('type <任意のフォルダ>\<任意のファイル名>.txt') do @echo %i
```
### SCPコピー
```bash
scp D:\<任意のフォルダ>\<ISOファイル>.iso.tar.gz <ログインユーザ>@<IPアドレス>:<ターゲットフォルダ>
```

