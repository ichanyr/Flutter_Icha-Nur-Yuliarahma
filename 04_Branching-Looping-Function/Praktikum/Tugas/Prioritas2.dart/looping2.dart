import 'dart:io';

void printn(String text) {
  stdout.write(text);
}

void main() {
  int tinggi =
      11; // Ubah nilai tinggi sesuai dengan tinggi jam pasir yang Anda inginkan

  // Bagian atas jam pasir
  for (int i = 1; i <= (tinggi + 1) ~/ 2; i++) {
    for (int j = 1; j < i; j++) {
      printn(" ");
    }
    for (int k = 1; k <= tinggi - 2 * (i - 1); k++) {
      printn("*");
    }
    print(""); // Pindah baris setelah setiap baris bintang selesai
  }

  // Bagian bawah jam pasir
  for (int i = (tinggi + 1) ~/ 2 - 1; i >= 1; i--) {
    for (int j = i - 1; j >= 1; j--) {
      printn(" ");
    }
    for (int k = tinggi - 2 * (i - 1); k >= 1; k--) {
      printn("*");
    }
    print(""); // Pindah baris setelah setiap baris bintang selesai
  }
}
