// ignore_for_file: prefer_final_fields

import 'package:education_app/models/users_modeltemporary.dart';
import 'package:flutter/foundation.dart';
import 'package:mongo_dart/mongo_dart.dart';
// import 'package:flutter/material.dart';


class UserProvider with ChangeNotifier, DiagnosticableTreeMixin {

  // ignore: prefer_typing_uninitialized_variables
  

  int _count = 222;
  String _name = "User Name";
  String _role = "User Role";
  String _emel = "User Email";

  late ObjectId userid;

  int get count => _count;
  String get name => _name;
  String get role => _role;
  String get emel => _emel;

  // int get counttambahsatu => _count + 1;

  void increment() {
    _count++;
    notifyListeners();
  }

  void setto2881() {
  _count = 2881;
    notifyListeners();

  }

  void setuser(UserModelTemporary user) {
  print("setuser executed");
    _name = user.name.toString();
    _role = user.role.toString();
    _emel = user.emel.toString();
    notifyListeners();
  // print(userid.toString());

  }

  /// Makes `Counter` readable inside the devtools by listing all of its properties
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IntProperty('count', count));
    properties.add(StringProperty('name', name));
    properties.add(StringProperty('role', role));
    properties.add(StringProperty('emel', emel));
  }
}