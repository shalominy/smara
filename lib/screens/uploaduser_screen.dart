import 'dart:convert';

import 'package:crypto/crypto.dart';
// import 'package:education_app/constants/color.dart';
// import 'package:education_app/dbHelper/mongodb.dart';
// import 'package:education_app/models/users_modeltemporary.dart';
// import 'package:education_app/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mongo_dart/mongo_dart.dart' as m;

import '../constants/color.dart';
import '../dbHelper/mongodb.dart';
import '../models/users_modeltemporary.dart';
import '../widgets/custom_icon_button.dart';

class UploadUser extends StatefulWidget {
  const UploadUser({Key? key}) : super(key: key);

  @override
  _UploadUser createState() => _UploadUser();
}

class _UploadUser extends State<UploadUser> {
  var username = TextEditingController();
  var nickname = TextEditingController();
  var matric = TextEditingController();
  var password = TextEditingController();
  var useremail = TextEditingController();
  var userrole = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        body: SafeArea(
          bottom: false,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IntrinsicHeight(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10),
                  child: Stack(
                    children: [
                      Align(
                        child: Text(
                          'Upload User',
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                      ),
                      Positioned(
                        left: 0,
                        child: CustomIconButton(
                          child: const Icon(Icons.arrow_back),
                          height: 35,
                          width: 35,
                          onTap: () => Navigator.pop(context),
                        ),
                      ),
                    ],
                  ),
                )),
                const SizedBox(
                  height: 15,
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Add New User",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    controller: username,
                    decoration: const InputDecoration(
                      hintText: 'Enter Full Name',
                      hintStyle: TextStyle(fontSize: 20, color: Colors.grey),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      // labelText: "Student Transcript",
                      labelStyle: TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          // borderRadius: BorderRadius.circular(40),
                          ),
                      isDense: true,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    controller: nickname,
                    decoration: const InputDecoration(
                      hintText: 'Enter User Nickname',
                      hintStyle: TextStyle(fontSize: 20, color: Colors.grey),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      // labelText: "Student Transcript",
                      labelStyle: TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          // borderRadius: BorderRadius.circular(40),
                          ),
                      isDense: true,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    controller: matric,
                    decoration: const InputDecoration(
                      hintText: 'Enter User Matric',
                      hintStyle: TextStyle(fontSize: 20, color: Colors.grey),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      // labelText: "Student Transcript",
                      labelStyle: TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          // borderRadius: BorderRadius.circular(40),
                          ),
                      isDense: true,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    controller: password,
                    decoration: const InputDecoration(
                      hintText: 'Enter User Password',
                      hintStyle: TextStyle(fontSize: 20, color: Colors.grey),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      // labelText: "Student Transcript",
                      labelStyle: TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          // borderRadius: BorderRadius.circular(40),
                          ),
                      isDense: true,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    controller: useremail,
                    decoration: const InputDecoration(
                      hintText: 'Enter User Email',
                      hintStyle: TextStyle(fontSize: 20, color: Colors.grey),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      // labelText: "Student Transcript",
                      labelStyle: TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          // borderRadius: BorderRadius.circular(40),
                          ),
                      isDense: true,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    controller: userrole,
                    decoration: const InputDecoration(
                      hintText: 'Admin, Teacher, Student',
                      hintStyle: TextStyle(fontSize: 20, color: Colors.grey),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      // labelText: "Student Transcript",
                      labelStyle: TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          // borderRadius: BorderRadius.circular(40),
                          ),
                      isDense: true,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 100,
                )
              ],
            ),
          ),
        ),
        bottomSheet: BottomSheet(
          onClosing: () {},
          backgroundColor: Colors.white,
          enableDrag: false,
          builder: (context) {
            return SizedBox(
              height: 80,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(
                        fixedSize: const Size(150, 45),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Cancel",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(color: kPrimaryColor),
                      ),
                    ),
                    CustomIconButton(
                      onTap: () {
                        _insertDataUser(username.text, nickname.text,matric.text,useremail.text,
                            userrole.text, context, password.text);
                        // // _insertDataUser(
                        // //     username.text, useremail.text, userrole.text);

                        // _insertCoursework(
                        //     teacherid,
                        //     coursetype!,
                        //     courseworkname.text,
                        //     assigneddate!,
                        //     duedate!,
                        //     assigneestype!,
                        //     assignees,
                        //     courseworkcontent.text);
                        // // _insertCoursework(coursetype, courseworkname.text, assinggn, sdsd, sssss, assignees, courseworkcontent.text);
                        // print("submit pressed");
                      },
                      color: kPrimaryColor,
                      height: 45,
                      width: 150,
                      child: const Text(
                        "Submit",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Future<void> _insertDataUser(
    String username,
    String nickname,
    String matric,
    String useremail,
    String userrole,
    BuildContext context,
    String password,
  ) async {
    var _id = m.ObjectId();
    var bytes = utf8.encode(password); // data being hashed
    var digest = sha1.convert(bytes);
    final data = UserModelTemporary(
        id: _id,
        name: username,
        nickname: nickname,
        matric: matric,
        emel: useremail,
        role: userrole,
        password: digest.toString(),
        children: []
        );
    await MongoDatabase.insertusertemporary(data);

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Inserted User" + _id.oid),
    ));
    Navigator.pop(context);
  }
}
