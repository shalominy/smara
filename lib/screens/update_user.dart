// import 'package:education_app/constants/color.dart';
//import 'package:education_app/constants/size.dart';

import 'package:education_app/constants/color.dart';
import 'package:education_app/dbHelper/mongodb.dart';
import 'package:education_app/models/category.dart';
// import 'package:education_app/models/student_model.dart';
import 'package:education_app/models/users_modeltemporary.dart';
import 'package:education_app/routes/route_helper.dart';
//import 'package:education_app/screens/course_screen.dart';
// import 'package:education_app/screens/studentlist_screen.dart';
// import 'package:education_app/screens/teacherlist_screen.dart';
//import 'package:education_app/screens/details_screen.dart';
import 'package:education_app/widgets/circle_button.dart';
import 'package:education_app/widgets/custom_icon_button.dart';
// import 'package:education_app/widgets/input_textfield.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/search_testfield.dart';
import 'package:get/get.dart';
import 'package:mongo_dart/mongo_dart.dart' as m;

class UpdateUser extends StatefulWidget {
  const UpdateUser({Key? key}) : super(key: key);

  @override
  _UpdateUser createState() => _UpdateUser();
}

class _UpdateUser extends State<UpdateUser> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: Column(
          children: [
            const AppBar(),
            Body(),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class Body extends StatelessWidget {
  Body({Key? key}) : super(key: key);
  var username = TextEditingController();
  var useremail = TextEditingController();
  var userrole = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Create User",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                // TextButton(
                //   onPressed: () {},
                //   child: Text(
                //     "See All",
                //     style: Theme.of(context)
                //         .textTheme
                //         .bodyMedium
                //         ?.copyWith(color: kPrimaryColor),
                //   ),
                // )
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Align(
            child: Text(
              "User Information",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          // Text(
          //   "Student Information",
          //   style: Theme.of(context).textTheme.bodyMedium,
          // ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              controller: username,
              decoration: const InputDecoration(
                hintText: 'Enter User Name',
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
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Text(
                //   "Update Student",
                //   style: Theme.of(context).textTheme.bodyLarge,
                // ),
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
                    _insertDataUser(
                        username.text, useremail.text, userrole.text);
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
        ],
      ),
    );
  }

  Future<void> _insertDataUser(
    String username,
    String useremail,
    String userrole,
  ) async {
    var _id = m.ObjectId();
    final data = UserModelTemporary(
        id: _id, name: username, emel: useremail, role: userrole);
    await MongoDatabase.insertusertemporary(data);

    // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Inserted ID" + _id.oid),));
    _clearAll();
  }

  void _clearAll() {
    username.text = "";
    useremail.text = "";
    userrole.text = "";
  }
}

class CategoryCard extends StatelessWidget {
  final Categorylist category;
  const CategoryCard({
    Key? key,
    required this.category,
  }) : super(key: key);

  // int _selectedIndex = 0;

  // static const List<Widget> _widgetOptions = <Widget>[
  //   StudentListScreen(),
  //   TeacherListScreen(),
  // ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () => Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     // builder: (context) => const CourseScreen(),
      //     //builder: (context) => const StudentListScreen(category.kategori),
      //   ),
      // ),
      onTap: () {
        Get.toNamed(RouteHelper.getlist(category.kategori));
      },
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
              child: Text(category.name),
            ),
            // Text(
            //   "${category.noOfCourses.toString()} courses",
            //   style: Theme.of(context).textTheme.bodySmall,
            // ),
          ],
        ),
      ),
    );
  }
}

class AppBar extends StatelessWidget {
  const AppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
      height: 200,
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.1, 0.5],
          colors: [
            Color(0xff886ff2),
            Color(0xff6849ef),
          ],
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hello,\nGood Morning",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              CircleButton(
                icon: Icons.notifications,
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const SearchTextFieldPlacehold(
            placeholder: "",
          )
        ],
      ),
    );
  }
}
