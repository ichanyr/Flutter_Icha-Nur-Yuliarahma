import 'constructor.dart';

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
  k1.reproduksi();
  k1.bernapas();

  var h1 = Hewan();
  h1.reproduksi();
  h1.bernapas();
}
