// void P1() {
//   Future.delayed(Duration(seconds: 1), () {
//     print('Hello dari p1');
//   });
// }

// void P2() {
//   print('Hello dari p2');
// }

// void main() {
//   P1();
//   P2();
// }

Future<void> p1() async {
  await Future.delayed(Duration(seconds: 1), () {
    print('Helo dari p1');
  });
}

void p2() {
  print('Helo dari p2');
}

void main() async {
  await p1();
  p2();
}
