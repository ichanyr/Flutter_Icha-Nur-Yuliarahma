//membuat object dari class Kambing

class Hewan {
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

class Kucing extends Hewan {
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
  Hewan k1 = Hewan();
  print(k1);
  k1.bernapas();

  k1 = Kambing();
  print(k1);
  k1.bernapas();

  k1 = Kucing();
  print(k1);
  k1.bernapas();
}
