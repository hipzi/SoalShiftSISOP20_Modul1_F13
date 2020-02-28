#!/bin/bash

mapfile ori < <(awk -F '_' '{
	if (NR%2==1) 
	{ 
		print $2
	}		
}' location.log)

mapfile rename < <(awk -F '‘' '{
	if (NR%2==0) 
	{ 
		print $2
	}		
}' location.log | sed s/\’// )

for ((i=0; $i<${#ori[@]}; i++))
do
	hash[${ori[i]}]=${rename[i]}
done

name=kenangan

for i in "${!hash[@]}"
do
	name=kenangan
	let a++
	name=$name'_'$a
	mv ${hash[$i]} $name
	mv $name ~/Downloads/kenangan/
done

mapfile arr < <(find pdkt_kusuma* )

for ((i=0; i<${#arr[@]}; i++))
do
	duplicate=duplicate
	let d++
	duplicate=$duplicate'_'$d
	mv ${arr[$i]} $duplicate
	mv $duplicate ~/Downloads/duplicate/
done


