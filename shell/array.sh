#!/bin/bash
# This is Syntax Program of array.

hoge=()
hoge=("1" "2" "3")

declare -a arr=("first" "secound" "third")
arrr[0]="un"
arrr[1]="due"
arrr[2]="trois"

#追加
hoge+=(${arrr[@]})
#削除
unset hoge[2]
i = "0"

echo "${hoge[@]}"
echo "${arr[@]}"
echo "${arrr[@]}"
