#!/bin/bash

id=$(date '+%H')

read filename

stop=${#filename}
true=0

random_password() {
	head /dev/urandom | tr -dc A-Za-z0-9 | head -c 28 > $filename.txt
	echo -e "\n"$id >> $filename.txt
}

for ((i=0; i<$stop; i++)) do

	if [[ "$filename" =~ [a-zA-Z] && ! "$filename" =~ [0-9] && 
		! "$filename" =~ ['!'@#\$%^\&*()_+] ]] 
	then
		true=1
	fi
	
done 

	if [ $true -eq 1 ]
	then
		random_password
		echo "Selamat! File baru telah dibuat"
	else
		echo "Maaf! Nama File hanya boleh menggunakan Alphabet"
	fi



