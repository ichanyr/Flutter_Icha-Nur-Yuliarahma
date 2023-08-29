class Hewan {
  double berat;

  Hewan(this.berat);
}

class Mobil {
  double kapasitas;
  List<Hewan> muatan = [];

  Mobil(this.kapasitas);

  double hitungTotalMuatan() {
    double total = 0;
    for (var hewan in muatan) {
      total += hewan.berat;
    }
    return total;
  }

  void tambahMuatan(Hewan hewan) {
    if (hitungTotalMuatan() + hewan.berat <= kapasitas) {
      muatan.add(hewan);
      print("Hewan ditambahkan ke dalam muatan.");
    } else {
      print("Kapasitas muatan tidak mencukupi.");
    }
  }
}

void main() {
  var mobil = Mobil(1000); // Kapasitas maksimum muatan 1000 kg

  var hewan1 = Hewan(150);
  var hewan2 = Hewan(200);
  var hewan3 = Hewan(300);

  mobil.tambahMuatan(hewan1);
  mobil.tambahMuatan(hewan2);
  mobil.tambahMuatan(hewan3);

  print("Total muatan: ${mobil.hitungTotalMuatan()} kg");
}
