

import 'dart:convert';

import 'package:education_app/models/student_model.dart';
// import 'package:mongo_dart/mongo_dart.dart';

AssignStudentModel assignstudentModelFromJson(String str) => AssignStudentModel.fromJson(json.decode(str));

String assignstudentModelToJson(AssignStudentModel data) => json.encode(data.toJson());

class AssignStudentModel {


    StudentModel student;
    String submission;

    AssignStudentModel({

        required this.student,
        required this.submission,
    });

    factory AssignStudentModel.fromJson(Map<String, dynamic> json) => AssignStudentModel(

        student: json["student"],
        submission: json["submission"],
    );

    Map<String, dynamic> toJson() => {

        "student": student,
        "submission": submission,
    };
}
