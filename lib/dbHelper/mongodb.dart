import 'dart:developer';

import 'package:education_app/dbHelper/constant.dart';
// import 'package:education_app/models/assignstudent_model.dart';
import 'package:education_app/models/coursework_model.dart';
// import 'package:education_app/dbHelper/userprovider.dart';
import 'package:education_app/models/student_model.dart';
import 'package:mongo_dart/mongo_dart.dart';
// import 'package:mongo_dart/mongo_dart.dart' as m;

import '../models/users_modeltemporary.dart';

class MongoDatabase {
  // ignore: prefer_typing_uninitialized_variables
  static var db, userCollection, id;
  static connect() async {
    db = await Db.create(MONGO_CONN_URL);
    await db.open();
    inspect(db);
    // userCollection= db.collection(USER__COLLECTION);
  }

  static Future<List<Map<String, dynamic>>> getstudents() async {
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
    userCollection = db.collection(TEACHER_COLLECTION);
    final arrData =
        await userCollection.find(where.oneFrom('name', name)).toList();
    // final arrData = await userCollection.find().toList();
    return arrData;
    // return arrData.map((doc) => doc['name'] as String);
  }

  static Future<List<Map<String, dynamic>>> getstudentsbyclass(
      List<String> classes) async {
    // static Future<List<Map<String, dynamic>>> getstudentsbyid()  async{
    userCollection = db.collection(TEACHER_COLLECTION);
    final arrData = await userCollection
        .find(where.oneFrom('studentclass', classes))
        .toList();
    // final arrData = await userCollection.find().toList();
    return arrData;
    // return arrData.map((doc) => doc['name'] as String);
  }

  //works
  // static Future<List<Map<String, dynamic>>> setusers(ObjectId objectid) async {
  //   userCollection= db.collection(USERS_COLLECTION);
  //   final arrData = await userCollection.find(where.eq('_id', objectid)).toList();
  //   // print(arrData._id.toString());
  //   // UserProvider().setuser();
  //   return arrData;
  // }

  // testing
  static Future<String> setusers(ObjectId objectid) async {
    userCollection = db.collection(USERS_COLLECTION);
    final arrData =
        await userCollection.find(where.eq('_id', objectid)).toList();
    // print(arrData._id.toString());
    // UserProvider().setuser();
    return arrData;
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

  // static Future<UserModelTemporary> getuserdetails(String id) async {
  //   userCollection= db.collection(TEACHER_COLLECTION);
  //   id = "Ameerul";
  //   final arrData = await userCollection.find({'name': id});
  //   UserModelTemporary data = UserModelTemporary(id: arrData._id, name: arrData.name, emel: arrData.emel, role: arrData.role);
  //   print("" + data.id.toString() + "sdsd" + data.name);
  //   return data;

  // }

  // static Future<String> getuserdetailstesting(String id) async {
  //   userCollection= db.collection(TEACHER_COLLECTION);
  //   id = "Ameerul";
  //   final arrData = await userCollection.find({'name': id});
  //   // UserModelTemporary data = UserModelTemporary(id: arrData._id, name: arrData.name, emel: arrData.emel, role: arrData.role);
  //   // print("" + data.id.toString() + "sdsd" + data.name);
  //   // print("" + data.id.toString() + "sdsd" + data.name);
  //   return arrData._id.toString();

  // }
  
}

