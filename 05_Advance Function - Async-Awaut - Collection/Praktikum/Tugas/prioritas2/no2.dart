void main() {
  List<int> nilai = [7, 5, 3, 5, 2, 1, 4, 5, 6, 10];

  double total = 0;
  for (int n in nilai) {
    total += n;
  }

  double rataRata = total / nilai.length;
  int rataRataBulat = rataRata.ceil();

  print('Rata-rata nilai: $rataRataBulat');
}
