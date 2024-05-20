import 'dart:convert';
import 'dart:developer';

import 'package:crypto/crypto.dart';
// import 'package:education_app/dbHelper/constant.dart';
// import 'package:education_app/dbHelper/userprovider.dart';
// // import 'package:education_app/models/assignstudent_model.dart';
// import 'package:education_app/models/coursework_model.dart';
// // import 'package:education_app/dbHelper/userprovider.dart';
// import 'package:education_app/models/student_model.dart';
// import 'package:education_app/routes/route_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:provider/provider.dart';
import 'package:smart_hub/models/teacher_model.dart';
// import 'package:mongo_dart/mongo_dart.dart' as m;

import '../models/assignstudent_model.dart';
import '../models/coursework_model.dart';
import '../models/student_model.dart';
import '../models/users_modeltemporary.dart';
import '../routes/route_helper.dart';
import 'package:intl/intl.dart';
import 'constant.dart';
import 'userprovider.dart';

class MongoDatabase {
  // ignore: prefer_typing_uninitialized_variables
  static var db, userCollection, id, secret;
  static connect() async {
    db = await Db.create(MONGO_CONN_URL);
    await db.open();
    inspect(db);
    // userCollection= db.collection(USER__COLLECTION);
  }

  // static Future<List<Map<String, dynamic>>> getstudents() async {
  static Future<void> login(
      String matric, String password, BuildContext context) async {
    // userCollection = db.collection(STUDENTS_COLLECTION);
    userCollection = db.collection(USERS_COLLECTION);
    // final arrData = await userCollection.find().toList();
    // final arrData = await userCollection.find(where.eq('name', 'asasas')).toList();
    try {
      var arrData = await userCollection.findOne(where.eq('matric', matric));
      var bytes = utf8.encode(password); // data being hashed
      var digest = sha1.convert(bytes);

      if (arrData != null) {
        if (digest.toString() == arrData["password"]) {
          print("nice");
          UserModelTemporary users = UserModelTemporary(
              id: arrData["_id"],
              name: arrData["name"],
              nickname: arrData["nickname"],
              matric: arrData["matric"],
              emel: arrData["emel"],
              role: arrData["role"],
              password: arrData["password"]);

          context.read<UserProvider>().setuser(users);
          Get.toNamed(RouteHelper.gotocontext(users.role));
        } else {
          print(arrData["password"]);
          print("wrong password");
        }
      } else {
        print("user not found");
      }
    } catch (e) {
      print(e);
    }

    // UserModelTemporary users = UserModelTemporary(id: null, name: '', emel: '', role: '');

    // context.read<UserProvider>().setuser(users);

    // Get.toNamed(RouteHelper.gettocontext(users.role));
    // print(arrData ?? 'got');
    // print(arrData["studentid"]);
    // print(digest);
    // return arrData;
  }

  static Future<String> getregistrationcode(BuildContext context) async {
    userCollection = db.collection("secret");

    var arrData = await userCollection.findOne(where.eq('type', 'secret code'));
    print(arrData["genratedcode"]);

    return arrData["generatedcode"];
  }

  static Future<void> insertnewregistrationcode(
      String newcode, BuildContext context) async {
    userCollection = db.collection("secret");

    // try{
    // var arrData = await userCollection.findOne(where.eq('type', 'secret code'));
    userCollection.updateOne(
        where.eq('type', 'secret code'), modify.set('generatedcode', newcode));
    // print(arrData["genratedcode"]);

    // return arrData["generatedcode"];
  }

  static Future<void> userregister(String code, UserModelTemporary data) async {
    userCollection = db.collection(USERS_COLLECTION);
    secret = db.collection("secret");
    var secretcode = await secret.findOne(where.eq('type', 'secret code'));

    try {
      if (code == secretcode["generatedcode"]) {
        var result = await userCollection.insertOne(data.toJson());
        if (result.isSuccess) {
          print("User Registered" + data.toJson().toString());

          // return "User Registered" + data.toJson().toString();
        } else {
          print("Something went wrong while registering");
          // return "Something went wrong while registering";
        }
      } else {
        print("code is not correct");
        // return "code is not correct";
      }
    } catch (e) {
      print(e.toString());
      // return e.toString();
    }
  }

  static Future<void> updatecourseworkfeedback(
      List<String> newassignstudentdetails,
      CourseworkModel coursework,
      BuildContext context) async {
    userCollection = db.collection(COURSEWORK_COLLECTION);

    // try{
    // var arrData = await userCollection.findOne(where.eq('type', 'secret code'));
    // userCollection.updateOne(where.eq('courseworkid_', coursework.id), modify.set('studentlist', newassignstudentdetails));
    userCollection.updateOne(where.eq('_id', coursework.id),
        modify.set('assigneeslist', newassignstudentdetails));
    // print(arrData["genratedcode"]);

    // return arrData["generatedcode"];
  }

  static Future<List<Map<String, dynamic>>> getstudentbycoursework(
      ObjectId courseworkid) async {
    // static Future<List<Map<String, dynamic>>> getstudentsbyid()  async{

    userCollection = db.collection(COURSEWORK_COLLECTION);

    // try{
    // final arrData = await userCollection
    //     .find(where.eq('_id', courseworkid))
    //     .toList();

    // // print(arrData["assigneeslist"]);
    // // return arrData["assigneeslist"];

    // if (arrData.isNotEmpty) {
    //   for (var document in arrData) {
    //     if (document.containsKey('_id')) {
    //       print(document['assigneeslist']);
    //       // return document['assigneeslist'];
    //       return [];
    //     } else {
    //       print('Field "_id" not found in the document.');
    //       return [];
    //     }
    //   }
    // } else {
    //   print('No documents found with the specified _id');
    //   return [];
    // }

    // }catch (e) {
    // print('An error occurred: $e');
    // return [];
    // }throw{

    // };
    // return arrDataassignees;
    // return arrData.map((doc) => doc['name'] as String);

    try {
      final arrData =
          await userCollection.find(where.eq('_id', courseworkid)).toList();

      // var val = await userCollection.find(where.eq("_id", courseworkid).fields(['assigneeslist'])).toList();
      //     var val = await userCollection.find(where.eq("_id", courseworkid).fields(['assigneeslist'])).toList();
      // print(val[0]);

      return arrData;
    } catch (e) {
      print('An error occurred: $e');
      return [];
    }
  }

  static Future<List<Map<String, dynamic>>> getstudentbycoursework2(
      ObjectId courseworkid) async {
    // static Future<List<Map<String, dynamic>>> getstudentsbyid()  async{

    userCollection = db.collection(COURSEWORK_COLLECTION);

    // try{
    // final arrData = await userCollection
    //     .find(where.eq('_id', courseworkid))
    //     .toList();

    // // print(arrData["assigneeslist"]);
    // // return arrData["assigneeslist"];

    // if (arrData.isNotEmpty) {
    //   for (var document in arrData) {
    //     if (document.containsKey('_id')) {
    //       print(document['assigneeslist']);
    //       // return document['assigneeslist'];
    //       return [];
    //     } else {
    //       print('Field "_id" not found in the document.');
    //       return [];
    //     }
    //   }
    // } else {
    //   print('No documents found with the specified _id');
    //   return [];
    // }

    // }catch (e) {
    // print('An error occurred: $e');
    // return [];
    // }throw{

    // };
    // return arrDataassignees;
    // return arrData.map((doc) => doc['name'] as String);

    try {
      final arrData =
          await userCollection.find(where.eq('_id', courseworkid)).toList();

      // var val = await userCollection.find(where.eq("_id", courseworkid).fields(['assigneeslist'])).toList();
      //     var val = await userCollection.find(where.eq("_id", courseworkid).fields(['assigneeslist'])).toList();
      // print(val[0]);

      return arrData;
    } catch (e) {
      print('An error occurred: $e');
      return [];
    }
  }

  // static Future<List<Map<String, dynamic>>> getcourseworkbystudent(
  static Future<List<CourseworkModel>> getcourseworkbystudent(
      String studentid) async {
    // static Future<List<Map<String, dynamic>>> getstudentsbyid()  async{

    userCollection = db.collection(COURSEWORK_COLLECTION);

    // try {
      final arrData0 =
          await userCollection.find().toList();

      // List<CourseworkModel> relatedcourseworks = arrData0["assigneeslist"].map((assigneeslist) => assigneeslist["student"].map((student) { if(student["studentid"] == studentid.toString()){ return arrData0["_id"];}}));
      // print("ini arrdata0" + arrData0.map((assigneeslist ){ return assigneeslist["assigneeslist"].map((student){ var studentt =  jsonDecode(student); return studentt; }); } ).toString());
      // print("ini arrdata0" + arrData0.map((assigneeslist ){ return assigneeslist["assigneeslist"].map((student){ var studentt =  jsonDecode(student); AssignStudentModel studentss = AssignStudentModel.fromJson(studentt); if(true){return studentss.student.studentid;} }); } ).toString());
      // print("ini arrdata0" + arrData0.map((assigneeslist ){ return assigneeslist["assigneeslist"].map((student){ var studentt =  jsonDecode(student); AssignStudentModel studentss = AssignStudentModel.fromJson(studentt); if(studentss.student.studentid == '111'){return CourseworkModel.fromJson(assigneeslist);} }); } ).toString());
      // print("ini arrdata0" + arrData0.map((assigneeslist ){ return assigneeslist["assigneeslist"].map((student){ var studentt =  jsonDecode(student); AssignStudentModel studentss = AssignStudentModel.fromJson(studentt); if(studentss.student.studentid == '111'){return assigneeslist;} }); } ).toString());

      //  List<CourseworkModel> courseworks = arrData0.map((assigneeslist ){ return assigneeslist["assigneeslist"].map((student){ var studentt =  jsonDecode(student); AssignStudentModel studentss = AssignStudentModel.fromJson(studentt); if(studentss.student.studentid == '111'){return CourseworkModel.fromJson(assigneeslist);} }); } ).toList();
      // final List<CourseworkModel> courseworks = arrData0.map((assigneeslist ){ return assigneeslist["assigneeslist"].map((student){ var studentt =  jsonDecode(student); AssignStudentModel studentss = AssignStudentModel.fromJson(studentt); if(studentss.student.studentid == '111'){return assigneeslist;} }); } );

      List<CourseworkModel> courseworks = arrData0
    .map((assigneeslist) {
      // Filter the assigneeslist to find the student with the given id
      var filteredAssignees = assigneeslist["assigneeslist"].where((student) {
        var studentModel = AssignStudentModel.fromJson(jsonDecode(student));
        return studentModel.student.studentid == studentid;
      }).toList();

      // If the filtered list is not empty, return the assigneeslist
      if (filteredAssignees.isNotEmpty) {
        return CourseworkModel.fromJson(assigneeslist);
      } else {
        return null;
      }
    })
    .where((assigneeslist) => assigneeslist != null) // Filter out the null values
    .cast<CourseworkModel>() // Ensure the list is of type List<CourseworkModel>
    .toList();

      // return arrData0;
      return courseworks;
      
    // } catch (e) {
    //   print('An error occurred: $e');
    //   return [];
    // }
  }

  static Future<List<Map<String, dynamic>>> getstudents() async {
    userCollection = db.collection(STUDENTS_COLLECTION);
    final arrData = await userCollection.find().toList();

    return arrData;
  }

  static Future<List<Map<String, dynamic>>> getteachers() async {
    userCollection = db.collection(TEACHER_COLLECTION);
    final arrData = await userCollection.find().toList();

    return arrData;
  }

  static Future<List<Map<String, dynamic>>> getusers() async {
    userCollection = db.collection(USERS_COLLECTION);
    final arrData = await userCollection.find().toList();
    return arrData;
  }

  static Future<List<Map<String, dynamic>>> getclasses() async {
    userCollection = db.collection(CLASS_COLLECTION);
    final arrData = await userCollection.find().toList();
    return arrData;
    // return arrData.map((doc) => doc['name'] as String);
  }

  static Future<List<Map<String, dynamic>>> getstudentsbyname(
      List<String> name) async {
    // static Future<List<Map<String, dynamic>>> getstudentsbyid()  async{
    userCollection = db.collection(STUDENTS_COLLECTION);
    final arrData =
        await userCollection.find(where.oneFrom('name', name)).toList();
    // final arrData = await userCollection.find().toList();
    return arrData;
    // return arrData.map((doc) => doc['name'] as String);
  }

  static Future<List<Map<String, dynamic>>> getstudentsbyclass(
      List<String> classes) async {
    // static Future<List<Map<String, dynamic>>> getstudentsbyid()  async{
    userCollection = db.collection(STUDENTS_COLLECTION);
    final arrData = await userCollection
        .find(where.oneFrom('studentclass', classes))
        .toList();
    // final arrData = await userCollection.find().toList();
    return arrData;
    // return arrData.map((doc) => doc['name'] as String);
  }

  static Future<List<Map<String, dynamic>>> getcourseworkbyteacherid(
      ObjectId teacherid) async {
    // static Future<List<Map<String, dynamic>>> getstudentsbyid()  async{

    userCollection = db.collection(COURSEWORK_COLLECTION);
    final arrData = await userCollection
        .find(where.eq('teacherid', teacherid).sortBy('_id', descending: true))
        .toList();
    // final arrData = await userCollection.find().toList();
    return arrData;
    // return arrData.map((doc) => doc['name'] as String);
  }

  static String setuserid(String userid) {
    id = userid;
    print(userid);
    return "hereee" + userid;
  }

  static String getuserid() {
    return id;
  }

  static Future<String> insertstudent(StudentModel data) async {
    userCollection = db.collection(STUDENTS_COLLECTION);

    try {
      var result = await userCollection.insertOne(data.toJson());
      if (result.isSuccess) {
        return "Data inserted" + data.toJson().toString();
      } else {
        return "Something went wrong while inserting student data";
      }
    } catch (e) {
      // print(e.toString());
      return e.toString();
    }
  }

  static Future<String> insertteacher(TeacherModel data) async {
    userCollection = db.collection(TEACHER_COLLECTION);

    try {
      var result = await userCollection.insertOne(data.toJson());
      if (result.isSuccess) {
        return "Data inserted" + data.toJson().toString();
      } else {
        return "Something went wrong while inserting student data";
      }
    } catch (e) {
      // print(e.toString());
      return e.toString();
    }
  }

  static Future<String> insertusertemporary(UserModelTemporary data) async {
    userCollection = db.collection(USERS_COLLECTION);
    try {
      var result = await userCollection.insertOne(data.toJson());
      if (result.isSuccess) {
        return "Data inserted";
      } else {
        return "Something went wrong while inserting student data";
      }
    } catch (e) {
      // print(e.toString());
      return e.toString();
    }
  }

  static Future<String> insertcoursework(CourseworkModel data) async {
    userCollection = db.collection(COURSEWORK_COLLECTION);
    try {
      var result = await userCollection.insertOne(data.toJson());
      if (result.isSuccess) {
        return "Data inserted";
      } else {
        return "Something went wrong while inserting student data";
      }
    } catch (e) {
      // print(e.toString());
      return e.toString();
    }
  }
}
