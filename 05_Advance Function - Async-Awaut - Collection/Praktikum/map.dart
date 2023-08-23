// void main() async {
//   var student = {};
//   student['name'] = 'Icha';
//   student['age'] = '20';
//   print(student);

//   print(student['name']);
//   print(student['age']);
// }

//mengakses data pada map menggunakan for in
void main() async {
  var student = {
    'name': 'Icha',
    'age': 20,
  };
  print(student);

  for (var key in student.keys) {
    print(student[key]);
  }
}
