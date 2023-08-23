// void main() async {
//   var scores = [];
//   print(scores);
//   scores.add(60);
//   scores.add(60);
//   scores.add(90);
//   scores.add(70);
//   scores.add(85);
//   print(scores);
//   print(scores[3]);
// }

//mengunakan perulangan for in untuk mengambil data dari list secara otomatis
void main() async {
  var scores = [60, 70, 80, 90, 100];
  print(scores);

  for (var scores in scores) {
    print(scores);
  }
}
