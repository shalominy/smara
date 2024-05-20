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
  Teacherlist(
      name: "Jane",
      teacherid: "T21E7361",
      grade: "01",
      course: "English",
      information: "www.google.com"),
  Teacherlist(
      name: "John",
      teacherid: "T32F8432",
      grade: "02",
      course: "Mathematics",
      information: "www.mathclass.com"),
  Teacherlist(
      name: "Alice",
      teacherid: "T43G9243",
      grade: "03",
      course: "Science",
      information: "www.scienceclass.com"),
  Teacherlist(
      name: "Robert",
      teacherid: "T54H1354",
      grade: "04",
      course: "History",
      information: "www.historyclass.com"),
  Teacherlist(
      name: "Emily",
      teacherid: "T65I3465",
      grade: "05",
      course: "Art",
      information: "www.artclass.com")
];
