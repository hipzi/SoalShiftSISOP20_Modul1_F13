# SOAL SHIFT 1

 - Soal 1 :
	 * soal1.sh
 - Soal 2
	 * soal2.sh
	 * soal2_enkripsi.sh
	 * soal2_dekripsi.sh
 - Soal 3
	 * soal3.sh
	 * soal3_duplicate.sh
	 
<justify>
1. Whits adalah seorang mahasiswa teknik informatika. Dia mendapatkan tugas praktikum
untuk membuat laporan berdasarkan data yang ada pada file “Sample-Superstore.tsv”.
Namun dia tidak dapat menyelesaikan tugas tersebut. Laporan yang diminta berupa :

a. Tentukan wilayah bagian (region) mana yang memiliki keuntungan (profit) paling sedikit

b. Tampilkan 2 negara bagian (state) yang memiliki keuntungan (profit) paling sedikit berdasarkan hasil poin a

c. Tampilkan 10 produk (product name) yang memiliki keuntungan (profit) paling sedikit berdasarkan 2 negara bagian (state) hasil poin b Whits memohon kepada kalian yang sudah jago mengolah data untuk mengerjakanlaporan tersebut.
</justify>

 

<justify>
2. Pada suatu siang, laptop Randolf dan Afairuzr dibajak oleh seseorang dan kehilangan data-data penting. Untuk mencegah kejadian yang sama terulang kembali mereka meminta bantuan kepada Whits karena dia adalah seorang yang punya banyak ide. Whits memikirkan sebuah ide namun dia meminta bantuan kalian kembali agar ide tersebut cepat diselesaikan. Idenya adalah kalian (a) membuat sebuah script bash yang
dapat menghasilkan password secara acak sebanyak 28 karakter yang terdapat huruf besar, huruf kecil, dan angka. (b) Password acak tersebut disimpan pada file berekstensi .txt dengan nama berdasarkan argumen yang diinputkan dan ​ HANYA ​ berupa alphabet​. (c) Kemudian supaya file .txt tersebut tidak mudah diketahui maka nama filenya akan di enkripsi dengan menggunakan konversi huruf (string manipulation) yang disesuaikan dengan jam(0-23) dibuatnya file tersebut dengan program terpisah dengan (misal: password.txt dibuat pada jam 01.28 maka namanya berubah menjadi qbttxpse.txt dengan perintah ‘​ bash soal2_enkripsi.sh password.txt’. Karena p adalah huruf ke 16 dan
file dibuat pada jam 1 maka 16+1=17 dan huruf ke 17 adalah q dan begitu pula seterusnya. Apabila melebihi ​ z ​ , akan kembali ke ​ a ​ , contoh: huruf ​ w dengan jam 5.28, maka akan menjadi huruf ​ b.​ ) dan (d) jangan lupa untuk membuat dekripsinya supaya nama file bisa kembali.
</justify>
<p></p>
<justify>
3. 1 tahun telah berlalu sejak pencampakan hati Kusuma. Akankah sang pujaan hati
kembali ke naungan Kusuma? Memang tiada maaf bagi Elen. Tapi apa daya hati yang
sudah hancur, Kusuma masih terguncang akan sikap Elen. Melihat kesedihan Kusuma,
kalian mencoba menghibur Kusuma dengan mengirimkan gambar kucing. [a] ​ Maka dari
itu, kalian mencoba membuat script untuk mendownload 28 gambar dari
"​ https://loremflickr.com/320/240/cat​ " menggunakan command ​ wget dan menyimpan file
dengan nama "pdkt_kusuma_NO" (contoh: pdkt_kusuma_1, pdkt_kusuma_2,
pdkt_kusuma_3) serta jangan lupa untuk menyimpan ​ log messages ​ wget kedalam
sebuah file "wget.log"​ . Karena kalian gak suka ribet, kalian membuat penjadwalan untukmenjalankan script download gambar tersebut. Namun, script download tersebut hanya
berjalan[b] ​ setiap 8 jam dimulai dari jam 6.05 setiap hari kecuali hari Sabtu ​ Karena
gambar yang didownload dari link tersebut bersifat random, maka ada kemungkinan
gambar yang terdownload itu identik. Supaya gambar yang identik tidak dikira Kusuma
sebagai spam, maka diperlukan sebuah script untuk memindahkan salah satu gambar
identik. Setelah memilah gambar yang identik, maka dihasilkan gambar yang berbeda
antara satu dengan yang lain. Gambar yang berbeda tersebut, akan kalian kirim ke
Kusuma supaya hatinya kembali ceria. Setelah semua gambar telah dikirim, kalian akan
selalu menghibur Kusuma, jadi gambar yang telah terkirim tadi akan kalian simpan
kedalam folder /kenangan dan kalian bisa mendownload gambar baru lagi. [c] ​ Maka dari
itu buatlah sebuah script untuk mengidentifikasi gambar yang identik dari keseluruhan
gambar yang terdownload tadi. Bila terindikasi sebagai gambar yang identik, maka
sisakan 1 gambar dan pindahkan sisa file identik tersebut ke dalam folder ./duplicate
dengan format filename "duplicate_nomor" (contoh : duplicate_200, duplicate_201).
Setelah itu lakukan pemindahan semua gambar yang tersisa kedalam folder ./kenangan
dengan format filename "kenangan_nomor" (contoh: kenangan_252, kenangan_253).
Setelah tidak ada gambar di ​ current directory ​ , maka lakukan backup seluruh log menjadi
ekstensi ".log.bak"​ .
</justify>
 

	 
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTE5ODYzNzIyMSwtMTMxODcyMjc1NiwtMT
UwNjIwMTY3MCwtMTIwOTczNzEyOCwtMTgyNzg0OTk0MiwxMDgw
OTI2NjcsMTE3ODkyMjQ5OF19
-->