Future<List<int>> multiplyList(List<int> data, int pengali) async {
  List<int> hasilPengali = [];

  for (int element in data) {
    // Simulate some asynchronous computation
    await Future.delayed(Duration(seconds: 1));
    hasilPengali.add(element * pengali);
  }

  return hasilPengali;
}

void main() async {
  List<int> listAngka = [1, 2, 3, 4, 5];
  int angkaPengali = 10;

  List<int> resultList = await multiplyList(listAngka, angkaPengali);
  print(resultList);
}
