import 'dart:convert';

import 'package:mongo_dart/mongo_dart.dart';

MaterialNoticeModel courseworkModelFromJson(String str) =>
    MaterialNoticeModel.fromJson(json.decode(str));

String courseworkModelToJson(MaterialNoticeModel data) =>
    json.encode(data.toJson());

class MaterialNoticeModel {
  ObjectId id;
  ObjectId teacherid;
  String title;
  DateTime assigndate;
  String assigneestype;
  List<String> assigneeslist;
  String content;

  MaterialNoticeModel({
    required this.id,
    required this.teacherid,
    required this.title,
    required this.assigndate,
    required this.assigneestype,
    required this.assigneeslist,
    required this.content,
  });

  factory MaterialNoticeModel.fromJson(Map<String, dynamic> json) =>
      MaterialNoticeModel(
        id: json["_id"],
        teacherid: json["teacherid"],
        title: json["title"],
        assigndate: json["assigndate"],
        assigneestype: json["assigneestype"],
        // assigneeslist: json["assigneeslist"],
        // assigneeslist: json.values.map((value) => value.toString()).toList(),
        assigneeslist: (json["assigneeslist"] as List?)?.map((value) => value.toString()).toList() ?? [],
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "teacherid": teacherid,
        "title": title,
        "assigndate": assigndate,
        "assigneestype": assigneestype,
        "assigneeslist": assigneeslist,
        "content": content,
      };
}
