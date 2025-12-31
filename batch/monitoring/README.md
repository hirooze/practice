# monitoring

このディレクトリには簡易CPUモニタのバッチスクリプトがあります。

ファイル:
- `monitor_cpu.bat` - 指定間隔でCPU使用率をログに追記します。

使い方例:

1) カレントで実行（デフォルト: 5秒間隔、出力は同ディレクトリの `cpu_monitor.log`）

```cmd
monitor_cpu.bat
```

2) 間隔と出力ファイルを指定する例（5秒毎に `cpu_log.txt` に記録）

```cmd
monitor_cpu.bat 5 cpu_log.txt
```

注意:
- スクリプトは `wmic` を使用してCPU負荷(%)を取得します。Windowsの一部環境では `wmic` が非推奨または存在しない場合があります。その場合はPowerShell版のスクリプトを利用してください。

メモリ監視スクリプト:

1) デフォルトで実行（デフォルト: 5秒間隔、出力は同ディレクトリの `mem_monitor.log`）

```cmd
monitor_mem.bat
```

2) 間隔と出力ファイルを指定する例（10秒毎に `mem_log.txt` に記録）

```cmd
monitor_mem.bat 10 mem_log.txt
```

出力内容例: 日時 Used: 123456 KB (63%) Free: 456 MB / Total: 1234 MB

ドライブ容量監視スクリプト:

1) デフォルトで実行（デフォルト: 60秒間隔、出力は同ディレクトリの `disk_monitor.log`）

```cmd
monitor_disk.bat
```

2) 間隔と出力ファイルを指定する例（30秒毎に `disk_log.txt` に記録）

```cmd
monitor_disk.bat 30 disk_log.txt
```

出力内容例: 2025-12-26 12:34:56 C: Used:1234567890B (12.34%) Free: 45678.90MB Total: 123456.78MB

