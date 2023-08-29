class Buku {
  int id;
  String judul;
  String penerbit;
  double harga;
  String kategori;

  Buku(this.id, this.judul, this.penerbit, this.harga, this.kategori);
}

class TokoBuku {
  List<Buku> daftarBuku = [];

  void tambahBuku(
      int id, String judul, String penerbit, double harga, String kategori) {
    Buku buku = Buku(id, judul, penerbit, harga, kategori);
    daftarBuku.add(buku);
    print('Buku berhasil ditambahkan.');
  }

  List<Buku> semuaDataBuku() {
    return daftarBuku;
  }

  void hapusBuku(int id) {
    daftarBuku.removeWhere((buku) => buku.id == id);
    print('Buku dengan ID $id berhasil dihapus.');
  }
}

void main() {
  TokoBuku toko = TokoBuku();

  // Tambah buku
  toko.tambahBuku(1, 'Filosofi Teras', 'Gramedia', 150000, 'Filsafat');
  toko.tambahBuku(
      2, 'Think and Grow Rich', 'Penerbit A', 200000, 'Self-Development');

  // Semua data buku
  List<Buku> dataBuku = toko.semuaDataBuku();
  print('Semua Data Buku:');
  for (var buku in dataBuku) {
    print(
        'ID: ${buku.id}, Judul: ${buku.judul}, Penerbit: ${buku.penerbit}, Harga: ${buku.harga}, Kategori: ${buku.kategori}');
  }

  // Hapus buku
  toko.hapusBuku(1);
}
