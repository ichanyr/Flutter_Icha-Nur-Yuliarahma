Form
-Menerima isian data dari satu pengguna
-Isian data dapat lebih dari satu

Membuat Form
-Menggunakan StatefulWidget
-Keadaan form disimpan menggunakan GlobalKey<FormState>

Input:

TextField
-Menerima isian data dari pengguna
-Isian data dapat lebih dari satu

Membuat TextField
-Data diambil menggunakan TextEditing Controller
-Isian data berupa teks

RadioButton
-Memberi opsi pada pengguna
-Hanya dapat memilih satu opsi
-Data diambil menggunakan field dengan tipe data sesuai value pada radio

CheckBox
-Memberi opsi pada pengguna 
-Dapat memilih beberapa opsi
-Data diambil menggunakan field bertipe bool

DropdownButton
-Memberi opsi pada pengguna 
-Hanya dapat memilih satu opsi
-Opsi tidak ditampilkan diawal, hanya tampil jika ditekan
-Data diambil menggunakan field dengan tipe data sesuai value pada DropdownMenuItem

Button
-Bersifat seperti tombol
-Dapat melakukan sesuatu saat ditekan

ElevatedButton
-Tombol yang timbul
-Jika ditekan, akan menjalankan onPressed

IconButton
-Tombol yang hanya menampilkan icon
-Jika ditekan, akan menjalankan onPressed