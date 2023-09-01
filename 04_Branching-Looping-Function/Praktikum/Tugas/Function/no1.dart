import 'dart:math';

// Fungsi untuk menghitung luas lingkaran
double hitungLuasLingkaran(double jariJari) {
  double luas = pi * jariJari * jariJari;
  return luas;
}

void main() {
  double jariJariLingkaran =
      5.0; // Ganti dengan nilai jari-jari yang  diinginkan
  double luasLingkaran = hitungLuasLingkaran(jariJariLingkaran);

  print(
      'Luas lingkaran dengan jari-jari $jariJariLingkaran adalah $luasLingkaran');
}
