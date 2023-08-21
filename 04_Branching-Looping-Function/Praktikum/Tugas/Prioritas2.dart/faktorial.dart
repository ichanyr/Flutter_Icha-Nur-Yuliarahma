void main() {
  List<int> values = [10, 40, 50];

  for (int value in values) {
    int factorial = 1;
    for (int i = 1; i <= value; i++) {
      factorial *= i;
    }
    print("Faktorial dari $value adalah $factorial");
  }
}
