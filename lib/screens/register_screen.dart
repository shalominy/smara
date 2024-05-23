import 'dart:convert';

import 'package:crypto/crypto.dart';
// import 'package:education_app/constants/color.dart';
// import 'package:education_app/dbHelper/mongodb.dart';
// import 'package:education_app/dbHelper/userprovider.dart';
// import 'package:education_app/models/users_modeltemporary.dart';
// import 'package:education_app/routes/route_helper.dart';
// import 'package:education_app/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mongo_dart/mongo_dart.dart' as m;
import 'package:provider/provider.dart';

import '../constants/color.dart';
import '../dbHelper/mongodb.dart';
import '../dbHelper/userprovider.dart';
import '../models/users_modeltemporary.dart';
import '../routes/route_helper.dart';
import '../widgets/custom_icon_button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreen createState() => _RegisterScreen();
}

class _RegisterScreen extends State<RegisterScreen> {
  var fullname = TextEditingController();
  var nickname = TextEditingController();
  var matric = TextEditingController();
  var password = TextEditingController();
  var useremail = TextEditingController();
  // var userrole = TextEditingController();
  var secretcode = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return //Scaffold(body: SafeArea(child: FutureBuilder(future: MongoDatabase.getstudents(), builder: (, Asyncsnapshot snapshot) )))
        AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        body: SafeArea(
          bottom: false,
          child:
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 10),
              //   child:
SingleChildScrollView(child: 
              Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IntrinsicHeight(
                  child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: Stack(
                  children: [
                    Align(
                      child: Text(
                        'Register',
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                    ),
                  ],
                ),
              )),
              SizedBox(
                height: 80,
              ),

              Padding(
                padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Register as User",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  controller: fullname,
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
                    hintText: 'Enter Nickname',
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
              // Padding(
              //   padding: const EdgeInsets.all(10),
              //   child: TextFormField(
              //     controller: userrole,
              //     decoration: const InputDecoration(
              //       hintText: 'Admin, Teacher, Student',
              //       hintStyle: TextStyle(fontSize: 20, color: Colors.grey),
              //       floatingLabelBehavior: FloatingLabelBehavior.never,
              //       // labelText: "Student Transcript",
              //       labelStyle: TextStyle(color: Colors.grey),
              //       filled: true,
              //       fillColor: Colors.white,
              //       border: OutlineInputBorder(
              //           // borderRadius: BorderRadius.circular(40),
              //           ),
              //       isDense: true,
              //     ),
              //   ),
              // ),

              SizedBox(
                height: 25,
              ),

              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  controller: secretcode,
                  decoration: const InputDecoration(
                    hintText: 'Secret Code',
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
              SizedBox(
                height: 25,
              ),
              Padding(
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
                        // MongoDatabase.login(username.text, password.text, context);

                        _userregister(
                            fullname.text,
                            nickname.text,
                            matric.text,
                            password.text,
                            useremail.text,
                            // userrole.text,
                            secretcode.text,
                            context);
                      },
                      color: kPrimaryColor,
                      height: 45,
                      width: 150,
                      child: const Text(
                        "Register",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // const AppBar(),
              const SizedBox(
                height: 80,
              ),
              // const SizedBox(
              //   height: 10,
              // ),
              // const TableHeader(),

              // Expanded(
              //   child: ListView.separated(
              //     padding: const EdgeInsets.symmetric(
              //       vertical: 3,
              //     ),
              //     separatorBuilder: (_, __) {
              //       return const SizedBox(
              //         height: 2,
              //       );
              //     },
              //     // shrinkWrap: true,
              //     itemBuilder: (_, int index) {
              //       return StudentContainer(
              //         students: students[index],
              //       );
              //     },
              //     itemCount: students.length,
              //   ),
              // ),
              // Expanded(
              //     child: FutureBuilder(
              //         future: MongoDatabase.getusers(),
              //         builder: (context, AsyncSnapshot snapshot) {
              //           if (snapshot.hasData) {
              //             var totalData = snapshot.data.length;
              //             print("Total Data" + totalData.toString());
              //             // print("All Data" + snapshot.data.toString());
              //             return ListView.builder(
              //                 itemCount: snapshot.data.length,
              //                 itemBuilder: (context, index) {
              //                   return UsersContainer(
              //                       users: UserModelTemporary.fromJson(
              //                           snapshot.data[index]));
              //                 });

              //           } else {
              //             return Center(
              //               child: Text("No Data Available"),
              //             );
              //           }
              //         })),

              // Expanded(
              //   child: ListView.separated(
              //     padding: const EdgeInsets.symmetric(
              //       vertical: 3,
              //     ),
              //     separatorBuilder: (_, __) {
              //       return const SizedBox(
              //         height: 2,
              //       );
              //     },
              //     // shrinkWrap: true,
              //     itemBuilder: (_, int index) {
              //       return StudentContainer(
              //         students: students[index],
              //       );
              //     },
              //     itemCount: students.length,
              //   ),
              // ),
            ],
          ),
          )
        ),
      ),
      // ),
    );
  }

  Future<void> _userregister(
    String username,
    String nickname,
    String matric,
    String password,
    String useremail,
    // String userrole,
    String secretcode,
    BuildContext context,
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
        role: "",
        password: digest.toString(),
        children: []
        );
    await MongoDatabase.userregister(secretcode, data, context);

    // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //   content: Text(" User Registered " + _id.oid),
    // ));

    // Navigator.pop(context);
    // Get.toNamed(RouteHelper.loginscreen());
  }

//   Widget StudentCard(StudentModel data) {
//     return Card(
//       child: Column(
//         children: [
//           Text(data.name),
//           Text("${data.id}"),
//         ],
//       ),
//     );
//   }
}

class UsersContainer extends StatelessWidget {
  final UserModelTemporary users;
  const UsersContainer({Key? key, required this.users}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () => Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //         builder: (context) => const BaseScreen())),
      onTap: () {
        // MongoDatabase.getstudents(context);
        context.read<UserProvider>().setuser(users);

        Get.toNamed(RouteHelper.gotocontext(users.role));
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.1),
                blurRadius: 4.0,
                spreadRadius: .05,
              ), //BoxShadow
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Align(
              //   alignment: Alignment.topRight,
              //   child: Image.asset(
              //     category.thumbnail,
              //     height: kCategoryCardImageSize,
              //   ),
              // ),
              // const SizedBox(
              //   height: 10,
              // ),
              Align(
                child: Text(users.name + " (" + users.role + ")"),
              ),
              // Text(
              //   "${category.noOfCourses.toString()} courses",
              //   style: Theme.of(context).textTheme.bodySmall,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
