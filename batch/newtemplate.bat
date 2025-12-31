@echo off
chcp 932 >nul
REM DEFINED VARIABLES
SET "SCRIPT_NAME=%~n0"
SET "YYYYMMDD=%DATE:~0,4%%DATE:~5,2%%DATE:~8,2%"
SET "HHMMSS=%TIME:~0,2%%TIME:~3,2%%TIME:~6,2%"

REM ログメッセージの設定（Windows の組み込みコマンド eventcreate を使用）
SET "LOG_SRT=%YYYYMMDD% %HHMMSS% %SCRIPT_NAME% 処理を開始します。" 
SET "LOG_END_NRM=%YYYYMMDD% %HHMMSS% %SCRIPT_NAME% 処理が正常終了しました。">nul 2>&1
SET "LOG_END_WRN=%YYYYMMDD% %HHMMSS% %SCRIPT_NAME% 処理が警告終了しました。" >nul 2>&1
SET "LOG_END_ERR=%YYYYMMDD% %HHMMSS% %SCRIPT_NAME% 処理が異常終了しました。" >nul 2>&1
goto set_command

:set_command
REM 実行コマンドの設定（必要に応じて書き換えてください）
SET "COMMAND=echo test"

:main
rem 実行開始: イベントログへ出力してコンソールにも表示
call %EVLOG_START%
echo [%DATE% %TIME%] 処理を開始します。
call %COMMAND%

if "%ERRORLEVEL%"=="0" goto end_normal
if "%ERRORLEVEL%"=="1" goto end_warning
goto end_error

 :end_normal
 call %EVLOG_END_NRM%
 Exit %ERRORLEVEL%

:end_warning
 call %EVLOG_END_WRN%
 Exit %ERRORLEVEL%

:end_error
 call %EVLOG_END_ERR% Exit %ERRORLEVEL%
 Exit %ERRORLEVEL%