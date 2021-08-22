#!/bin/sh
# This is Syntax Program of if.

hoge=1
ura="oct"
urara="test"

echo $(($hoge !=1))     #ture = 1 ,false = 0
echo $(($urara =test))  #ture = 1 ,false = 0

((hoge++)) #add value 1
echo $hoge

if [[ $ura = "oct" ]]; then
 echo "Match! ${ura}"
 else
 echo "NoMatchies ${ura}"
fi
