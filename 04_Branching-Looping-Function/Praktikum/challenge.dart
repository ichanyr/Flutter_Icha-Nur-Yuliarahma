void main() {
  int jumlahBuku = 3;
  int jumlahPensil = 5;
  int jumlahTas = 2;

  int totalBelanja = totalHarga(jumlahBuku, jumlahPensil, jumlahTas);
  print("Total harga belanja: $totalBelanja");
}

int totalHarga(int jumlahBuku, int jumlahPensil, int jumlahTas) {
  int hargaBuku = 10000;
  int hargaPensil = 5000;
  int hargaTas = 100000;

  int totalBuku = jumlahBuku * hargaBuku;
  int totalPensil = jumlahPensil * hargaPensil;
  int totalTas = jumlahTas * hargaTas;

  return totalBuku + totalPensil + totalTas;
}
