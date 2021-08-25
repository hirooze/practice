@echo off
rem タイムスタンプ関連
echo ----------------
echo タイムスタンプ
echo ----------------

rem ----------------
rem ログ用の時間定義
rem ----------------

rem timeの空白文字を0に変換
set time2=%time: =0%

rem dt にタイムスタンプを定義する
set dt=%date:~0,4%%date:~5,2%%date:~8,2%%time2:~0,2%%time2:~3,2%

echo %dt%
pause
