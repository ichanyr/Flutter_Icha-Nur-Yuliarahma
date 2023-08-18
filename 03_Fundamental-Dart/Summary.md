Bahasa Pemrograman Dart

Apa dan mengapa dart?
Dart adalah bhs pemrograman yang dirancang untuk membuat aplikasi agar dapat berjalan dengan cepat.
Aplikasi yang dibuat dengan dart adalah aplikasi yang berjalan disisi client (frontend), seperti:
-web(javascript)
-desktop(dart)
-mobile(dart)

Kenapa harus dart?
Karena dart memiliki fitur:
-type safe -> menjamin konsistensi tipe data
-null safety -> memberi keamanan dari data bernilai hampa (null)
-rich standart library -> hadir dengan banyak dukungan library internal
-multiplatform -> mampu berjalan pada berbagai jenis perankat

fungsi main
-bagian yg dijalankan pertama kali
-dapat memiliki tipe data void atau int 
tipe data void artinya tidak mengembalikan apa apa
-memiliki nama main
perintah print digunakan untuk menampilkan data ke layar

komentar -> baris kode yang tidak dijalankan dengan tujuan:
memberi catatan pada kode, dan mencegah perintah dijalankan 

variable
-digunakan untuk menyimpan data
-memiliki nama
-memiliki tipe data

konstanta
-digunakan untuk menyimpan data 
-memiliki nama
-memiliki tipe data
-nilai tetap (tidak dapat diubah)
void main(){
	final usia = 18;
}

tipe data
jenis data yang dapat dikelola
tipe data sederhana disebut primitive data type : int, double, bool, string


operator
-digunakan untuk operasi pengolahan data
-data yang dikelola disebut operand
assigment:penugasan -> = , =+ , -= , /= , %=
comparison:perbandingan -> == , < , <= , > , >=
logical:menggabungkan beberapa kondisi -> && , || , !
