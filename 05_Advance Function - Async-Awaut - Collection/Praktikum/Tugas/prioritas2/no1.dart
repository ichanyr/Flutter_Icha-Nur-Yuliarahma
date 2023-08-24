void main() {
  List<List<String>> hewanList = [
    ['Kucing', 'Mamalia'],
    ['Burung Beo', 'Burung'],
    ['Kuda', 'Mamalia'],
    ['Kanguru', 'Mamalia'],
    ['Kura-kura', 'Reptil'],
  ];

  Map<String, String> animalMap = {};
  for (var hewanData in hewanList) {
    animalMap[hewanData[0]] = hewanData[1];
  }

  // Cetak list hewan
  print('List Hewan:');
  for (var hewanData in hewanList) {
    print('Hewan: ${hewanData[0]}, Jenis: ${hewanData[1]}');
  }

  print('\nMap Hewan:');
  animalMap.forEach((hewan, kategori) {
    print('Hewan: $hewan, Jenis: $kategori');
  });
}
