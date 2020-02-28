#!/bin/bash

filename=$1

true=0

random_password() {
	head /dev/urandom | tr -dc 'A-Z' | head -c 1 > $filename.txt
	head /dev/urandom | tr -dc 'a-z' | head -c 1 >> $filename.txt
	head /dev/urandom | tr -dc '0-9' | head -c 1 >> $filename.txt
	head /dev/urandom | tr -dc 'a-zA-Z0-9' | head -c 25 >> $filename.txt
}

if [[ "$filename" =~ [a-zA-Z] && ! "$filename" =~ [0-9] && 
	! "$filename" =~ ['!'@#\$%^\&*()_+] ]] 
then
	true=1
fi
 

if [ $true -eq 1 ]
then
	random_password
	echo "Selamat! File baru telah dibuat"
else
	echo "Maaf! Nama File hanya boleh menggunakan Alphabet"
fi



