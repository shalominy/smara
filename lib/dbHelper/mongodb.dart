import 'dart:developer';

import 'package:education_app/dbHelper/constant.dart';
import 'package:education_app/models/student_model.dart';
import 'package:mongo_dart/mongo_dart.dart';

class MongoDatabase{
  // ignore: prefer_typing_uninitialized_variables
  static var db, userCollection;
  static connect() async {
    db = await Db.create(MONGO_CONN_URL);
    await db.open();
    inspect(db);
    userCollection= db.collection(USER__COLLECTION);
  }

  static Future<List<Map<String, dynamic>>> getstudents() async {
    final arrData = await userCollection.find().toList();
    return arrData;
  }

  static Future<String> insertstudent(StudentModel data) async {
    try{
      var result = await userCollection.insertOne(data.toJson());
      if(result.isSuccess) {
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