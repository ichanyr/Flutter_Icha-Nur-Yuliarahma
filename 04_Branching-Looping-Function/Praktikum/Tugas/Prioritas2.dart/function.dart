import 'dart:math';

double hitungLuasLingkaran(double r) {
  return pi * r * r;
}

void main() {
  double jariJariLingkaran = 5.0;
  double luas = hitungLuasLingkaran(jariJariLingkaran);
  print("Luas lingkaran dengan jari-jari $jariJariLingkaran adalah $luas");
}
