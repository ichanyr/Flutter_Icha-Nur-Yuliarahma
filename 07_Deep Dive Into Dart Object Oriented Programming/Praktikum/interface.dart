class Hewan {
  reproduksi() {
    print('tidak diketahui');
  }

  bernapas() {
    print('tidak diketahui');
  }
}

class Kambing implements Hewan {
  @override
  bernapas() {
    print('paru-paru');
  }

  @override
  reproduksi() {
    print('melahirkan');
  }
}

void main() {
  var k1 = Kambing();
  k1.bernapas();
  k1.reproduksi();

  var h1 = Hewan();
  h1.bernapas();
  h1.reproduksi();
}
