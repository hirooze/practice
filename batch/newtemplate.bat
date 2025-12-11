@echo off
chcp 932 >nul
REM DEFINED VARIABLES
SET "SCRIPT_NAME=%~n0"

REM ログメッセージの設定（Windows の組み込みコマンド eventcreate を使用）
SET "EVLOG_START=eventcreate /L APPLICATION /T INFORMATION /ID 100 /SO \"%SCRIPT_NAME%\" /D \"処理を開始します。\" >nul 2>&1"
SET "EVLOG_END_NORMAL=eventcreate /L APPLICATION /T INFORMATION /ID 101 /SO \"%SCRIPT_NAME%\" /D \"処理が正常終了しました。\" >nul 2>&1"
SET "EVLOG_END_WARNING=eventcreate /L APPLICATION /T WARNING /ID 102 /SO \"%SCRIPT_NAME%\" /D \"処理が警告終了しました。\" >nul 2>&1"
SET "EVLOG_END_ERROR=eventcreate /L APPLICATION /T ERROR /ID 103 /SO \"%SCRIPT_NAME%\" /D \"処理が異常終了しました。\" >nul 2>&1"

REM 実行コマンドの設定（必要に応じて書き換えてください）
SET "COMMAND=ping 8.8.8.8 -n 3"
goto :main

:main
rem 実行開始: イベントログへ出力してコンソールにも表示
call %EVLOG_START%
echo [%DATE% %TIME%] 処理を開始します。

%COMMAND%

if "%ERRORLEVEL%"=="0" goto end_normal
if "%ERRORLEVEL%"=="1" goto end_warning
goto end_error

 :end_normal
 call %EVLOG_END_NORMAL%
 echo [%DATE% %TIME%] 処理が正常終了しました。 Exit %ERRORLEVEL%
 Exit %ERRORLEVEL%

:end_warning
 call %EVLOG_END_WARNING%
 echo [%DATE% %TIME%] 処理が警告終了しました。 Exit %ERRORLEVEL%
 Exit %ERRORLEVEL%

:end_error
 call %EVLOG_END_ERROR%
 echo [%DATE% %TIME%] 処理が異常終了しました。 Exit %ERRORLEVEL%
 Exit %ERRORLEVEL%