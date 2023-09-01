class Hewan {
  //field/property
  int? mata;
  int? kaki;

  //constructor
  Hewan() {
    mata = 0;
    kaki = 0;
  }

  //method
  reproduksi() {
    print('tidak diketahui');
  }

  bernapas() {
    print('tidak diketahui');
  }
}

void main() {
  var hewan = Hewan();
  print(hewan.mata);
  print(hewan.kaki);
}
