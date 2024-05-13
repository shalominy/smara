

import 'dart:convert';

import 'package:mongo_dart/mongo_dart.dart';

StudentModel studentModelFromJson(String str) => StudentModel.fromJson(json.decode(str));

String studentModelToJson(StudentModel data) => json.encode(data.toJson());

class StudentModel {

    ObjectId id;
    String name;
    String studentid;
    String studentclass;
    String grade;
    String transcript;

    StudentModel({
        required this.id,
        required this.name,
        required this.studentid,
        required this.studentclass,
        required this.grade,
        required this.transcript,
    });

    factory StudentModel.fromJson(Map<String, dynamic> json) => StudentModel(
        id: json["_id"],
        name: json["name"],
        studentid: json["studentid"],
        studentclass: json["studentclass"],
        grade: json["grade"],
        transcript: json["transcript"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "studentid": studentid,
        "studentclass": studentclass,
        "grade": grade,
        "transcript": transcript,
    };
}
