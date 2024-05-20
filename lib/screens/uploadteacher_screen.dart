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
import 'package:smart_hub/models/teacher_model.dart';

import '../constants/color.dart';
import '../dbHelper/mongodb.dart';
import '../models/student_model.dart';
import '../models/users_modeltemporary.dart';
import '../widgets/custom_icon_button.dart';

class UploadTeacher extends StatefulWidget {
  const UploadTeacher({Key? key}) : super(key: key);

  @override
  _UploadTeacher createState() => _UploadTeacher();
}

class _UploadTeacher extends State<UploadTeacher> {
  var teachername = TextEditingController();
  var teachernickname = TextEditingController();
  var teacherid = TextEditingController();
  // var studentclass = TextEditingController();
  // var studentgrade = TextEditingController();
  // var studenttranscript = TextEditingController();
  // String? studentgender;

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
                          'Upload Teacher',
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
                        "Add New Teacher",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: teachername,
                    decoration: InputDecoration(
                      labelStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.grey,
                        fontWeight: FontWeight.lerp(
                            FontWeight.w500, FontWeight.w400, 0.5),
                        overflow: TextOverflow.visible,
                      ),
                      labelText: 'Enter Teacher Name',
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
                    controller: teachernickname,
                    decoration: InputDecoration(
                      labelStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.grey,
                        fontWeight: FontWeight.lerp(
                            FontWeight.w500, FontWeight.w400, 0.5),
                        overflow: TextOverflow.visible,
                      ),
                      labelText: 'Enter Teacher Nickname',
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
                    controller: teacherid,
                    decoration: InputDecoration(
                      labelStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.grey,
                        fontWeight: FontWeight.lerp(
                            FontWeight.w500, FontWeight.w400, 0.5),
                        overflow: TextOverflow.visible,
                      ),
                      labelText: 'Enter Teacher Id',
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
                // Padding(
                //   padding: const EdgeInsets.all(10),
                //   child: DropdownButtonFormField(
                //     value: studentgender,
                //     style: TextStyle(
                //       fontSize: 20,
                //       color: Colors.black,
                //       fontWeight: FontWeight.lerp(
                //           FontWeight.w500, FontWeight.w400, 0.5),
                //       overflow: TextOverflow.visible,
                //     ),
                //     decoration: InputDecoration(
                //       hintText: "Male / Female",
                //       hintStyle: TextStyle(
                //         fontSize: 20,
                //         color: Colors.grey,
                //         fontWeight: FontWeight.lerp(
                //             FontWeight.w500, FontWeight.w400, 0.5),
                //         overflow: TextOverflow.visible,
                //       ),
                //       floatingLabelBehavior: FloatingLabelBehavior.never,
                //       // labelText: "Student Transcript",
                //       // filled: true,
                //       // fillColor: Colors.white,
                //       border: const OutlineInputBorder(
                //           // borderRadius: BorderRadius.circular(40),
                //           ),
                //       // isDense: true,
                //       enabledBorder: const OutlineInputBorder(
                //         borderSide: BorderSide(color: Colors.black, width: 1),
                //         // borderRadius: BorderRadius.circular(20),
                //       ),
                //     ),
                //     isExpanded:
                //         true, // Ensure the dropdown opens below the button
                //     items: const [
                //       DropdownMenuItem(
                //         value: "M",
                //         child: Text("Male"),
                //       ),
                //       DropdownMenuItem(
                //         value: "F",
                //         child: Text("Female"),
                //       ),
                //       // Add more items as needed
                //     ],
                //     onChanged: (value) {
                //       studentgender = value.toString();
                //       // coursetype = value.toString();
                //       // Handle the selected value
                //     },
                //   ),
                // ),
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
                        _insertData(teachername.text, teachernickname.text,
                            teacherid.text, context);
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

  Future<void> _insertData(String teachername, String teachernickname,
      String teacherid, BuildContext context) async {
    var _id = m.ObjectId();
    final data = TeacherModel(
        id: _id,
        name: teachername,
        nickname: teachernickname,
        teacherid: teacherid,
        );
    await MongoDatabase.insertteacher(data);

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Inserted Teacher " + _id.oid),
    ));
    Navigator.pop(context);
  }

  // Future<void> _insertDataUser(
  //   String username,
  //   String matric,
  //   String useremail,
  //   String userrole,
  //   BuildContext context,
  //   String password,
  // ) async {
  //   var _id = m.ObjectId();
  //   var bytes = utf8.encode(password); // data being hashed
  //   var digest = sha1.convert(bytes);
  //   final data = UserModelTemporary(
  //       id: _id,
  //       name: username,
  //       matric: matric,
  //       emel: useremail,
  //       role: userrole,
  //       password: digest.toString());
  //   await MongoDatabase.insertusertemporary(data);

  //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //     content: Text("Inserted User" + _id.oid),
  //   ));
  //   Navigator.pop(context);
  // }
}
