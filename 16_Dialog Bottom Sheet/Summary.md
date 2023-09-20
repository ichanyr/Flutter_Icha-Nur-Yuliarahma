Aplikasi Task Management
-untuk menambahkan dan menghapus kegiatan
TODO1: Membuat model untuk informasi yang mau disimpan, membuat folder models dan di dalamnya buat file task_model.dart
TODO2: Membuat Task Screen, buat folder screens di dalamnya buat file task_screen.dart
TODO3: Membuat Empty Screen di folder screens
TODO4: Menambahkan package provider di pubspec.yaml
TODO5: Membuat Task Manager, buat file task_manager.dart di dalam folder models. Tambahkan method deleteTask dan addTask
6 : Menambahkan TaskManager sebagai provider di file main.dart
7 : Membuat fungsi buildTaskScreen, akan mereturn antara Task Screen yang ada datanya atau yang kosong dan panggil fungsi di body
8 : Membuat Task Item Screen di dalam folder screens dan tambahkan property onCreate
9 : Membuat FloatingActionButton pada file task_screen.dart untuk navigasi ke TaskItemScreen.
10 : menambahkan state property, initState, dan dispose pada file task_item_screen.dart
11 : Membuat buildNameField dan panggil fungsinya di dalam ListView pada file task_item_screen.dart
12 : membuat buildButton dan panggil fungsinya di dalam ListView pada file task_item_screen.dart
13 : membuat Task Item Card pada folder baru components
14 : menambahkan callback handler di ELevatedButton pada buildBUtton pada file task_item_screen.dart, dan menambahkan package uuid
15 : membuat task list screen pada folder screens, dan tambahkan di buildTaskScreen
16 : menambahkan property yang dibutuhkan pada TaskItemCard untuk melihat task yang sudah dibuat.

Alert Dialog
-untuk tampilan android, dari material design
-menginformasikan pengguna tentang situasi tertentu
-bisa digunakan untuk mendapatkan input dari user
-membutuhkan helper method showDialog
-AlertDialog menyediakan property seperti content dan actions
-content bisa dimasukkan widget text, gambar dan animasi gambar
-Actions bisa ditambahkan button untuk menerima respon dari user

Cara membuat alert dialog:
-17 : menambahkan Alert Dialog pada file task_item_card.dart
memanggil fungsi showDialog di dalam fungsi onPressed pada IconButton
show Dialog membutuhkan context dan builder
di buildernya akan mereturn AlertDialog
-18 : membuat properti onPressed pada di fila task_item_card.dart
-19 : menambahkan fungsi onPressed pada TaskItemCard, pada body fungsinya ditambahkan method deleteTask, Navigator.pop(context), dan ScaffoldMessenger


Bottom Sheets
-seperti dialog tetapi muncul dari bawah layar aplikasi
-menggunakan fungsi bawaan flutter showModalBottomSheet
-membutuhkan dua properti, yaitu context dan builder

Cara membuat bottom sheet
20 : membuat Bottom Sheet di file task_screen.dart
21 : buat file profile_sheet.dart di dalam folder components dan buat konten2nya
22 : di file task_screen.dart ganti Container pada builder showModalBottomSheet menjadi ProfileSheet() 
