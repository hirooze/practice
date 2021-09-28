dim fs
dim fn

set fs = wscript.createobject("scripting.filesystemobject")
set fn = fs.getfile(WScript.ScriptFullName)

wscript.echo "Create Date : " & fn.datecreated
wscript.echo "Update Date : " & fn.datelastmodified
