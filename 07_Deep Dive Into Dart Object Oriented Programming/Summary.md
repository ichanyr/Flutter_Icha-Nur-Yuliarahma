Constructor - untuk mengonstruksi objek baru
-Method yang dijalankan saat pembuatan object
-Dapat menerima parameter
-Tidak memiliki return
-Nama sama dengan nama class

Inheritance (pewarisan)
-Kemampuan suatu program Membuat class baru dengan memanfaatkan class yang sudah ada.
-Bertujuan agar kemampuan class yang sudah ada dapat dimiliki oleh class baru.
-Menambahkan extends saat pembuatan class baru.

Method Overriding
-Kemampuan untuk menulis ulang method yang ada pada super-class.
-Bertujuan agar class memiliki method yang sama, dengan proses yang berbeda.
Melakukan Overriding
-Dilakukan pada class yang melakukan inheritance.
-Method sudah ada pada class induk.
-Method ditulis ulang seperti membuat method baru pada class anak.
-Ditambahkan tanda @override di baris sebelum method dibuat.


Interface
-Merupakan class yang menunjukkan method apa saja yang ada pada suatu class.
-Seluruh method wajib di-override.
-Digunakan dengan menggunakan implements.
-Sekilas mirip inheritance.
-Pada class yang melakukan implements, wajib melakukan override semua method yang ada pada class induk.

Abstract Class
Abstract class tidak bisa lgsg dibuat suatu object, namun bisa mewariskan semua method dan propertinya.
-Berupa class abstrak
-Menunjukkan method apa saja yang ada pada suatu class
-Digunakan dengan menggunakan extends
-Tidak dapat dibuat object
-Tidak semua method harus di-override

Polimorphysm
-Kemampuan data berubah menjadi bentuk lain.
-Tipe data yang dapat digunakan adalah super class.
-Dapat digunakan pada class dengan extends atau implements.

Generics
-Dapat digunakan pada class atau fungsi.
-Memberi kemampuan agar dapat menerima data dengan tipe yang berbeda.
-Tipe data yang diinginkan, ditentukan saat membuat class atau menjalankan fungsi.
