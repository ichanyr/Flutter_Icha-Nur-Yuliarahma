class Course {
  String judul; //FIELD
  String deskripsi; //FIELD

  Course(this.judul, this.deskripsi);
}

class Student {
  String nama; //FIELD
  String kelas; //FIELD

  List<Course> courses = [
    Course("Flutter", ""),
    Course("Desain UI/UX", ""),
    Course("Quality Assurance", ""),
  ]; //FIELD

  Student(this.nama, this.kelas, this.courses);

  //METHOD
  void addCourse(Course course) {
    courses.add(course);
  }

  //METHOD
  void removeCourse(Course course) {
    courses.remove(course);
  }

  //METHOD
  void viewCourses() {
    print("Courses for $nama ($kelas):");
    for (var i = 0; i < courses.length; i++) {
      print("${i + 1}. ${courses[i].judul}");
    }
  }
}

void main() {
  var student = Student("Icha", "Kelas C", []);
  print(student.nama);
  print(student.kelas);
  student.viewCourses();
}
