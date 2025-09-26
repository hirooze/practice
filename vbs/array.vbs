dim arr
arr = array(1,2,3)
for each b in arr
	wscript.echo b
next

for i = 0 to ubound(arr)
	wscript.echo arr(i)
next

wscript.echo ubound(arr)
wscript.echo ubound(arr)