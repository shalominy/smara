import 'dart:convert';

import 'package:crypto/crypto.dart';
// import 'package:education_app/constants/color.dart';
// import 'package:education_app/dbHelper/mongodb.dart';
// import 'package:education_app/models/student_model.dart';
// import 'package:education_app/models/users_modeltemporary.dart';
// import 'package:education_app/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mongo_dart/mongo_dart.dart' as m;

import '../constants/color.dart';
import '../dbHelper/mongodb.dart';
import '../models/student_model.dart';
import '../models/users_modeltemporary.dart';
import '../widgets/custom_icon_button.dart';

class UploadStudent extends StatefulWidget {
  const UploadStudent({Key? key}) : super(key: key);

  @override
  _UploadStudent createState() => _UploadStudent();
}

class _UploadStudent extends State<UploadStudent> {
  var studentname = TextEditingController();
  var studentid = TextEditingController();
  var studentclass = TextEditingController();
  var studentgrade = TextEditingController();
  var studenttranscript = TextEditingController();
  String? studentgender;

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
                          'Upload Student',
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
                        "Add New Student",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: studentname,
                    decoration: InputDecoration(
                      labelStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.grey,
                        fontWeight: FontWeight.lerp(
                            FontWeight.w500, FontWeight.w400, 0.5),
                        overflow: TextOverflow.visible,
                      ),
                      labelText: 'Enter Student Name',
                      border: const OutlineInputBorder(),
                      floatingLabelStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.lerp(
                            FontWeight.w500, FontWeight.w400, 0.5),
                        overflow: TextOverflow.visible,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: studentid,
                    decoration: InputDecoration(
                      labelStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.grey,
                        fontWeight: FontWeight.lerp(
                            FontWeight.w500, FontWeight.w400, 0.5),
                        overflow: TextOverflow.visible,
                      ),
                      labelText: 'Enter Student ID',
                      border: const OutlineInputBorder(),
                      floatingLabelStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.lerp(
                            FontWeight.w500, FontWeight.w400, 0.5),
                        overflow: TextOverflow.visible,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: studentclass,
                    decoration: InputDecoration(
                      labelStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.grey,
                        fontWeight: FontWeight.lerp(
                            FontWeight.w500, FontWeight.w400, 0.5),
                        overflow: TextOverflow.visible,
                      ),
                      labelText: 'Enter Student Class',
                      border: const OutlineInputBorder(),
                      floatingLabelStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.lerp(
                            FontWeight.w500, FontWeight.w400, 0.5),
                        overflow: TextOverflow.visible,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: DropdownButtonFormField(
                    value: studentgender,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.lerp(
                          FontWeight.w500, FontWeight.w400, 0.5),
                      overflow: TextOverflow.visible,
                    ),
                    decoration: InputDecoration(
                      hintText: "Male / Female",
                      hintStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.grey,
                        fontWeight: FontWeight.lerp(
                            FontWeight.w500, FontWeight.w400, 0.5),
                        overflow: TextOverflow.visible,
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      // labelText: "Student Transcript",
                      // filled: true,
                      // fillColor: Colors.white,
                      border: const OutlineInputBorder(
                          // borderRadius: BorderRadius.circular(40),
                          ),
                      // isDense: true,
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1),
                        // borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    isExpanded:
                        true, // Ensure the dropdown opens below the button
                    items: const [
                      DropdownMenuItem(
                        value: "M",
                        child: Text("Male"),
                      ),
                      DropdownMenuItem(
                        value: "F",
                        child: Text("Female"),
                      ),
                      // Add more items as needed
                    ],
                    onChanged: (value) {
                      studentgender = value.toString();
                      // coursetype = value.toString();
                      // Handle the selected value
                    },
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
                        _insertData(studentname.text, studentid.text,
                            studentclass.text, studentgender!, context);
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

  Future<void> _insertData(String studentName, String studentId,
      String studentClass, String studentGender, BuildContext context) async {
    var _id = m.ObjectId();
    final data = StudentModel(
        id: _id,
        name: studentName,
        studentid: studentId,
        studentclass: studentClass,
        gender: studentGender);
    await MongoDatabase.insertstudent(data);

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Inserted ID" + _id.oid),
    ));
    Navigator.pop(context);
  }

  Future<void> _insertDataUser(
    String username,
    String useremail,
    String userrole,
    BuildContext context,
    String password,
  ) async {
    var _id = m.ObjectId();
    var bytes = utf8.encode(password); // data being hashed
    var digest = sha1.convert(bytes);
    final data = UserModelTemporary(
        id: _id, name: username, emel: useremail, role: userrole, password: digest.toString());
    await MongoDatabase.insertusertemporary(data);

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Inserted User" + _id.oid),
    ));
    Navigator.pop(context);
  }
}
