BigInt faktorial(int n) {
  if (n == 0) {
    return BigInt.one;
  } else {
    BigInt result = BigInt.one;
    for (int i = 1; i <= n; i++) {
      result *= BigInt.from(i);
    }
    return result;
  }
}

void main() {
  List<int> nilai = [10, 40, 50];

  for (int n in nilai) {
    BigInt hasil = faktorial(n);
    print('Faktorial dari $n adalah $hasil');
  }
}
