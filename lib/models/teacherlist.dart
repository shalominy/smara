class Teacherlist {
  String name;
  String teacherid;
  String grade;
  String course;
  String information;

  Teacherlist({
    required this.name,
    required this.teacherid,
    required this.grade,
    required this.course,
    required this.information,
  });
}

List<Teacherlist> teachers = [
  Teacherlist(
    name: "Jane",
    teacherid: "T21E7361",
    grade: "01",
    course: "English",
    information: "www.google.com",
  ),
];
