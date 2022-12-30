# 備忘録#x　MsXMLバージョン情報検索
インターネット上に情報が少ないため、本件メモ書き

## 目次
掲載内容は以下の通りです。
1. REG Query

## 大項目
REG Query にて、レジストリからバージョン情報を取得する

### 中項目
それらしい値を検索する。<br>

(有力)<br>
```bash
$ REG QUERY HKLM\SOFTWARE\Classes\CLSID\ /f Msxml2.XMLHTTP. /s
```

```bash
$ REG QUERY HKLM\SOFTWARE\Classes\ /f Msxml2.XMLHTTP
```


## 参考にしたページ
- [Markdown記法 サンプル集](https://qiita.com/tbpgr/items/989c6badefff69377da7)

## Official Reference
- [reg query/Microsoft Docs](https://docs.microsoft.com/ja-jp/windows-server/administration/windows-commands/reg-query)
- [CLSID キー/Microsoft Docs](https://docs.microsoft.com/ja-jp/windows/win32/com/clsid-key-hklm)
