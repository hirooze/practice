# 備忘録#x　Windows用タスクスケジューラ操作
タスクスケジューラをコマンド操作し、管理する方法。
エクスポートとインポートを駆使し、タスクスケジューラの登録を簡略化を目的としたエントリです。
が、内容が難しすぎるため、没案濃厚

## 目次
掲載内容は以下の通りです。
- 
## schtasks
タスクスケジューラを表示するコマンド
### タスクスケジューラを表示する
```batchfile
$ schtasks 
```
### タスク特定のタスクをxmlフォーマットでエクスポートする
```batchfile
$ schtasks /query /tn \<path>\<taskname> /xml > %userprofile%\desktop\<taskname>.xml
```
### タスク特定のタスクをxmlフォーマットでインポートする
```batchfile
$ schtasks /create /tn \<path>\<taskname> /xml %userprofile%\desktop\<taskname>.xml
```

## Official Reference
- [schtasks/Microsoft Ignite](https://docs.microsoft.com/ja-jp/windows-server/administration/windows-commands/schtasks)
- [登録トリガーの例 (XML)/Microsoft Ignite](https://docs.microsoft.com/ja-jp/windows/win32/taskschd/registration-trigger-example--xml-)

