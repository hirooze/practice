# Windows バッチコマンドリスト
### ディスククリーンアップ（自動化用）
```batchfile
Cleanmgr /sagerun
```
### 単一ファイルを対象としたcutコマンド
```batchfile
for /f "tokens=2" %i in ('type <任意のフォルダ>\<任意のファイル名>.txt') do @echo %i
```
「tokens=2」に区切りたい行数を指定する。  
### インストール済みKB情報をリスト形式でデスクトップにcsv出力し、デスクトップのエクスプローラを開く(csv版)
```batchfile
wmic qfe list /format:csv > %USERPROFILE%\Desktop\%COMPUTERNAME%_kblist_v%date:~0,4%%date:~5,2%%date:~8,2%.csv && explorer %USERPROFILE%\Desktop
```
### インストール済みKB情報をリスト形式でデスクトップにcsv出力し、デスクトップのエクスプローラを開く(html版)
```batchfile
wmic qfe list /format:hform > %USERPROFILE%\Desktop\%COMPUTERNAME%_kblist_v%date:~0,4%%date:~5,2%%date:~8,2%.html && explorer %USERPROFILE%\Desktop
```
### タスクリストを詳細表示でデスクトップにcsv出力し、デスクトップのエクスプローラを開く
```batchfile
tasklist /v /fo csv > %USERPROFILE%\Desktop\%COMPUTERNAME%_tasklists_v%date:~0,4%%date:~5,2%%date:~8,2%.csv && explorer %USERPROFILE%\Desktop
```
### SCPでリモート(LX)にコピー
```batchfile
scp D:\<任意のフォルダ>\<ファイル>.tar.gz <ログインユーザ>@<IPアドレス>:<ターゲットフォルダ>
```
7zipでアーカイブ圧縮  