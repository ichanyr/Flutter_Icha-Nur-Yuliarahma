void main() {
  int baris = 9;
  int kolom = 9;

  print("Perkalian");

  print(" |" + "".padRight(5) + "|" + " ".padRight(5));
  print("".padRight(7, "-"));

  for (int i = 1; i <= kolom; i++) {
    String baris = "$i |";
    for (int j = 1; j <= kolom; j++) {
      int hasil = i * j;
      baris += "${hasil.toString().padLeft(4)}";
    }
    print(baris);
  }
}
