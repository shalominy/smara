import 'dart:convert';
import 'dart:developer';

import 'package:crypto/crypto.dart';
import 'package:education_app/dbHelper/constant.dart';
import 'package:education_app/dbHelper/userprovider.dart';
// import 'package:education_app/models/assignstudent_model.dart';
import 'package:education_app/models/coursework_model.dart';
// import 'package:education_app/dbHelper/userprovider.dart';
import 'package:education_app/models/student_model.dart';
import 'package:education_app/routes/route_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:provider/provider.dart';
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

  // static Future<List<Map<String, dynamic>>> getstudents() async {
  static Future<void> login(String username, String password, BuildContext context) async {
  
    // userCollection = db.collection(STUDENTS_COLLECTION);
    userCollection = db.collection(USERS_COLLECTION);
    // final arrData = await userCollection.find().toList();
    // final arrData = await userCollection.find(where.eq('name', 'asasas')).toList();
    try{
    var arrData = await userCollection.findOne(where.eq('name', username));
    var bytes = utf8.encode(password); // data being hashed
    var digest = sha1.convert(bytes);

    if(arrData != null){

      if(digest.toString() == arrData["password"]){

        print("nice");
        UserModelTemporary users = UserModelTemporary(id: arrData["_id"], name: arrData["name"], emel: arrData["emel"], role: arrData["role"], password: arrData["password"]);

        context.read<UserProvider>().setuser(users);
        Get.toNamed(RouteHelper.gettocontext(users.role));  


      }else{
        print(arrData["password"]);
        print("wrong password");
      }
      
    }else{
      print("user not found");
    }


    }catch(e){
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

  static Future<List<Map<String, dynamic>>> getstudents() async {
  // static Future<void> getstudents(String username, String password, BuildContext context) async {
  
    userCollection = db.collection(STUDENTS_COLLECTION);
    // userCollection = db.collection(USERS_COLLECTION);
    final arrData = await userCollection.find().toList();
    // final arrData = await userCollection.find(where.eq('name', 'asasas')).toList();
    // var arrData = await userCollection.findOne(where.eq('name', 'asasas'));
    // final owo = null;

    // UserModelTemporary users = UserModelTemporary(id: null, name: '', emel: '', role: '');

    // context.read<UserProvider>().setuser(users);

        // Get.toNamed(RouteHelper.gettocontext(users.role));  
    // print(arrData ?? 'got');
    // print(arrData["studentid"]);
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

  static Future<List<Map<String, dynamic>>> getstudentsbyclass(List<String> classes) async {
    // static Future<List<Map<String, dynamic>>> getstudentsbyid()  async{
    userCollection = db.collection(TEACHER_COLLECTION);
    final arrData = await userCollection
        .find(where.oneFrom('studentclass', classes))
        .toList();
    // final arrData = await userCollection.find().toList();
    return arrData;
    // return arrData.map((doc) => doc['name'] as String);
  }

  static Future<List<Map<String, dynamic>>> getcourseworkbyteacherid(ObjectId teacherid) async {
    // static Future<List<Map<String, dynamic>>> getstudentsbyid()  async{
    
    userCollection = db.collection(COURSEWORK_COLLECTION);
    final arrData = await userCollection
        .find(where.eq('teacherid', teacherid).sortBy('_id', descending:true ))
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

