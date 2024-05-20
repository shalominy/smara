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
import 'package:provider/provider.dart';
import 'package:smart_hub/models/coursework_model.dart';
import 'package:smart_hub/models/studentlist.dart';
import 'package:smart_hub/screens/teacherbase_screen.dart';
import 'package:smart_hub/screens/teachercoursework_screen.dart';
import 'package:smart_hub/widgets/alerttextfieldform.dart';

import '../constants/color.dart';
import '../dbHelper/mongodb.dart';
import '../dbHelper/userprovider.dart';
import '../models/assignstudent_model.dart';
import '../models/users_modeltemporary.dart';
import '../routes/route_helper.dart';
import '../widgets/custom_icon_button.dart';
import '../widgets/selectmongodbdata.dart';
import 'package:collection/collection.dart';

class AddFeedback extends StatefulWidget {
  // final CourseworkModel coursework;
  const AddFeedback({
    Key? key,
  }) : super(key: key);

  @override
  _AddFeedback createState() => _AddFeedback();
}

class _AddFeedback extends State<AddFeedback> {
  var username = TextEditingController();
  var password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final CourseworkModel coursework = Get.arguments as CourseworkModel;
    // print(coursework.toString());
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
              Padding(
                padding: EdgeInsets.all(10),
                child: Stack(
                  children: [
                    const Align(
                      child: Text(
                        'Coursework Feedback',
                        // style: Theme.of(context).textTheme.displayMedium,
                      ),
                    ),
                    Positioned(
                      left: 0,
                      child: CustomIconButton(
                          child: const Icon(Icons.arrow_back),
                          height: 35,
                          width: 35,
                          onTap: () {
                            // .changetab(CourseworkList(function: widget.changetab)),
                            Navigator.pop(context);
                          }),
                    ),
                  ],
                ),
              ),
              // SizedBox(height: 200,),

              //   Padding(
              //   padding: const EdgeInsets.all(10),
              //   child: TextField(
              //     controller: username,
              //     decoration: InputDecoration(
              //       labelStyle: TextStyle(
              //         fontSize: 20,
              //         color: Colors.grey,
              //         fontWeight: FontWeight.lerp(
              //             FontWeight.w500, FontWeight.w400, 0.5),
              //         overflow: TextOverflow.visible,
              //       ),
              //       labelText: 'Enter Student Name',
              //       border: const OutlineInputBorder(),
              //       floatingLabelStyle: TextStyle(
              //         fontSize: 20,
              //         color: Colors.black,
              //         fontWeight: FontWeight.lerp(
              //             FontWeight.w500, FontWeight.w400, 0.5),
              //         overflow: TextOverflow.visible,
              //       ),
              //     ),
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.all(10),
              //   child: TextField(
              //     controller: password,
              //     decoration: InputDecoration(
              //       labelStyle: TextStyle(
              //         fontSize: 20,
              //         color: Colors.grey,
              //         fontWeight: FontWeight.lerp(
              //             FontWeight.w500, FontWeight.w400, 0.5),
              //         overflow: TextOverflow.visible,
              //       ),
              //       labelText: 'Password',
              //       border: const OutlineInputBorder(),
              //       floatingLabelStyle: TextStyle(
              //         fontSize: 20,
              //         color: Colors.black,
              //         fontWeight: FontWeight.lerp(
              //             FontWeight.w500, FontWeight.w400, 0.5),
              //         overflow: TextOverflow.visible,
              //       ),
              //     ),
              //   ),
              // ),
              // SizedBox(height: 25,),

              // Expanded(
              //   child: FutureBuilder(
              //       future: MongoDatabase.getusers(),
              //       builder: (context, AsyncSnapshot snapshot) {
              //         if (snapshot.hasData) {
              //           var totalData = snapshot.data.length;
              //           print("Total Data" + totalData.toString());
              //           // print("All Data" + snapshot.data.toString());
              //           return ListView.builder(
              //               itemCount: snapshot.data.length,
              //               itemBuilder: (context, index) {
              //                 return StudentContainer(
              //                     users: UserModelTemporary.fromJson(
              //                         snapshot.data[index]));
              //               });

              //         } else {
              //           return Center(
              //             child: Text("No Data Available"),
              //           );
              //         }
              //       })),

              Expanded(
                child: FutureBuilder(
                    future: MongoDatabase.getstudentbycoursework(coursework.id),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        var totalData = snapshot.data.length;
                        print("Total Data" + totalData.toString());

                        final List<Map<String, dynamic>> items = snapshot.data!;

                        final List<List<String>> studentsList =
                            items.map((map) {
                          return map.values
                              .map((value) => value.toString())
                              .toList();
                        }).toList();

                        // final List<String> itemNames = items
                        //     .map((map) => map['assigneeslist'][1] as String)
                        //     .toList();

                        // print(items);
                        // print(jsonDecode(studentsList[0][7])[1]);

                        String studentt = studentsList[0][7].toString();

                        var listofassignees = jsonDecode(studentt);

                        final List<AssignStudentModel> assigneeslist =
                            (listofassignees as List).map((userData) {
                          print("inside test" + userData.toString());

                          var encodedstssring = jsonEncode(userData);
                          Map<String, dynamic> assigneeslistsss =
                              jsonDecode(encodedstssring);

                          print("inside test 32" + userData.toString());

                          // m.ObjectId id = m.ObjectId.parse("6644659a162faa9b21000000");

                          return AssignStudentModel.fromJson(assigneeslistsss);
                        }).toList();

                        return ListView.builder(
                            itemCount: assigneeslist.length,
                            itemBuilder: (context, index) {
                              return AssigneesContainer(
                                  coursework: coursework,
                                  assigneeslist: assigneeslist,
                                  assignees: assigneeslist[index]);
                              // coursework: AssignStudentModel.fromJson(
                            });
                      } else {
                        return Center(
                          child: Text("No Data Available"),
                        );
                      }
                    }),
              ),

              const SizedBox(
                height: 80,
              )
            ],
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
                    Expanded(
                      child: CustomIconButton(
                        onTap: () {
                          print("back!");

                          Navigator.pop(context);
                        },
                        // color: kPrimaryColor,
                        // color: Colors.white,
                        height: 45,
                        width: 150,
                        child: const Text(
                          "Back to Home ",
                          style: TextStyle(
                            // color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
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

class AssigneesContainer extends StatelessWidget {
  // final List<List<String>> assigneeslist;
  // final items;
  final CourseworkModel coursework;
  final List<AssignStudentModel> assigneeslist;
  final AssignStudentModel assignees;
  const AssigneesContainer({
    Key? key,
    required this.assignees,
    required this.assigneeslist,
    required this.coursework,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var feedbackheader = TextEditingController();
    var feedbackcontent = TextEditingController();
    // final List<List<String>> assigneeslisttipu2 = assigneeslist;

    // var studenttt1 = jsonDecode(assigneeslist);
    // final List<dynamic> studenttt = studenttt1["students"];

    void _showDialogWithTextField(BuildContext context) {
      final TextEditingController _textFieldController =
          TextEditingController();

      void _cancel() {
        Navigator.pop(context);
      }

// this function is called when the Submit button is tapped
      void _submit() {
        //edit list
        // String list = items[0]['assigneeslist'].toString();
        // final Map<String, dynamic> jsondata = jsonDecode(list);

        // print(items[0]['assigneeslist'].toString());
        // print(jsonDecode(items));
        // var jsondecode = jsonDecode(items);
// Map<String, dynamic> assigneeslistsss = jsonDecode(assignstudentModelToJson(assignees));

        // List<AssignStudentModel> jsonn = List<AssignStudentModel>.from(jsondecode.map((e) => AssignStudentModel.fromJson(e)));
        // var decode = jsonDecode(list);
        // var encode = jsonEncode(decode);
        // jsondecode.removeWhere((element) => element["student"] == AssignStudentModel.fromJson(assigneeslistsss));
        assigneeslist.removeWhere((element) =>
            element.student.studentid == assignees.student.studentid);
        // jsondecode.removeWhere((element) => element["student"] == '{_id: 6643642e925aba0f6c000000, name: AHMAD RAYYAN BIN MOHD FAIZAL, studentid: UK0192, studentclass: T1, gender: M}');
        // jsondecode.removeWhere((element) => element["submission"] == 'ASSIGNED');
        AssignStudentModel updateddata = AssignStudentModel(
            student: assignees.student,
            submission: "CHECKED",
            feedback: feedbackheader.text + " " + feedbackcontent.text);
        assigneeslist.add(updateddata);
        // print(assigneeslist);
        // print(assignstudentModelToJson(assigneeslist[0]));
        // print(assignstudentModelToJson(assigneeslist[1]));

        final List<String> studentfeedbackstatus =
            assigneeslist.map((userData) {
          return assignstudentModelToJson(userData);
        }).toList();

        MongoDatabase.updatecourseworkfeedback(
            studentfeedbackstatus, coursework, context);

        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const TeacherBaseScreen()));

        RouteHelper.navigateTo(RouteHelper.teacheraddfeedback,
            arguments: coursework);

        // MongoDatabase.updatecourseworkfeedback(updateddata as);

        // print("studenttt" + studenttt.toString());
        // print(studenttt1.toString());
        // studenttt.removeWhere((element) => element["studentid"] == assignees.student.id);
        // assigneeslisttipu2.removeWhere((item) => const ListEquality().equals(item, (assignees as List<String>)));
        // print(assigneeslisttipu2[0][7]);
        // final Map<String, dynamic> assigneess = jsonDecode(assigneeslist);
        // print(assignstudentModelToJson(assignees));
        // print("this "+assigneeslistsss.toString());
        //submit db modify list assigneeslist for coursework
      }

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Submit Feedback'),
            content: Column(
              children: [
                TextField(
                  // expands: true,
                  textAlignVertical: TextAlignVertical.top,
                  maxLines: null,
                  controller: feedbackheader,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
                      fontWeight: FontWeight.lerp(
                          FontWeight.w500, FontWeight.w400, 0.5),
                      overflow: TextOverflow.visible,
                    ),
                    labelText: 'Content One',
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
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 100,
                  child: TextField(
                    expands: true,
                    textAlignVertical: TextAlignVertical.top,
                    maxLines: null,
                    controller: feedbackcontent,
                    decoration: InputDecoration(
                      labelStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.grey,
                        fontWeight: FontWeight.lerp(
                            FontWeight.w500, FontWeight.w400, 0.5),
                        overflow: TextOverflow.visible,
                      ),
                      labelText: 'Content Two',
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
                //  TextField(
                //   controller: _textFieldController,
                //   decoration: InputDecoration(hintText: "Type something here"),
                // ),
                // TextField(
                //   controller: _textFieldController,
                //   decoration: InputDecoration(hintText: "Type something here"),
                // ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: _cancel,
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: _submit,
                child: const Text('Submit'),
              ),
            ],
          );
        },
      );
    }

    return GestureDetector(
      // onTap: () => Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //         builder: (context) => const BaseScreen())),
      onTap: () {
        // MongoDatabase.getstudents(context);
        // context.read<UserProvider>().setuser(users);

        // Get.toNamed(RouteHelper.gotocontext(users.role));
        _showDialogWithTextField(context);
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
                child: Text(assignees.student.name +
                    " (" +
                    assignees.submission +
                    ")" +
                    assignees.feedback),
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
