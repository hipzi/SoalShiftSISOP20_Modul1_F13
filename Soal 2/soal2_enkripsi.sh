#!/bin/bash

filename=$1
id=$(stat -c %w $filename | awk -F ":" '{print $1}' | tail -c 2)

stop=${#filename}
encrypt=`expr $stop - 4`

kapital=ABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZ
kecil=abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz

noekstensi=${filename:0:$encrypt}
echo $noekstensi

if [[ "$filename" =~ [a-zA-Z] ]]
then
	newfilename=$(echo $noekstensi | tr "${kapital:0:26}${kecil:0:26}" "${kapital:${id}:26}${kecil:${id}:26}")
fi

echo $newfilename

`mv $filename "$newfilename".txt`
