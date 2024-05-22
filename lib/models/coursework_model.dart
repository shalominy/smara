import 'dart:convert';

import 'package:mongo_dart/mongo_dart.dart';

CourseworkModel courseworkModelFromJson(String str) =>
    CourseworkModel.fromJson(json.decode(str));

String courseworkModelToJson(CourseworkModel data) =>
    json.encode(data.toJson());

class CourseworkModel {
  ObjectId id;
  ObjectId teacherid;
  String type;
  String name;
  DateTime assigndate;
  DateTime duedate;
  String assigneestype;
  List<String> assigneeslist;
  String content;

  CourseworkModel({
    required this.id,
    required this.teacherid,
    required this.type,
    required this.name,
    required this.assigndate,
    required this.duedate,
    required this.assigneestype,
    required this.assigneeslist,
    required this.content,
  });

  factory CourseworkModel.fromJson(Map<String, dynamic> json) =>
      CourseworkModel(
        id: json["_id"],
        teacherid: json["teacherid"],
        type: json["type"],
        name: json["name"],
        assigndate: json["assigndate"],
        duedate: json["duedate"],
        assigneestype: json["assigneestype"],
        // assigneeslist: json["assigneeslist"],
        // assigneeslist: json.values.map((value) => value.toString()).toList(),
        assigneeslist: (json["assigneeslist"] as List?)?.map((value) => value.toString()).toList() ?? [],
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "teacherid": teacherid,
        "type": type,
        "name": name,
        "assigndate": assigndate,
        "duedate": duedate,
        "assigneestype": assigneestype,
        "assigneeslist": assigneeslist,
        "content": content,
      };
}
