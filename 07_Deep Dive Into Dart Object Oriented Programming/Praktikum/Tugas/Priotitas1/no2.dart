class BangunRuang {
  int panjang = 4;
  int lebar = 2;
  int tinggi = 1;

  void volume() {}
}

class Kubus extends BangunRuang {
  int sisi = 6;

  @override
  void volume() {
    int volumeKubus = sisi * sisi * sisi;
    print('Volume Kubus adalah $volumeKubus');
  }
}

class Balok extends BangunRuang {
  @override
  void volume() {
    int volumeBalok = panjang * lebar * tinggi;
    print('Volume balok adalah $volumeBalok');
  }
}

void main() {
  var bangun = Kubus();
  bangun.volume();

  var bangun2 = Balok();
  bangun2.panjang = 4;
  bangun2.lebar = 3;
  bangun2.tinggi = 6;
  bangun2.volume();
}
