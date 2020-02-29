# MODUL 1

 - Soal 1 :
	 * <a href="#soal-1-a">soal 1 : a </a>
	 * <a href="#soal-1-b">soal 1 : b </a>
	 * <a href="#soal-1-c">soal 1 : c </a>
 - Soal 2
	 * <a href="#soal-2-a-b">soal 2 : a & b </a>
	 * <a href="#soal-2-enkripsi">soal 2 : enkripsi </a>
	 * <a href="#soal-2-dekripsi">soal 2 : dekripsi </a>
 - Soal 3
	 * <a href="#soal-3-download">soal 3 : download image </a>
	 * <a href="#soal-3-cronjob">soal 3 : cron job </a>
	 * <a href="#soal-duplicate">soal 3 : duplicate </a>

<a id="soal-1-a"> </a> 
## SOAL 1
<justify>
1. Whits adalah seorang mahasiswa teknik informatika. Dia mendapatkan tugas praktikum
untuk membuat laporan berdasarkan data yang ada pada file “Sample-Superstore.tsv”.
Namun dia tidak dapat menyelesaikan tugas tersebut. Laporan yang diminta berupa :
<p></p>
a. Tentukan wilayah bagian (region) mana yang memiliki keuntungan (profit) paling sedikit

    #!/bin/bash

	gawk -F "\t" '
		NR>1 {
		arr[$13]+=$21;	
	}

    END { PROCINFO["sorted_in"] = "@val_num_asc"
		for (i in arr) {	
		print "Region : "i
		}
	}' Sample-Superstore.tsv | head -1
<p></p>

Keterangan : </br>
<p></p> 
- <code> #!/bin/bash</code> untuk memberi tau bahwa ini script bash </br>
- <code> gawk</code> merupakan salah satu tipe awk </br>
- <code>-F "\t"</code> merupakan field separator (pemisah antar kolom), yang membaca tab sebagai field separatornya </br>
- <code>NR>1</code> (number of records), maka ia akan bernilai benar jika NR>1 atau dimulai dari baris 2 (NR>=2) </br>
- <code>arr[$13]+=$21;</code> array tersebut berfungsi untuk mengelompokkan jumlah profit (kolom $21) berdasarkan region (kolom $13) </br>
- <code>PROCINFO["sorted_in"] = "@val_num_asc"</code> bawaan dari gawk untuk ngengurutkan array sesuai value number secara ascending </br>
- <code>for (i in arr)</code> fungsi untuk looping array</br>
- <code> | </code> vertical bar, untuk memasukkan output menjadi input command setelahnya</br>
- <code> head -1</code> mengambil satu data teratas, nama region yang memiliki profit paling sedikit</br>

<a id="soal-1-b"> </a>
<p></p>
b. Tampilkan 2 negara bagian (state) yang memiliki keuntungan (profit) paling sedikit berdasarkan hasil poin a

	gawk -F "\t" '
		NR>1 {
		if($13 == "Central") {	
		    arr[$11]+=$21;
		}
	}

	END { PROCINFO["sorted_in"] = "@val_num_asc"
		for (i in arr) {
			print "State : "i
		}
	}' Sample-Superstore.tsv | head -2

Keterangan : </br>
<p></p> 
- <code>if($13 == "Central")</code> hasil dari poin a adalah Central yang berada di kolom $13, maka untuk menampilkan berdasarkan poin a, menggunakan if condition </br>
- <code>arr[$11]+=$21;</code> array tersebut berfungsi untuk mengelompokkan jumlah profit (kolom $21) berdasarkan state (kolom $11) </br>
- <code> head -2</code> mengambil dua data teratas, nama negara bagian yang memiliki profit paling sedikit</br>

<a id="soal-1-c"> </a>
<p></p>
c. Tampilkan 10 produk (product name) yang memiliki keuntungan (profit) paling sedikit berdasarkan 2 negara bagian (state) hasil poin b Whits memohon kepada kalian yang sudah jago mengolah data untuk mengerjakanlaporan tersebut.
</justify>
	
<p></p>

	gawk -F "\t" '
		NR>1 {	
		if($11 == "Texas" || $11 == "Illinois") {
			arr[$17]+=$21;
		}
	}
	
	END { PROCINFO["sorted_in"] = "@val_num_asc"
		for (i in arr) {
			print "Product Name : " i
		}
	}' Sample-Superstore.tsv | head -10

Keterangan : </br>
<p></p> 
- <code>if($11 == "Texas" || $11 == "Illinois")</code> hasil dari poin b adalah Texas dan Illionois yang berada di kolom $11, maka untuk menampilkan berdasarkan poin b, menggunakan if condition </br>
- <code>arr[$17]+=$21</code> array tersebut berfungsi untuk mengelompokkan jumlah profit (kolom $21) berdasarkan nama produk (kolom $17) </br>
- <code> head -10</code> mengambil sepuluh data teratas, nama produk yang memiliki profit paling sedikit</br>
 
<a id="soal-2-a-b"></a> 
## SOAL 2
<justify>
2. Pada suatu siang, laptop Randolf dan Afairuzr dibajak oleh seseorang dan kehilangan data-data penting. Untuk mencegah kejadian yang sama terulang kembali mereka meminta bantuan kepada Whits karena dia adalah seorang yang punya banyak ide. Whits memikirkan sebuah ide namun dia meminta bantuan kalian kembali agar ide tersebut cepat diselesaikan. Idenya adalah kalian 
<p></p>   
<p>(a) membuat sebuah script bash yang
dapat menghasilkan password secara acak sebanyak 28 karakter yang terdapat huruf besar, huruf kecil, dan angka. </p>
<p></p>
<p>(b) Password acak tersebut disimpan pada file berekstensi .txt dengan nama berdasarkan argumen yang diinputkan dan ​ HANYA ​ berupa alphabet​. </p>
<p></p>
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

Keterangan : </br>
<p></p> 
- <code> #!/bin/bash</code> untuk memberi tau bahwa ini script bash </br>
- <code>filename=$1</code> mengambil argumen pertama kemudian menaruhnya pada variabel yang bernama filename </br>
- <code>true=0</code> merupakan variabel yang awalnya di set 0 </br>
- <code>random_password()</code> fungsi untuk membuat random password </br>
- <code>head /dev/urandom</code> untuk membuat random password </br>
- <code>tr -dc 'A-Z'</code> translate karakter, parameter <code>-dc</code> untuk mendelete dan hanya membolehkan karakter yang ada di dalam tanda petik setelahnya yaitu hanya huruf kapital <code>'A-Z'</code> </br>
- <code>head -c 1 > $filename.txt</code> head dengan parameter <code>-c</code> yang berarti karakter dan diikuti dengan 1, maka ia mengambil satu karakter yang paling besar dan memasukkannya dalam file</br>
- <code> | </code> vertical bar, untuk memasukkan output menjadi input command setelahnya</br>
- <code> >> </code> karena sudah ada inputan ke file yang sama sebelumnya, maka menggunakan ini agar tidak menghapus hasil inputan sebelumnya</br>
- <code> "$filename" =~ [a-zA-Z] </code> untuk mengecek apakah nama file tersebut hanya berupa alfabet</br>
- <code> ! "$filename" =~ [0-9] </code> untuk mengecek apakah nama file tersebut tidak ada angka</br>
- <code> ! "$filename" =~ ['!'@#\$%^\&*()_+] </code> untuk mengecek apakah nama file tersebut tidak spesial karakter</br>
- <code> if [ $true -eq 1 ] </code> jika variabel true berisi satu, maka kondisi bernilai true. lalu menjalankan fungsi <code>random_password</code></br>
<p></p>
<a id="soal-2-enkripsi"></a>
(c) Kemudian supaya file .txt tersebut tidak mudah diketahui maka nama filenya akan di enkripsi dengan menggunakan konversi huruf (string manipulation) yang disesuaikan dengan jam(0-23) dibuatnya file tersebut dengan program terpisah dengan (misal: password.txt dibuat pada jam 01.28 maka namanya berubah menjadi qbttxpse.txt dengan perintah ‘​ bash soal2_enkripsi.sh password.txt’. Karena p adalah huruf ke 16 dan
file dibuat pada jam 1 maka 16+1=17 dan huruf ke 17 adalah q dan begitu pula seterusnya. Apabila melebihi ​ z ​ , akan kembali ke ​ a ​ , contoh: huruf ​ w dengan jam 5.28, maka akan menjadi huruf ​ b.​
<p></p>

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

Keterangan : </br>
<p></p> 
- <code>id=$(stat -c %w $filename | awk -F ":" '{print $1}' | tail -c 2)</code> untuk mengambil jam pada last modified file tersebut dan menyimpannya ke variabel id</br>
- <code> "$filename" =~ [a-zA-Z] </code> untuk mengecek apakah nama file tersebut hanya berupa alfabet</br>
- <code>stop=${#filename}</code> passing variabel filename <code>#</code> untuk menghitung jumlah karakter pada variabel filename serta menyimpannya dalam variabel stop</br>
- <code>encrypt=`expr $stop - 4`</code> mengurangi dengan 4 agar <code>.txt</code> tidak terhitung lalu menyimpannya dalam variabel encrypt</br>
- <code>${filename:0:$encrypt}</code> untuk memisahkan tiap karakter dan menjadikannya sebagai array</br>
- <code>newfilename=$(echo $noekstensi | tr "${kapital:0:26}${kecil:0:26}" "${kapital:${id}:26}${kecil:${id}:26}")</code> untuk membuat random password, shiftnya berdasarkan isi dari variabel id. kemudian menyimpannya dalam variabel yang bernama <code>newfilename</code> </br>
- <code>`mv $filename "$newfilename".txt`</code> rename nama file lama dengan nama file baru yang merupakan hasil enkripsi </br>
<p></p>
<a id="soal-2-dekripsi"></a>
<p>(d) jangan lupa untuk membuat dekripsinya supaya nama file bisa kembali.</p>
</justify>
<p></p>

    decrypt=`expr 26 - $id`

    if [[ "$filename" =~ [a-zA-Z] ]]
    then
	    newfilename=$(echo $noekstensi | tr "${kapital:0:26}${kecil:0:26}" "${kapital:${decrypt}:26}${kecil:${decrypt}:26}")
    fi

Keterangan : </br>
<p></p> 
- <code>decrypt=`expr 26 - $id`</code> karena menurut caesar chiper cara dekripsi merupakan kebalikan dari enkripsi, maka dapet menggunakan rumus tersebut</br>
- <code>newfilename=$(echo $noekstensi | tr "${kapital:0:26}${kecil:0:26}" "${kapital:${decrypt}:26}${kecil:${decrypt}:26}")</code> kalau dekripsi, shiftnya bukan berdasarkan id tapi isi dari variabel decrypt</br>
<p></p>
<a id="soal-3-download"></a>

## SOAL 3
<justify>
3. 1 tahun telah berlalu sejak pencampakan hati Kusuma. Akankah sang pujaan hati kembali ke naungan Kusuma? Memang tiada maaf bagi Elen. Tapi apa daya hati yang sudah hancur, Kusuma masih terguncang akan sikap Elen. Melihat kesedihan Kusuma, kalian mencoba menghibur Kusuma dengan mengirimkan gambar kucing. 
<p></p>
[a] ​Maka dari
itu, kalian mencoba membuat script untuk mendownload 28 gambar dari
"​ https://loremflickr.com/320/240/cat​ " menggunakan command ​ wget dan menyimpan file dengan nama "pdkt_kusuma_NO" (contoh: pdkt_kusuma_1, pdkt_kusuma_2, pdkt_kusuma_3) serta jangan lupa untuk menyimpan ​ log messages ​ wget kedalam sebuah file "wget.log"​ . Karena kalian gak suka ribet, kalian membuat penjadwalan untukmenjalankan script download gambar tersebut. Namun, script download tersebut hanya berjalan 
<p></p>
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

Keterangan : </br>
<p></p> 
- <code>for ((d=0; $d<28; d++))</code> untuk looping 28 kali</br>
- <code> if [[ -e $name'_1' ]] ; </code> jika ada parameter <code>-e</code> dalam if, untuk mengecek apakah ada file yang bernama <code>$name'_1'</code> jika tidak ada maka buat nama file menjadi <code>while [[ -e $name'_'$i ]]</code> jika kondisi if sebelumnya bernilai true, maka masuk ke kondisi ini. looping dengan menambah nilai i, dan memberi nama file sesuai dengan nilai i <code>name=$name'_'$i</code></br>
- <code>wget -O $name -o - 'https://loremflickr.com/320/240/cat' >> wget.log</code> untuk mendownload lewat url <code>'https://loremflickr.com/320/240/cat'</code> parameter <code>-O</code> untuk merename file hasil download dengan variabel <code>$name</code> sedangkan parameter <code>-o</code> untuk menyimpan hasil log ke dalam file <code>wget.log</code></br>
- <code>grep 'Location\|Saving' wget.log >> location.log</code> untuk mencari baris yang terdapat string <code>Location</code> dan <code>Saving</code> dari file <code>wget.log</code> dan menyimpannya ke dalam file <code>location.log</code></br>
<p></p>
<a id="soal-3-cronjob"></a>
[b] ​ setiap 8 jam dimulai dari jam 6.05 setiap hari kecuali hari Sabtu.
<p></p>

    5 6/8 * * 1-5,7 /bin/bash /home/hipzi/soal3.sh

Keterangan : </br>
<p></p> 
- <code>5</code> cron job dimulai pada menit ke 5</br>
- <code>6/8</code> cron job dimulai pada pukul 6 dan berulang setiap 8 jam sekali</br>
- <code>*</code> day (month) cron job berjalan setiap hari perbulan</br>
- <code>*</code> cron job berjalan setiap bulan</br>
- <code>1-5,7</code> day (week) cron job berjalan setiap hari kecuali hari sabtu</br>
- <code>/bin/bash</code> memberi tau kalau ini merupakan script bash</br>
- <code>/home/hipzi/soal3.sh</code> path/alamat direktori script yang akan dijalankan</br>
<p></p>
​Karena gambar yang didownload dari link tersebut bersifat random, maka ada kemungkinan gambar yang terdownload itu identik. Supaya gambar yang identik tidak dikira Kusuma sebagai spam, maka diperlukan sebuah script untuk memindahkan salah satu gambar identik. Setelah memilah gambar yang identik, maka dihasilkan gambar yang berbeda antara satu dengan yang lain. Gambar yang berbeda tersebut, akan kalian kirim ke
Kusuma supaya hatinya kembali ceria. Setelah semua gambar telah dikirim, kalian akan selalu menghibur Kusuma, jadi gambar yang telah terkirim tadi akan kalian simpan kedalam folder /kenangan dan kalian bisa mendownload gambar baru lagi. 
<p></p>
<a id="soal-duplicate"></a>
[c] ​ Maka dari itu buatlah sebuah script untuk mengidentifikasi gambar yang identik dari keseluruhan gambar yang terdownload tadi. Bila terindikasi sebagai gambar yang identik, maka sisakan 1 gambar dan pindahkan sisa file identik tersebut ke dalam folder ./duplicate
dengan format filename "duplicate_nomor" (contoh : duplicate_200, duplicate_201). Setelah itu lakukan pemindahan semua gambar yang tersisa kedalam folder ./kenangan dengan format filename "kenangan_nomor" (contoh: kenangan_252, kenangan_253). Setelah tidak ada gambar di ​ current directory ​ , maka lakukan backup seluruh log menjadi ekstensi ".log.bak"​ .
</justify>
<p></p>

	#!/bin/bash

	mapfile ori < <(awk -F '_' '{
		if (NR%2==1) {
			print $2
		}
	}' location.log)
<p></p>
Keterangan : </br>
<p></p> 
- <code>mapfile ori < <()</code> memasukkan hasil output code di dalam kurung ke array bernama <code>ori</code> </br>
- <code>awk -F '_'</code> untuk memisahkan antar kolom yang ditandai dengan <code>_</code> </br>
- <code>if (NR%2==1)</code> menggunakan modulo pada NR untuk mencari baris yang ganjil </br>
- <code>print $2</code> mengambil kolom ke dua</br>
<p></p>

	mapfile rename < <(awk -F '‘' '{
		if (NR%2==0) {
			print $2
		}
	}' location.log | sed s/\’// )
<p></p>
Keterangan : </br>
<p></p> 
- <code>mapfile rename < <()</code> memasukkan hasil output code di dalam kurung ke array bernama <code>rename</code> </br>
- <code>awk -F '‘'</code> untuk memisahkan antar kolom yang ditandai dengan <code>‘</code> </br>
- <code>if (NR%2==0)</code> menggunakan modulo pada NR untuk mencari baris yang genap </br>
- <code>print $2</code> mengambil kolom ke dua</br>
- <code>sed s/\’//</code> digunakan untuk menghapus karakter <code>’</code></br>
<p></p>

	for ((i=0; $i<${#ori[@]}; i++))
	do
		hash[${ori[i]}]=${rename[i]}
	done
<p></p>
Keterangan : </br>
<p></p> 
- <code>for ((i=0; $i<${#ori[@]}; i++))</code> melakukan looping sebanyak jumlah dari array <code>ori</code> </br>
- <code>hash[${ori[i]}]=${rename[i]}</code> membuat array bernama <code>hash</code> dengan index array <code>ori</code> yang berisikan array <code>rename</code> agar bisa mengetahui nama lama serta nama baru dari file tersebut</br>
<p></p>

	name=kenangan

	for i in "${!hash[@]}"
	do
		name=kenangan
		let a++
		name=$name'_'$a
		mv ${hash[$i]} $name
		mv $name ~/Downloads/kenangan/
	done

Keterangan : </br>
<p></p> 
- <code>for i in "${!hash[@]}"</code> looping berjalan selama masih ada array <code>hash</code> </br>
- <code>let a++</code> untuk menambahkan nilai a setiap iterasi </br>
- <code>name=$name'_'$a</code> mengganti isi dari variabel name dengan menambah karakter <code>_</code> serta isi dari variabel <code>$a</code> </br>
- <code>mv ${hash[$i]} $name </code> rename <code>${hash[$i]}</code> menjadi nama yang disimpan pada variabel <code>$name</code></br>
- <code>mv $name ~/Downloads/kenangan/</code> digunakan untuk memindahkan file ke directory <code>~/Downloads/kenangan/</code></br>
<p></p>

	mapfile arr < <(find pdkt_kusuma* )
<p></p>
Keterangan : </br>
<p></p> 
- <code>mapfile rename < <()</code> memasukkan hasil output code di dalam kurung ke array bernama <code>arr</code> </br>
- <code>find pdkt_kusuma*</code> mencari file dengan nama depan pdkt_kusuma</br>
<p></p>

	for ((i=0; i<${#arr[@]}; i++))
	do
		duplicate=duplicate
		let d++
		duplicate=$duplicate'_'$d
		mv ${arr[$i]} $duplicate
		mv $duplicate ~/Downloads/duplicate/
	done

Keterangan : </br>
<p></p> 
- <code>for ((i=0; i<${#arr[@]}; i++))</code> melakukan looping sebanyak jumlah dari array <code>arr</code> </br>
- <code>let d++</code> untuk menambahkan nilai <code>d</code> setiap iterasi </br>
- <code>duplicate=$duplicate'_'$d</code> mengganti isi dari variabel duplicate dengan menambah karakter <code>_</code> serta isi dari variabel <code>$d</code> </br>
- <code>mv ${arr[$i]} $duplicate </code> rename <code>${arr[$i]}</code> menjadi nama yang disimpan pada variabel <code>$duplicate</code></br>
- <code>mv $duplicate ~/Downloads/duplicate/</code> digunakan untuk memindahkan file ke directory <code> ~/Downloads/duplicate/</code></br>
<p></p>
