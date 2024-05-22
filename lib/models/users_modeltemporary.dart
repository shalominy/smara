// To parse this JSON data, do
//
//     final userModelTemporary = userModelTemporaryFromJson(jsonString);

import 'dart:convert';

import 'package:mongo_dart/mongo_dart.dart';

UserModelTemporary userModelTemporaryFromJson(String str) =>
    UserModelTemporary.fromJson(json.decode(str));

String userModelTemporaryToJson(UserModelTemporary data) =>
    json.encode(data.toJson());

class UserModelTemporary {
  ObjectId id;
  String name;
  String nickname;
  String matric;
  String emel;
  String role;
  List<String> children;
  String password;

  UserModelTemporary({
    required this.id,
    required this.name,
    required this.nickname,
    required this.matric,
    required this.emel,
    required this.role,
    required this.children,
    required this.password,
  });

  factory UserModelTemporary.fromJson(Map<String, dynamic> json) =>
      UserModelTemporary(
      //soon to be updated that users are compulsory to have all field
        id: json["_id"] ?? " ",
        name: json["name"],
        nickname: json["nickname"] ?? " ",
        matric: json["matric"] ?? " ",
        emel: json["emel"] ?? " ",
        role: json["role"] ?? " ",
        children: (json["children"] as List?)?.map((value) => value.toString()).toList() ?? [],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "nickname": nickname,
        "matric": matric,
        "emel": emel,
        "role": role,
        "children": children,
        "password": password,
      };
}
