import 'constructor.dart';

class Kambing extends Hewan {
  //constructor
  Kambing() {
    mata = 2;
    kaki = 4;
  }
}

void main() {
  var k1 = Kambing();
  print(k1.mata);
  print(k1.kaki);

  var h1 = Hewan();
  print(h1.mata);
  print(h1.kaki);
}
