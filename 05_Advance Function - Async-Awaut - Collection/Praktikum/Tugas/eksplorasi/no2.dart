void main() {
  List<String> input = [
    'js',
    'js',
    'js',
    'golang',
    'python',
    'js',
    'js',
    'golang',
    'rust'
  ];
  Map<String, int> frekuensi = hitungFrekuensi(input);

  print('Frekuensi Kemunculan:');
  frekuensi.forEach((data, jumlah) {
    print('$data: $jumlah');
  });
}

Map<String, int> hitungFrekuensi(List<String> input) {
  Map<String, int> frekuensiMap = {};
  for (String data in input) {
    if (frekuensiMap.containsKey(data)) {
      frekuensiMap[data]! + 1;
    } else {
      frekuensiMap[data] = 1;
    }
  }
  return frekuensiMap;
}
