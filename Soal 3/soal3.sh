#!/bin/bash

name=pdkt_kusuma

if [[ -e $name ]] ; then
    i=1
    while [[ -e $name'_'$i ]] ; do
        let i++
    done
    name=$name'_'$i
	if [ $i -eq 27 ] ; then
	`crontab -r`
	fi
fi

wget -O $name -o - 'https://loremflickr.com/320/240/cat' >> wget.log

