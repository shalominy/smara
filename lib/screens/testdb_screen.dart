// import 'package:education_app/constants/color.dart';
// import 'package:education_app/dbHelper/mongodb.dart';
// import 'package:education_app/dbHelper/userprovider.dart';
// import 'package:education_app/models/users_modeltemporary.dart';
// import 'package:education_app/routes/route_helper.dart';
// import 'package:education_app/widgets/custom_icon_button.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mongo_dart/mongo_dart.dart' as m;
import 'package:provider/provider.dart';

import '../constants/color.dart';
import '../dbHelper/mongodb.dart';
import '../dbHelper/userprovider.dart';
import '../models/assignstudent_model.dart';
import '../models/coursework_model.dart';
import '../models/student_model.dart';
import '../models/users_modeltemporary.dart';
import '../routes/route_helper.dart';
import '../widgets/custom_icon_button.dart';
import 'teachercoursework_screen.dart';

class TestDbLogin extends StatefulWidget {
  const TestDbLogin({Key? key}) : super(key: key);

  @override
  _TestDb createState() => _TestDb();
}

class _TestDb extends State<TestDbLogin> {
  var username = TextEditingController();
  var password = TextEditingController();
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
                        'Login as User ',
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                    ),
                  ],
                ),
              )),
              SizedBox(
                height: 200,
              ),

              Padding(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: username,
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
                  controller: password,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
                      fontWeight: FontWeight.lerp(
                          FontWeight.w500, FontWeight.w400, 0.5),
                      overflow: TextOverflow.visible,
                    ),
                    labelText: 'Password',
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
                        // Navigator.pop(context);
                        Get.toNamed(RouteHelper.gotocontext("Register"));
                      },
                      child: Text(
                        "Register",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(color: kPrimaryColor),
                      ),
                    ),
                    CustomIconButton(
                      onTap: () {
                        MongoDatabase.login(
                            username.text, password.text, context);
                        // _insertData(studentname.text, studentid.text,
                        //     studentclass.text, studentgender!, context);
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

              // const AppBar(),
              const SizedBox(
                height: 15,
              ),
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
              SizedBox(
                height: 50,
                child: Expanded(
                    child: FutureBuilder(
                        future: MongoDatabase.getusers(),
                        builder: (context, AsyncSnapshot snapshot) {
                          if (snapshot.hasData) {
                            var totalData = snapshot.data.length;
                            print("Total users" + totalData.toString());
                            // print("All Data" + snapshot.data.toString());
                            return ListView.builder(
                                itemCount: snapshot.data.length,
                                itemBuilder: (context, index) {
                                  return UsersContainer(
                                      users: UserModelTemporary.fromJson(
                                          snapshot.data[index]));
                                });
                          } else {
                            return Center(
                              child: Text("No Data Available"),
                            );
                          }
                        })),
              ),
              // SizedBox(
              //     height: 30,
              //     child: FutureBuilder(
              //         future: MongoDatabase.getcourseworkbystudent(
              //             'UK0166'),
              //         builder: (context, AsyncSnapshot snapshot) {
              //           if (snapshot.hasData) {
              //             var totalData = snapshot.data.length;
              //             print("Total Data db" + totalData.toString());

              //             final List<Map<String, dynamic>> items =
              //                 snapshot.data!;

              //             final List<List<String>> studentsList =
              //                 items.map((map) {
              //               return map.values
              //                   .map((value) => value.toString())
              //                   .toList();
              //             }).toList();

              //             //       final List<String> itemNames =
              //             // items.map((map) => map['assigneeslist'][1] as String).toList();

              //             // print(items);
              //             // print(jsonDecode(studentsList[0][7])[1]);

              //             // print(jsonDecode(itemNames.toString()));
              //             // print(items);

              //             // AssignStudentModel.fromJson(items[0]);

              //             // AssignStudentModel assignn;

              //             // print("studentlistmap " + studentsList[0][7].toString());
              //             // String studentt = studentsList[0][7].toString();
              //             // var josndecosded = jsonDecode(studentt)[1];
              //             // // var josndecosdedtest = jsonDecode(studentt);
              //             // print("josndecosded" + josndecosded.toString());
              //             // var encodedstssring = jsonEncode(josndecosded);
              //             //   Map<String, dynamic> assigneeslistsss = jsonDecode(encodedstssring);
              //             // AssignStudentModel assignn = AssignStudentModel.fromJson(assigneeslistsss);

              //             // print("original student list" + studentsList.toString());
              //             // print("studentlistmap " + studentsList[0][7].toString());
              //             String studentt = studentsList[0][7].toString();
              //             // print("jsondecodeeverytihng" + jsonDecode(studentt).toString());
              //             // var josndecosded = jsonDecode(studentt)[1];

              //             var josndecosdedtest = jsonDecode(studentt);
              //             // print("josndecosded" + josndecosded.toString());
              //             // var encodedstssring = jsonEncode(josndecosded);
              //             //   Map<String, dynamic> assigneeslistsss = jsonDecode(encodedstssring);
              //             // AssignStudentModel assignn = AssignStudentModel.fromJson(assigneeslistsss);

              //             final List<AssignStudentModel> assigneeslist1 =
              //                 (josndecosdedtest as List).map((userData) {
              //               print("inside test" + userData.toString());

              //               var encodedstssring = jsonEncode(userData);
              //               Map<String, dynamic> assigneeslistsss =
              //                   jsonDecode(encodedstssring);

              //               // m.ObjectId id = m.ObjectId.parse("6644659a162faa9b21000000");

              //               return AssignStudentModel.fromJson(
              //                   assigneeslistsss);
              //             }).toList();

              //             return ListView.builder(
              //                 itemCount: assigneeslist1.length,
              //                 itemBuilder: (context, index) {
              //                   return CourseworkDetailsStudentContainer(
              //                       assignees: assigneeslist1[index]);
              //                 });
              //           } else {
              //             return Center(
              //               child: Text("No Data Available"),
              //             );
              //           }
              //         })),
                      SizedBox(height: 200, child: 
                      
                      FutureBuilder(
                      future: MongoDatabase.getcourseworkbystudent(
                          'UK0166'),
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          var totalData = snapshot.data.length;
                          // print("Total Data db" + totalData.toString());

                          // final List<Map<String, dynamic>> items =
                          //     snapshot.data!;

                          // final List<List<String>> studentsList =
                          //     items.map((map) {
                          //   return map.values
                          //       .map((value) => value.toString())
                          //       .toList();
                          // }).toList();

                          // String studentt = studentsList[0][7].toString();
                          // // print("jsondecodeeverytihng" + jsonDecode(studentt).toString());
                          // // var josndecosded = jsonDecode(studentt)[1];

                          // var josndecosdedtest = jsonDecode(studentt);
                          // // print("josndecosded" + josndecosded.toString());
                          // // var encodedstssring = jsonEncode(josndecosded);
                          // //   Map<String, dynamic> assigneeslistsss = jsonDecode(encodedstssring);
                          // // AssignStudentModel assignn = AssignStudentModel.fromJson(assigneeslistsss);

                          // final List<AssignStudentModel> assigneeslist1 =
                          //     (josndecosdedtest as List).map((userData) {
                          //   print("inside test" + userData.toString());

                          //   var encodedstssring = jsonEncode(userData);
                          //   Map<String, dynamic> assigneeslistsss =
                          //       jsonDecode(encodedstssring);

                          //   // m.ObjectId id = m.ObjectId.parse("6644659a162faa9b21000000");

                          //   return AssignStudentModel.fromJson(
                          //       assigneeslistsss);
                          // }).toList();

                        // var courseworks = snapshot.data.map((assigneeslist ){ return assigneeslist["assigneeslist"].map((student){ var studentt =  jsonDecode(student); AssignStudentModel studentss = AssignStudentModel.fromJson(studentt); if(studentss.student.studentid == '111'){return CourseworkModel.fromJson(assigneeslist);} }); } ).toList();
                        // List<CourseworkModel> courseworks = snapshot.data.map((assigneeslist ) =>  assigneeslist["assigneeslist"].map((student){  if(AssignStudentModel.fromJson(jsonDecode(student)).student.studentid == '111'){return CourseworkModel.fromJson(assigneeslist);} })).cast<CourseworkModel>().toList();
    //                     List<CourseworkModel> courseworks = snapshot.data
    // .map((assigneeslist) {
    //   // Filter the assigneeslist to find the student with the given id
    //   var filteredAssignees = assigneeslist["assigneeslist"].where((student) {
    //     var studentModel = AssignStudentModel.fromJson(jsonDecode(student));
    //     return studentModel.student.studentid == '111';
    //   }).toList();

    //   // If the filtered list is not empty, return the assigneeslist
    //   if (filteredAssignees.isNotEmpty) {
    //     return CourseworkModel.fromJson(assigneeslist);
    //   } else {
    //     return null;
    //   }
    // })
    // .where((assigneeslist) => assigneeslist != null) // Filter out the null values
    // .cast<CourseworkModel>() // Ensure the list is of type List<CourseworkModel>
    // .toList();

                        // final List<CourseworkModel> courseworkss =  courseworks.toList();
                          return ListView.builder(
                              // itemCount: snapshot.data.length,
                              itemCount: snapshot.data.length,
                              itemBuilder: (context, index) {
                                // return CourseworkDetailsStudentContainer(
                                //     assignees: assigneeslist1[index]);
                                return CourseworkContainer(
                              // function: widget.function,
                              coursework: 
                              // CourseworkModel.fromJson(
                              //     // snapshot.data[index]), color: _color.elementAt(int.parse(index.toString()[0])));
                                  snapshot.data[index],
                              // courseworks[index],
                              color: Colors.black);
                              });
                        } else {
                          return Center(
                            child: Text("No Data Available"),
                          );
                        }
                      })
                      ,),

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
              const SizedBox(
                height: 10,
              )
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
        padding:
            const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
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

class CourseworkDetailsStudentContainer extends StatelessWidget {
  final AssignStudentModel assignees;
  const CourseworkDetailsStudentContainer({Key? key, required this.assignees})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    print("ini assignees" + assignees.submission.toString());

    return GestureDetector(
      // onTap: () => Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //         builder: (context) => const DetailsScreen(
      //               title: "course.name",
      //             ))),
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
                columnWidths: const {
                  0: FlexColumnWidth(50),
                  1: FlexColumnWidth(20),
                  2: FlexColumnWidth(15),
                  3: FlexColumnWidth(15),
                },
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TableRow(
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                    ),
                    children: [
                      TableCell(
                        child: Text(
                          // "coursework.student.toString()",
                          "assignees.student.name",
                          textScaler: const TextScaler.linear(0.8),
                        ),
                      ),
                      TableCell(
                          child: Center(
                        child: Text(
                          // "coursework.submission",
                          "assignees.submission",
                          textScaler: const TextScaler.linear(0.8),
                        ),
                      )),
                      // TableCell(
                      //   child:
                      //    Center(child:
                      //   Text(
                      //     students.studentclass,
                      //     textScaler: const TextScaler.linear(0.8),
                      //   ),
                      //   )
                      // ),
                      // TableCell(
                      //   child:
                      //    Center(child:
                      //   Text(
                      //     students.gender,
                      //     textScaler: const TextScaler.linear(0.8),
                      //   ),
                      //   )
                      // ),
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

class CourseworkContainer extends StatelessWidget {
  // final Function function;
  final CourseworkModel coursework;
  final Color color;
  const CourseworkContainer(
      {Key? key,
      required this.coursework,
      required this.color,
      // required this.function
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () => Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //         builder: (context) => const BaseScreen())),
      onTap: () {
        // function(
        //     CourseworkListDetails(changetab: function, coursework: coursework));
        // print(coursework.id);
        // context.read<UserProvider>().setuser(users);

        // Get.toNamed(RouteHelper.getlist(users.role));
        // MongoDatabase.setuserid(users.id.toString());
        // MongoDatabase.setuserid("users.id.toString()");
      },
      child: Padding(
        padding:
            const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
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
                // child: Text(coursework.name, style: TextStyle(color: color),),
                child: Column(children: [
                  Text(coursework.name),
                  Text(coursework.content)
                ]),
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