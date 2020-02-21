#!/bin/bash

filename=$1

id=$(awk 'NR==2 {print $1}' $filename)
decrypt=`expr 26 - $id`

stop=${#filename}
encrypt=`expr $stop - 4`

kapital=ABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZ
kecil=abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz

noekstensi=${filename:0:$encrypt}
echo $noekstensi

if [[ "$filename" =~ [a-z] ]]
then
	newfilename=$(echo $noekstensi | tr "${kecil:0:26}" "${kecil:${decrypt}:26}")
else
	newfilename=$(echo $noekstensi | tr "${kapital:0:26}" "${kapital:${decrypt}:26}")
fi

echo $newfilename

`mv $filename "$newfilename".txt`
