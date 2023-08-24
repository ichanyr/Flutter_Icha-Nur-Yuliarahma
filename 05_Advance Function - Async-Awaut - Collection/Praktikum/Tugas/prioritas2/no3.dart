import 'dart:async';
import 'dart:io';

void main() {
  stdout.write('Masukkan angka: ');
  String input = stdin.readLineSync()!;
  int angka = int.parse(input);

  hitungFaktorial(angka).then((faktorial) {
    print('Faktorial dari $angka adalah $faktorial');
  });
}

Future<int> hitungFaktorial(int n) async {
  if (n == 0 || n == 1) {
    return 1;
  } else {
    return n * await hitungFaktorial(n - 1);
  }
}
