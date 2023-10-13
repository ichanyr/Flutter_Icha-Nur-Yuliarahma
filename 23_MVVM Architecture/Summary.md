MVVM (Model-View ViewModel)
-Memisahkan logic dengan tampilan (View) ke dalam ViewModel

Keuntungan
-Reusability
JIka ada beberapa tampilan yang memerlukan alur logic yang sama, mereka bisa menggunakan ViewModel yang sama.
-Maintainability
Mudah dirawat karena pekerjaan terkait tampilan tidak tertumpuk bersama logic.
-Testability
Pengujian menjadi terpisah antara pengujian tampilan dengan pengujian logic sehingga dapat meningkatkan produktivitas pada pengujian.

Aturan
-Struktur Direktori
	1. Model memiliki 2 bagian, yaitu bentuk data yang akan digunakan dan sumber dari data tersebut.
	2. Tiap screen diletakkan dalam sebuah direktori yang di dalamnya terdapat View dan ViewModel.
-Model
	1. Bentuk data yang akan digunakan, dibuat dalam bentuk class.
	2. Data-data yang dimuat, diletakkan pada property.
-ViewModel
	1. Menyimpan data-data dan logic yang diperlukan halaman ContactScreen.
	2. Jika widget lain memerlukan logic yang sama, dapat menggunakan ViewModel ini juga.
-Mendaftarkan ViewModel
	1. Menggunakan MultiProvider agar dapat menggunakan banyak ViewModel.
	2. MaterialApp sebagai child utama.
-View : menggunakan statefulWidget
-Menampilkan Data di View
	1. Letakkan pada bagian build.
	2. Menggunakan getters yang ada pada ViewModel.
	3. Data dapat langsung ditampilkan pada widgets.



