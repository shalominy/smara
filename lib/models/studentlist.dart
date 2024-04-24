class Studentlist {
  String name;
  String studentid;
  String studentclass;
  String grade;
  String transcript;

  Studentlist({
    required this.name,
    required this.studentid,
    required this.studentclass,
    required this.grade,
    required this.transcript,
  });
}

List<Studentlist> students = [
  Studentlist(
    name: "Kristine",
    studentid: "A23S001",
    studentclass: "01",
    grade: "1",
    transcript: "A",
  ),
];
