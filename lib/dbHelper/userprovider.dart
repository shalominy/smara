// ignore_for_file: prefer_final_fields

// import 'package:education_app/models/users_modeltemporary.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';

import '../models/users_modeltemporary.dart';
// import 'package:mongo_dart/mongo_dart.dart';
// import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier, DiagnosticableTreeMixin {
  // ignore: prefer_typing_uninitialized_variables

  String _id = "User ObjectID";
  // int _count = 222;
  String _name = "User Name";
  String _nickname = "User Nickname";
  String _matric = "User Matric";
  String _role = "User Role";
  String _emel = "User Email";
  List<String> _children = [];

  // late ObjectId userid;
  String get id => _id;
  // int get count => _count;
  String get name => _name;
  String get nickname => _nickname;
  String get matric => _matric;
  String get role => _role;
  String get emel => _emel;
  List<String> get children => _children;

  // int get counttambahsatu => _count + 1;

  // void increment() {
  //   _count++;
  //   notifyListeners();
  // }

  // void setto2881() {
  //   _count = 2881;
  //   notifyListeners();
  // }

  void setuser(UserModelTemporary user) {
    print("setuser executed");
    _id = user.id.toString();
    _name = user.name.toString();
    _nickname = user.nickname.toString();
    _matric = user.matric.toString();
    _role = user.role.toString();
    _emel = user.emel.toString();
    _children = user.children.toList();
    notifyListeners();
    // print(userid.toString());
  }

  /// Makes `Counter` readable inside the devtools by listing all of its properties
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    // properties.add(IntProperty('count', count));
    properties.add(StringProperty('id', id));
    properties.add(StringProperty('name', name));
    properties.add(StringProperty('nickname', nickname));
    properties.add(StringProperty('matric', matric));
    properties.add(StringProperty('role', role));
    properties.add(StringProperty('emel', emel));
    properties.add(IterableProperty<String>('children', children));
  }
}
