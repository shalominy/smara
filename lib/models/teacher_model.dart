import 'dart:convert';

import 'package:mongo_dart/mongo_dart.dart';

TeacherModel teacherModelFromJson(String str) =>
    TeacherModel.fromJson(json.decode(str));

String teacherModelToJson(TeacherModel data) => json.encode(data.toJson());

class TeacherModel {
  ObjectId id;
  String name;
  String username;
  String teacherid;

  TeacherModel(
      {required this.id,
      required this.name,
      required this.username,
      required this.teacherid});

  factory TeacherModel.fromJson(Map<String, dynamic> json) => TeacherModel(
        // id: json["_id"],
        id: ObjectId.parse(json["_id"]),
        name: json["name"] ?? " ",
        username: json["username"] ?? " ",
        teacherid: json["teacherid"] ?? " ",
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "username": username,
        "teacherid": teacherid,
      };
}
