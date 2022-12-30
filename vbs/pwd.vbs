option explicit
dim objshell,curdir
set objshell = createobject("wscript.shell")
curdir = objshell.currentdirectory
set objshell = nothing
wscript.echo curdir
