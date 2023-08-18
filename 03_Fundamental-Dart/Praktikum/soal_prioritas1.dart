import 'dart:io';

void main() {
  double panjang;
  double lebar;
  double luas;
  double keliling;
  var data;
  double sisi;
  double phi = 3.14;
  double ruas;

  //Persegi Panjang
  print('--Menghitung Luas dan Keliling Persegi Panjang--');
  print('input panjang: ');
  data = stdin.readLineSync();
  panjang = double.parse(data);

  print('input lebar: ');
  data = stdin.readLineSync();
  lebar = double.parse(data);

  //Rumus Luas Persegi Panjang
  luas = (panjang * lebar);
  print('Luas Persegi Panjang = $luas');
  //Rumus Keliling Persegi Panjang
  keliling = ((2 * panjang) + (2 * lebar));
  print('Keliling Persegi Panjang = $keliling');

  print('------------------------------------');
  print('--Menghitung Luas dan Keliling Persegi--');
  //Persegi
  print('input sisi: ');
  data = stdin.readLineSync();
  sisi = double.parse(data);

  //Rumus Luas Persegi
  luas = (2 * sisi);
  print('Luas Persegi = $luas');
  //Rumus Keliling Persegi
  luas = (4 * sisi);
  print('Keliling Persegi = $luas');

  print('------------------------------------');
  print('--Menghitung Luas dan Keliling Lingkaran--');
  //Rumus Lingkaran
  print('input ruas: ');
  data = stdin.readLineSync();
  ruas = double.parse(data);

  //Rumus Luas Persegi Panjang
  luas = (phi * ruas * ruas);
  print('Luas Lingkaran = $luas');
  //Rumus Keliling Persegi Panjang
  keliling = (2 * phi * ruas);
  print('Keliling Lingkaran = $keliling');
}
