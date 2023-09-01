abstract class Hewan {
  reproduksi() {
    print('tidak diketahui');
  }

  bernapas() {
    print('tidak diketahui');
  }
}

class Kambing extends Hewan {
  @override
  reproduksi() {
    print('melahirkan');
  }

  @override
  bernapas() {
    print('paru-paru');
  }
}

void main() {
  var k1 = Kambing();
  k1.bernapas();
  k1.reproduksi();

  // var h1 = Hewan();
}
