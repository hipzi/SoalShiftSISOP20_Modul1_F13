#!/bin/bash

for ((d=0; $d<28; d++))
do
name=pdkt_kusuma

if [[ -e $name'_1' ]] ; then
    i=2
    while [[ -e $name'_'$i ]] ; do
        let i++
    done
    name=$name'_'$i
else
	i=1
	name=$name'_'$i
fi

wget -O $name -o - 'https://loremflickr.com/320/240/cat' >> wget.log
grep 'Location\|Saving' wget.log >> location.log

done

