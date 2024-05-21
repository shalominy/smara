import 'dart:convert';

import 'student_model.dart';

// import 'package:education_app/models/student_model.dart';
// import 'package:mongo_dart/mongo_dart.dart';

AssignStudentModel assignstudentModelFromJson(String str) =>
    AssignStudentModel.fromJson(json.decode(str));

String assignstudentModelToJson(AssignStudentModel data) =>
    json.encode(data.toJson());

class AssignStudentModel {
  StudentModel student;
  String submission;
  String feedback;

  AssignStudentModel({
    required this.student,
    required this.submission,
    required this.feedback,
  });

  factory AssignStudentModel.fromJson(Map<String, dynamic> json) =>
      AssignStudentModel(
        // student: json["student"],
        student: StudentModel.fromJson(json["student"]),
        submission: json["submission"],
        feedback: json["feedback"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "student": student,
        "submission": submission,
        "feedback": feedback,
      };
}
