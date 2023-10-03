REST API (Represemtational State Transfer Application Programming Interface)
-Arsitektur yang memisahkan tampilan dengan proses bisnis.
-Bagian tampilan dengan proses bisnis berkirim data melalui HTTP Request
-Cara Kerja:
	1.platform digunakan si client(user) melakukan berbagai tindakan(menampilkan data user, mengedit, menghapus, dll), kemudian melakukan jenis request, misal:get(meminta/menampilkan info dr server),
	  post (mengirim/menambahkan data dr client ke server), put (memperbaharui data dari client ke server), delete(menghapus data).

	2. terdapat lapisna rest api (menerima req dr client berupa method apa yg digunakan), method diarahkan ke server(terdapat bisnis logic)

	3. server memberikan response ke rest api dalam format json




HTTP
-Protokol yang digunakan untuk berkirim data pada internet, biasanya data tersebut berbentuk media web.
-Struktur Request
	1. URL(endpoint) : alamat halaman yang akan diakses
	2. Method (GET, POST, PUT, DELETE) : Menunjukkan aksi yang diinginkan
	3. Header : Informasi tambahan terkait request yang dikirimkan
	4. Body : Data yang disertakan bersama request
-Struktur Response
	1. Status Code : Kode yang mewakili keseluruhan response, baik sukses mauoun gagal.
	2. Header : Informasi tambahan terkait response yang diberikan.
	3. Body : Data yang disertakan bersama response.

Dio
-Dimanfaatkan untuk melakukan REST API
-Sebagai HTTP Client

Serialisasi JSON
-Umum digunakan pada REST API
-Javascript Object Notation
-Cara penulisan data

Deserialisasi JSON
-Mengubah bentuk JSON ke struktur data