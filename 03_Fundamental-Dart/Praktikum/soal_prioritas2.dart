import 'dart:io';

void main() {
  var data;
  double tinggi;
  double phi = 3.14;
  double ruas;
  double volume;

  //Persegi Panjang
  print('--Menghitung Luas dan Keliling Persegi Panjang--');
  print('input tinggi: ');
  data = stdin.readLineSync();
  tinggi = double.parse(data);

  print('input ruas: ');
  data = stdin.readLineSync();
  ruas = double.parse(data);

  //Rumus Volume Tabung
  volume = (phi * ruas * ruas * tinggi);
  print('Volume Tabung = $volume');

  String variabel1 = "Halo, nama Saya";
  String variabel2 = " Icha.";
  String variabel3 = " Saya adalah seorang Mobile Flutter Developer";

  String hasilSambungan = variabel1 + variabel2 + variabel3;
  print(hasilSambungan);
}
