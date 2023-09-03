// Class Hadiah dapat dimasukkan data dengan tipe T
// Tipe T dapat digunakan di seluruh class Hadiah

// class Hadiah<T> {
//   var isi;

//   Hadiah(T i) {
//     isi = i;
//   }
// }

// void main() {
//   // Setelah nama class, menjadi tempat tipe data yang diinginkan
//   var h1 = Hadiah<String>('mobil');
//   print(h1.isi);

//   var h2 = Hadiah<int>(10);
//   print(h2.isi);
// }

// Setelah nama fungsi, menjadi tempat variable generics
void cekkTipe<T>(T data) {
  print(data.runtimeType);
}

// Setelah nama fungsi, menjadi tempat tipe data yang diinginkan
void main() {
  cekkTipe<String>('satu');
  cekkTipe<int>(1);
  cekkTipe<bool>(true);
}
