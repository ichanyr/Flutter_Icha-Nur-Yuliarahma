import 'dart:io';

class Calculator {
  double penjumlahan(double a, double b) {
    return a + b;
  }

  double pengurangan(double a, double b) {
    return a - b;
  }

  double perkalian(double a, double b) {
    return a * b;
  }

  double pembagian(double a, double b) {
    if (b == 0) {
      throw Exception("Pembagian oleh nol tidak valid.");
    }
    return a / b;
  }
}

void main() {
  var calculator = Calculator();

  print("Masukkan angka pertama:");
  var angka1 = double.parse(stdin.readLineSync()!);

  print("Masukkan angka kedua:");
  var angka2 = double.parse(stdin.readLineSync()!);

  print("Hasil penjumlahan: ${calculator.penjumlahan(angka1, angka2)}");
  print("Hasil pengurangan: ${calculator.pengurangan(angka1, angka2)}");
  print("Hasil perkalian: ${calculator.perkalian(angka1, angka2)}");

  try {
    print("Hasil pembagian: ${calculator.pembagian(angka1, angka2)}");
  } catch (e) {
    print("Error: $e");
  }
}
