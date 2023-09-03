// Interface untuk bangun datar
abstract class BangunDatar {
  double getArea(); // Metode untuk menghitung luas
  double getPerimeter(); // Metode untuk menghitung keliling
}

// Kelas segitiga
class Segitiga implements BangunDatar {
  double alas;
  double tinggi;

  Segitiga(this.alas, this.tinggi);

  @override
  double getArea() {
    return 0.5 * alas * tinggi;
  }

  @override
  double getPerimeter() {
    // Untuk menghitung keliling segitiga, kita membutuhkan informasi lebih lanjut (sisi-sisi), yang tidak tersedia dalam class diagram.
    return 0.0; // Mengembalikan 0 karena kita tidak memiliki informasi sisi-sisi segitiga.
  }
}

// Kelas persegi
class Persegi implements BangunDatar {
  double sisi;

  Persegi(this.sisi);

  @override
  double getArea() {
    return sisi * sisi;
  }

  @override
  double getPerimeter() {
    return 4 * sisi;
  }
}

// Kelas lingkaran
class Lingkaran implements BangunDatar {
  double jariJari;

  Lingkaran(this.jariJari);

  @override
  double getArea() {
    return 3.14159265359 * jariJari * jariJari;
  }

  @override
  double getPerimeter() {
    return 2 * 3.14159265359 * jariJari;
  }
}

void main() {
  // Membuat instance bangun datar
  var segitiga = Segitiga(6, 8);
  var persegi = Persegi(5);
  var lingkaran = Lingkaran(4);

  // Menghitung dan menampilkan luas dan keliling untuk setiap bangun datar
  print('Segitiga:');
  print('Luas: ${segitiga.getArea()}');
  print('Keliling: ${segitiga.getPerimeter()}');
  print('');

  print('Persegi:');
  print('Luas: ${persegi.getArea()}');
  print('Keliling: ${persegi.getPerimeter()}');
  print('');

  print('Lingkaran:');
  print('Luas: ${lingkaran.getArea()}');
  print('Keliling: ${lingkaran.getPerimeter()}');
}
