option explicit
dim objshell,curdir,ScriptName,FullScriptName
ScriptName     = WScript.ScriptName
FullScriptName = WScript.ScriptFullName
WScript.Echo "ScriptName     : " & ScriptName
WScript.Echo "FullScriptName : " & FullScriptName
set objshell = createobject("wscript.shell")
curdir = objshell.currentdirectory
set objshell = nothing
wscript.echo curdir
