pengambilan keputusan dari kondisi yang ada : menentukan alur program pada kondisi tertentu

IF
-memerlukan nilai bool (dari operator logical atau comparison)
-menjalankan bagian proses jika nilai bool bernilai true
-dituliskan dengan
if (nilai_bool){
	//proses jika nilai_bool adalah true
}

IF-ELSE 
-berjalan dengan if
-menambahkan alternatif jika nilai bool adalah false
-dituliskan dengan:
if (nilai_bool){
	//proses jika nilai_bool adalah true
} else {
	//proses jika nilai_bool adalah false
}

Sisipan ELSE-IF
-berjalan dengan if
-menambah alternatif jika nilai bool adalah false
-menambah pengujian nilai bool lain
-dituliskan dengan:
if (nilai_bool){
	//proses jika nilai_bool adalah true
} else if (nilai_bool1){
	//proses jika nilai_bool adalah false
	//dan nilai_bool1 adlaah true
}

perulangan : menjalankan proses berulang kali
FOR
-diketahui berapa kali perulangan terjadi
-memerlukan nilai awal
-memerlukan nilai bool, jika true maka perulangan dilanjutkan
-memerlukan pengubah nilai
-ditulis dengan:
for (nilai_awal; nilai_bool; pengubah nilai_Awal){
	//proses berulang jika nilai_bool adalah true)
}

WHILE
-tidak diketahui berapa kali perulangan terjadi
-memerlukan nilai bool, jika true maka perulangan dilanjutkan
-dituliskan dengan:
while (nilai_bool){
	//proses berulang jika nilai_bool adalah true
}

DO-WHILE
-mengubah bentuk while
-proses dijalankan minimum sekali, akan diteruskan jika nilai bool adalah true
-ditulis dengan: 
do {
	//proses berulang jika nilai_bool adalah true
} while (nilai_bool);



break dan continue: cara alin menghentikan perulangan
definisi:
-perulangan menggunakan nilai bool untuk lanjut atau berhenti
-break dan continue dapat menghentikan perulangan dengan mengabaikan nilai bool
-continue dapat menghentikan satu kali proses

perbedaan break vs continue:
break: menghentikan seluruh proses perulangan
continue: menghentikan satu kali proses perulangan lalu melanjutkan ke proses selanjutnya


fungsi 
-kumpulan perintah atau prosedur yang dapat digunakan ulang atau dipanggil berkali-kali
-membuat fungsi:
tipe_data nama_fungsi(){
	//perintah yang dijalankan saat fungsi dipanggil
}

fungsi dengan parameter : mengirim data saat menjalankan fungsi
tipe_data nama_fungsi(tipe_data nama_parameter){
	//perintah yang dijalankan saat fungsi dipanggil
}

fungsi dengan return : memeberi nilai pada fungsi saat dipanggil
tipe_data nama_fungsi (tipe_data nama_parameter){
	/perintah yang dijalankan saat fungsi dipanggil
	return nilai;
}
