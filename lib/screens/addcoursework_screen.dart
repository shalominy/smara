// import 'package:education_app/constants/color.dart';
// import 'package:education_app/models/course.dart';
// import 'package:education_app/dbHelper/mongodb.dart';
import 'package:education_app/constants/color.dart';
import 'package:education_app/dbHelper/mongodb.dart';
import 'package:education_app/models/student_model.dart';
import 'package:education_app/models/users_modeltemporary.dart';
// import 'package:education_app/models/studentlist.dart';
import 'package:education_app/screens/details_screen.dart';
import 'package:education_app/widgets/checkbox.dart';
// import 'package:education_app/widgets/circle_button.dart';
import 'package:education_app/widgets/custom_icon_button.dart';
import 'package:education_app/widgets/search_testfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mongo_dart/mongo_dart.dart' as m;


class AddCoursework extends StatefulWidget {
  const AddCoursework({Key? key}) : super(key: key);

  @override
  _AddCoursework createState() => _AddCoursework();
}

class _AddCoursework extends State<AddCoursework> {

  var username = TextEditingController();
  var useremail = TextEditingController();
  var userrole = TextEditingController();

  List<DropdownMenuItem<String>> get dropdownItems{
  List<DropdownMenuItem<String>> menuItems = [
    const DropdownMenuItem(child: Text("USA"),value: "USA"),
    const DropdownMenuItem(child: Text("Canada"),value: "Canada"),
    const DropdownMenuItem(child: Text("Brazil"),value: "Brazil"),
    const DropdownMenuItem(child: Text("England"),value: "England"),
  ];
  return menuItems;
}

bool _isSelected = false;

String selectedValue = "USA";

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
                        'Add Coursework',
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
                    // Scaffold(
                    //     body: SafeArea(
                    //         child: FutureBuilder(
                    //             future: MongoDatabase.getstudents(),
                    //             builder: (context, AsyncSnapshot snapshot) {
                    //               if (snapshot.hasData) {
                    //                 var totalData = snapshot.data.length;
                    //                 print("Total Data" + totalData.toString());
                    //                 return ListView.builder(
                    //                     itemCount: snapshot.data.length,
                    //                     itemBuilder: (context, index) {
                    //                       return StudentCard(
                    //                           StudentModel.fromJson(
                    //                               snapshot.data[index]));
                    //                     });
                    //               } else {
                    //                 return Center(
                    //                   child: Text("No Data Available"),
                    //                 );
                    //               }
                    //             })))
                  ],
                ),
              )
                  // Stack(
                  //   children: [
                  //     Align(
                  //       child: Text(
                  //         'Student List',
                  //         style: Theme.of(context).textTheme.displayMedium,
                  //       ),
                  //     ),

                  //     Positioned(
                  //       left: 0,
                  //       child: CustomIconButton(
                  //         child: const Icon(Icons.arrow_back),
                  //         height: 35,
                  //         width: 35,
                  //         onTap: () => Navigator.pop(context),
                  //       ),
                  //     ),

                  //   ],
                  // ),
                  ),

              // const AppBar(),
              const SizedBox(
                height: 15,
              ),
              // const AppBar(),
              const SizedBox(
                height: 10,
              ),
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
              //         future: MongoDatabase.getstudents(),
              //         builder: (context, AsyncSnapshot snapshot) {
              //           if (snapshot.hasData) {
              //             var totalData = snapshot.data.length;
              //             print("Total Data" + totalData.toString());
              //             return ListView.builder(
              //                 itemCount: snapshot.data.length,
              //                 itemBuilder: (context, index) {
              //                   return StudentContainer2(
              //                       students: StudentModel.fromJson(
              //                           snapshot.data[index]));
              //                 });
              //           } else {
              //             return Center(
              //               child: Text("No Data Available"),
              //             );
              //           }
              //         }))
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
            padding: const EdgeInsets.all(10), child: 
          DropdownButtonFormField(
                style:  TextStyle(fontSize: 20, color: Colors.grey, fontWeight: FontWeight.lerp(FontWeight.w500, FontWeight.w400, 0.5),),
                decoration: const InputDecoration(
                hintText: 'Admin, Teacher, Student',
                hintStyle: TextStyle(fontSize: 20, color: Colors.grey),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                // labelText: "Student Transcript",
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                    // borderRadius: BorderRadius.circular(40),
                    ),
                isDense: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1),
                    // borderRadius: BorderRadius.circular(20),
                  ),
                  // border: OutlineInputBorder(
                  //   borderSide: BorderSide(color: Colors.black, width: 1),
                  //   // borderRadius: BorderRadius.circular(20),
                  // ),
                  // filled: true,
                  // fillColor: Colors.white,
                ),
                dropdownColor: Colors.white,
                value: selectedValue,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedValue = newValue!;
                  });
                },
                items: dropdownItems),
                ),
                LabeledCheckbox(
          label: 'Ahmad Ameerul Rasyid',
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          value: _isSelected,
          onChanged: (bool newValue) {
            setState(() {
              _isSelected = newValue;
            });
          },
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
                    // _insertDataUser( 
                    //     username.text, useremail.text, userrole.text);
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
        ),
      ),
      // ),
    );
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

class StudentContainer2 extends StatelessWidget {
  final StudentModel students;
  const StudentContainer2({Key? key, required this.students}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const DetailsScreen(
                    title: "course.name",
                  ))),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        // padding: const EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ClipRRect(
            //   borderRadius: BorderRadius.circular(10),
            //   child: Image.asset(
            //     course.thumbnail,
            //     height: 60,
            //   ),
            // ),
            // const SizedBox(
            //   width: 10,
            // ),

            Expanded(
              child: Table(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TableRow(
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                    ),
                    children: [
                      TableCell(
                        child: Text(
                          students.name,
                          textScaler: const TextScaler.linear(0.8),
                        ),
                      ),
                      TableCell(
                        child: Text(
                          students.studentid,
                          textScaler: const TextScaler.linear(0.8),
                        ),
                      ),
                      TableCell(
                        child: Text(
                          students.studentclass,
                          textScaler: const TextScaler.linear(0.8),
                        ),
                      ),
                      TableCell(
                        child: Text(
                          students.grade,
                          textScaler: const TextScaler.linear(0.8),
                        ),
                      ),
                      TableCell(
                        child: Text(
                          students.transcript,
                          textScaler: const TextScaler.linear(0.8),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TableHeader extends StatelessWidget {
  const TableHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child:
          // Padding(
          // padding: const EdgeInsets.all(15.0),
          // child:
          Table(
        border: TableBorder.all(color: Colors.white30),
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: const [
          TableRow(
            decoration: BoxDecoration(
              color: Colors.redAccent,
            ),
            children: [
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Name',
                    textScaler: TextScaler.linear(0.8),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Id',
                    textScaler: TextScaler.linear(0.8),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Class',
                    textScaler: TextScaler.linear(0.8),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Grade',
                    textScaler: TextScaler.linear(0.8),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Padding(
                  padding: EdgeInsets.all(0),
                  child: Text(
                    'Transcript',
                    textScaler: TextScaler.linear(0.8),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ],
        // )
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
      padding: const EdgeInsets.only(top: 10, left: 7, right: 7),
      // padding: const EdgeInsets.only(left: 20, right: 20),
      height: 100,
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
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
                "Search Students",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              // CircleButton(
              //   icon: Icons.notifications,
              //   onPressed: () {},
              // ),
            ],
          ),
          const SizedBox(
            height: 3,
          ),
          const SearchTextFieldPlacehold(placeholder: "Search Student")
        ],
      ),
    );
  }
}
