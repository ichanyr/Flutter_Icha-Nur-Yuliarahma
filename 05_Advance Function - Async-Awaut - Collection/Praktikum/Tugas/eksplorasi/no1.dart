void main() {
  List<String> input1 = [
    'amuse',
    'tommy kaira',
    'spoon',
    'HKS',
    'litchfield',
    'amuse',
    'HKS'
  ];
  List<String> output1 = hapusDuplikat(input1);
  print('Output 1: $output1');

  List<String> input2 = [
    'JS Racing',
    'amuse',
    'spoon',
    'spoon',
    'JS Racing',
    'amuse'
  ];
  List<String> output2 = hapusDuplikat(input2);
  print('Output 2: $output2');
}

List<String> hapusDuplikat(List<String> input) {
  List<String> hasil = [];
  for (String item in input) {
    if (!hasil.contains(item)) {
      hasil.add(item);
    }
  }
  return hasil;
}
