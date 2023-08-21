import 'dart:io';

void main() {
  stdout.write("Masukkan nilai: ");
  var input = stdin.readLineSync();
  if (input != null) {
    var nilai = int.tryParse(input);
    if (nilai != null) {
      if (nilai > 70) {
        print('"Nilai A');
      } else if (nilai > 40) {
        print('"Nilai B');
      } else if (nilai > 0) {
        print('"Nilai C');
      } else {
        print("");
      }
    }
  }
}
