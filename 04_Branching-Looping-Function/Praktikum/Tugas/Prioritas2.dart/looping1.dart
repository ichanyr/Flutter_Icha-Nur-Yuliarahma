import 'dart:io';

void printn(String text) {
  stdout.write(text);
}

void main() {
  int tinggi = 8;
  int bintang = 1;

  for (int i = 1; i <= tinggi; i++) {
    for (int j = 1; j <= tinggi - i; j++) {
      printn(" "); // Spasi untuk membuat pola tergeser ke kanan
    }
    for (int k = 1; k <= bintang; k++) {
      printn("*");
    }
    bintang += 2; // Naikkan jumlah bintang untuk baris berikutnya
    print(""); // Pindah baris setelah setiap baris bintang selesai
  }
}
