// import 'package:education_app/constants/color.dart';
// import 'package:education_app/dbHelper/mongodb.dart';
// import 'package:education_app/dbHelper/userprovider.dart';
// // import 'package:education_app/constants/icons.dart';
// // import 'package:education_app/models/category.dart';
// import 'package:education_app/models/coursework.dart';
// import 'package:education_app/models/coursework_model.dart';
// import 'package:education_app/models/lesson.dart';
// // import 'package:education_app/models/users_modeltemporary.dart';
// import 'package:education_app/routes/route_helper.dart';
// import 'package:education_app/widgets/circle_button.dart';
// import 'package:education_app/widgets/custom_icon_button.dart';
// // import 'package:education_app/widgets/custom_video_player.dart';
// import 'package:education_app/widgets/search_testfield.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mongo_dart/mongo_dart.dart' as m;
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:smart_hub/models/materialnotice_model.dart';
import 'package:smart_hub/screens/addfeedback_screen.dart';
//import 'package:video_player/video_player.dart';

import '../constants/color.dart';
import '../dbHelper/mongodb.dart';
import '../dbHelper/userprovider.dart';
import '../models/assignstudent_model.dart';
import '../models/coursework.dart';
import '../models/coursework_model.dart';
import '../models/lesson.dart';
import '../models/student_model.dart';
import '../routes/route_helper.dart';
import '../widgets/circle_button.dart';
import '../widgets/custom_icon_button.dart';
import '../widgets/lesson_card.dart';
import '../widgets/search_testfield.dart';
import 'featuerd_screen.dart';
import 'logout_screen.dart';
import 'uploaddata_screen.dart';

class ParentMaterialNotice extends StatefulWidget {
  // final String title;
  const ParentMaterialNotice({
    Key? key,
    // required this.title,
  }) : super(key: key);

  @override
  _ParentMaterialNotice createState() => _ParentMaterialNotice();
}

class _ParentMaterialNotice extends State<ParentMaterialNotice> {
  // ignore: unused_field
  int _selectedTag = 0;

  void changeTab(int index) {
    setState(() {
      _selectedTag = index;
    });
  }

  //   static const List<Color> _color = <Color>[
  //   Colors.black,
  //   Colors.yellow,
  //   Colors.green,
  //   Colors.red,
  //   Colors.blue,
  //   Colors.black,
  //   Colors.yellow,
  //   Colors.green,
  //   Colors.red,
  //   Colors.blue,
  // ];

  static Widget? currentwidget;

  @override
  void initState() {
    super.initState();
    currentwidget = MaterialNoticeList(function: _changewidget);
  }

  void _changewidget(Widget widget) {
    setState(() {
      currentwidget = widget;
    });
  }

  //  Widget courselistwidget = CourseworkList(function: _changewidget);

  @override
  Widget build(BuildContext context) {
    // currentwidget = CourseworkList(function: _changewidget,);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            // padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
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
                        placeholder: "Search Coursework",
                      )
                    ],
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Text(
                //         "Active Courseworks",
                //         style: Theme.of(context).textTheme.bodyLarge,
                //       ),
                //       // TextButton(
                //       //   onPressed: () {},
                //       //   child: Text(
                //       //     "See All",
                //       //     style: Theme.of(context)
                //       //         .textTheme
                //       //         .bodyMedium
                //       //         ?.copyWith(color: kPrimaryColor),
                //       //   ),
                //       // )
                //     ],
                //   ),
                // ),
                Container(child: currentwidget),

                // ListView.builder(
                //   shrinkWrap: true,
                //   padding: const EdgeInsets.symmetric(
                //     horizontal: 20,
                //     vertical: 8,
                //   ),
                //   // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                //   //   crossAxisCount: 1,
                //   //   childAspectRatio: 0.8,
                //   //   crossAxisSpacing: 20,
                //   //   mainAxisSpacing: 24,
                //   //   mainAxisExtent: 50,
                //   // ),
                //   itemBuilder: (context, index) {
                //     return CourseCard(
                //       coursework: courseworkList[index],
                //     );
                //   },
                //   itemCount: courseworkList.length,
                // ),

                // Expanded(
                //   child:

                //   FutureBuilder(
                //       future: MongoDatabase.getcourseworkbyteacherid(m.ObjectId.parse('${context.watch<UserProvider>().id}'.substring(10, 34))),
                //       builder: (context, AsyncSnapshot snapshot) {
                //         // print('${context.read<UserProvider>().id}'.substring(10, 34));
                //         // print(m.ObjectId.parse('${context.watch<UserProvider>().id}'.substring(10, 34)));
                //         if (snapshot.hasData) {
                //           var totalData = snapshot.data.length;
                //           print("Total Data" + totalData.toString());
                //           // print("All Data" + snapshot.data.toString());
                //           return ListView.builder(
                //               itemCount: snapshot.data.length,
                //               itemBuilder: (context, index) {
                //                 return

                //                 CourseworkContainer(
                //                     coursework: CourseworkModel.fromJson(
                //                         // snapshot.data[index]), color: _color.elementAt(int.parse(index.toString()[0])));
                //                         snapshot.data[index]), color: Colors.black);
                //               });

                //         } else {
                //           return const Center(
                //             child: Text("No Data Available"),
                //           );
                //         }
                //       })),

                // const SizedBox(
                //   height: 80,
                // ),

                // IntrinsicHeight(
                //   child: Stack(
                //     children: [
                //       Align(
                //         child: Text(
                //           "Coursework",
                //           style: Theme.of(context).textTheme.displayMedium,
                //         ),
                //       ),
                //       // Positioned(
                //       //   left: 0,
                //       //   child: CustomIconButton(
                //       //     child: const Icon(Icons.arrow_back),
                //       //     height: 35,
                //       //     width: 35,
                //       //     onTap: () => Navigator.pop(context),
                //       //   ),
                //       // ),
                //     ],
                //   ),
                // ),
                // const SizedBox(
                //   height: 25,
                // ),
                // const CustomVideoPlayer(),
                // const SizedBox(
                //   height: 15,
                // ),
                // const Text(
                //   "Futter Novice to Ninja",
                //   style: TextStyle(
                //     fontWeight: FontWeight.w700,
                //     fontSize: 18,
                //   ),
                // ),
                // const SizedBox(
                //   height: 3,
                // ),
                // const Text(
                //   "Created by DevWheels",
                //   style: TextStyle(
                //     fontWeight: FontWeight.w500,
                //     fontSize: 16,
                //   ),
                // ),
                // const SizedBox(
                //   height: 3,
                // ),
                // Row(
                //   children: [
                //     Image.asset(
                //       icFeaturedOutlined,
                //       height: 20,
                //     ),
                //     const Text(
                //       " 4.8",
                //       style: TextStyle(
                //         color: Colors.grey,
                //         fontWeight: FontWeight.w500,
                //         fontSize: 16,
                //       ),
                //     ),
                //     const SizedBox(
                //       width: 15,
                //     ),
                //     const Icon(
                //       Icons.timer,
                //       color: Colors.grey,
                //     ),
                //     const Text(
                //       " 72 Hours",
                //       style: TextStyle(
                //         color: Colors.grey,
                //         fontWeight: FontWeight.w500,
                //         fontSize: 16,
                //       ),
                //     ),
                //     const Spacer(),
                //     const Text(
                //       " \$40",
                //       style: TextStyle(
                //         color: kPrimaryColor,
                //         fontWeight: FontWeight.w700,
                //         fontSize: 20,
                //       ),
                //     ),
                //   ],
                // ),
                // const SizedBox(
                //   height: 15,
                // ),
                // CustomTabView(
                //   index: _selectedTag,
                //   changeTab: changeTab,
                // ),
                // _selectedTag == 0 ? const PlayList() : const Description(),
              ],
            ),
          ),
        ),
        // bottomSheet:
        // BottomSheet(
        //   onClosing: () {},
        //   backgroundColor: Colors.white,
        //   enableDrag: false,
        //   builder: (context) {
        //     return
        //     const SizedBox(
        //       height: 80,
        //       child: AddNewCoursework(),
        //     );
        //   },
        // ),
      ),
    );
  }
}

class MaterialNoticeList extends StatefulWidget {
  final Function function;
  const MaterialNoticeList({Key? key, required this.function}) : super(key: key);

  @override
  _MaterialNoticeList createState() => _MaterialNoticeList();
}

class _MaterialNoticeList extends State<MaterialNoticeList> {
  @override
  Widget build(BuildContext context) {
    return
        // Column(children: [
        Expanded(
            child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Material Notices",
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
        // ListView.builder(
        //   shrinkWrap: true,
        //   padding: const EdgeInsets.symmetric(
        //     horizontal: 20,
        //     vertical: 8,
        //   ),
        //   // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        //   //   crossAxisCount: 1,
        //   //   childAspectRatio: 0.8,
        //   //   crossAxisSpacing: 20,
        //   //   mainAxisSpacing: 24,
        //   //   mainAxisExtent: 50,
        //   // ),
        //   itemBuilder: (context, index) {
        //     return CourseCard(
        //       coursework: courseworkList[index],
        //     );
        //   },
        //   itemCount: courseworkList.length,
        // ),
        // Padding(padding: const EdgeInsets.all(10), child:
        Expanded(
            child: FutureBuilder(
                // future: MongoDatabase.getcourseworkbyteacherid(m.ObjectId.parse(
                //     '${context.watch<UserProvider>().id}'.substring(10, 34))),
                // future: MongoDatabase.getmaterialnoticebystudent('${context.watch<UserProvider>().matric}'),
                future: MongoDatabase.getmaterialnoticebychildren(context.watch<UserProvider>().children),
                builder: (context, AsyncSnapshot snapshot) {
                  // print('${context.read<UserProvider>().id}'.substring(10, 34));
                  // print(m.ObjectId.parse('${context.watch<UserProvider>().id}'.substring(10, 34)));
                  if (snapshot.hasData) {
                    var totalData = snapshot.data.length;
                    // print("Total Data" + totalData.toString());
                    print("snapshot data " + snapshot.data.toString());
                    // print("All Data" + snapshot.data.toString());
                    return ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          return MaterialNoticeContainer(
                              function: widget.function,
                              materialnotice: 
                              // CourseworkModel.fromJson(
                                  // snapshot.data[index]), color: _color.elementAt(int.parse(index.toString()[0])));
                                  // snapshot.data[index]),
                                  snapshot.data[index],
                              color: Colors.black);
                        });
                  } else {
                    return const Center(
                      child: Text("No Data Available"),
                    );
                  }
                })),
        // const SizedBox(
        //   height: 80,
        //   child: AddNewCoursework(),
        // ),
      ],
    ));
    // );
    // ],);
  }
}

class CourseworkDetailsTableHeader extends StatelessWidget {
  const CourseworkDetailsTableHeader({
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
              // TableCell(
              //   verticalAlignment: TableCellVerticalAlignment.middle,
              //   child: Padding(
              //     padding: EdgeInsets.all(8.0),
              //     child: Text(
              //       'Grade',
              //       textScaler: TextScaler.linear(0.8),
              //       style: TextStyle(fontWeight: FontWeight.bold),
              //     ),
              //   ),
              // ),
              // TableCell(
              //   verticalAlignment: TableCellVerticalAlignment.middle,
              //   child: Padding(
              //     padding: EdgeInsets.all(0),
              //     child: Text(
              //       'Transcript',
              //       textScaler: TextScaler.linear(0.8),
              //       style: TextStyle(fontWeight: FontWeight.bold),
              //     ),
              //   ),
              // ),
            ],
          ),
        ],
        // )
      ),
    );
  }
}

class CourseCard extends StatelessWidget {
  final Coursework coursework;
  const CourseCard({
    Key? key,
    required this.coursework,
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
        // Get.toNamed(RouteHelper.getlist("coursework.id"));
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
                child: Text(coursework.name),
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

class MaterialNoticeContainer extends StatelessWidget {
  final Function function;
  final MaterialNoticeModel materialnotice;
  final Color color;
  const MaterialNoticeContainer(
      {Key? key,
      required this.materialnotice,
      required this.color,
      required this.function})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () => Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //         builder: (context) => const BaseScreen())),
      onTap: () {
      print("heree" + materialnotice.assigneeslist.toString());
        function(
            MaterialNoticeListDetails(changetab: function, materialnotice: materialnotice));
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
                  Text(materialnotice.title),
                  Text(materialnotice.content)
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

class MaterialNoticeListDetails extends StatefulWidget {
  final Function changetab;
  final MaterialNoticeModel materialnotice;
  const MaterialNoticeListDetails(
      {Key? key, required this.materialnotice, required this.changetab})
      : super(key: key);

  @override
  _MaterialNoticeListDetails createState() => _MaterialNoticeListDetails();
}

class _MaterialNoticeListDetails extends State<MaterialNoticeListDetails> {
  @override
  Widget build(BuildContext context) {
  print("coursework assigneeslist" + widget.materialnotice.toString());
  print("coursework assigneeslist" + widget.materialnotice.content.toString());
  // print("coursework assigneeslist" + jsonDecode(widget.materialnotice.assigneeslist[5]).map((studentt) {
  print("coursework assigneeslist" + widget.materialnotice.assigneeslist.map((studentt) {
        // var filteredAssignees = studentt["assigneeslist"].where((student) {
        // var studentModel = AssignStudentModel.fromJson(studentt);
        var studentModel = AssignStudentModel.fromJson(jsonDecode(studentt));
        // if(studentModel.student.studentid == '${context.watch<UserProvider>().matric}')
        if(context.watch<UserProvider>().children.contains(studentModel.student.studentid))
        // {return AssignStudentModel.fromJson(studentt).feedback; } 
        {return AssignStudentModel.fromJson(jsonDecode(studentt)).feedback; } 
        
      // }); 
      
      // if (filteredAssignees.isNotEmpty) {
      //   return CourseworkModel.fromJson(studentt);
      // } else {
      //   return null;
      // }

      
      })
      .where((studentt) => studentt != null)
      // .cast<AssignStudentModel>()
      .toString());

    

  //     List<AssignStudentModel> feedback = jsonDecode(widget.coursework.assigneeslist[7]).map((studentJson) {
  //   var studentModel = AssignStudentModel.fromJson(studentJson);
  //   if (studentModel.student.studentid == 'UK0192') {
  //     return studentModel;
  //   }
  //   return null;
  // }).where((student) => student != null).cast<AssignStudentModel>().toList();

      // String feedback = jsonDecode(widget.materialnotice.assigneeslist[5]).map((studentt) {
      String feedback = widget.materialnotice.assigneeslist.map((studentt) {
        // var filteredAssignees = studentt["assigneeslist"].where((student) {
        // var studentModel = AssignStudentModel.fromJson(studentt);
        var studentModel = AssignStudentModel.fromJson(jsonDecode(studentt));
        // if(studentModel.student.studentid == '${context.watch<UserProvider>().matric}')
        if(context.watch<UserProvider>().children.contains(studentModel.student.studentid))
        // {return AssignStudentModel.fromJson(studentt).feedback; } 
        {return studentModel.feedback; } 
        
      // }); 
      
      // if (filteredAssignees.isNotEmpty) {
      //   return CourseworkModel.fromJson(studentt);
      // } else {
      //   return null;
      // }

      
      })
      .where((studentt) => studentt != null)
      .toString();

    return
        // Column(children: [
        Expanded(
            child: Column(
      children: [
        Padding(
          padding: EdgeInsets.all(10),
          child: Stack(
            children: [
              const Align(
                child: Text(
                  'Coursework Details',
                  // style: Theme.of(context).textTheme.displayMedium,
                ),
              ),
              Positioned(
                left: 0,
                child: CustomIconButton(
                  child: const Icon(Icons.arrow_back),
                  height: 35,
                  width: 35,
                  onTap: () => widget
                      .changetab(MaterialNoticeList(function: widget.changetab)),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),

        Align(
            child: Text(
          widget.materialnotice.title,
          style: TextStyle(fontSize: 30),
        )),
        SizedBox(
          height: 5,
        ),
        Text("Assign Date" +
            DateFormat('dd-MM-yyy').format(widget.materialnotice.assigndate)),
        Text("Assigned Date" +
            DateFormat('dd-MM-yyy').format(widget.materialnotice.assigndate)),
        // Text("Due Date" +
        //     DateFormat('dd-MM-yyy').format(widget.materialnotice.duedate)),
        Text("Assignees Type" + widget.materialnotice.assigneestype),
        const SizedBox(height: 15,),
        const Text("coursework feedback " ),
        (feedback == "()") ? const Text("Feedback is yet to be received",  style: TextStyle(fontSize: 20)) : Text( feedback.substring(1, feedback.length - 1), style: const TextStyle(fontSize: 20)),
        // Text( feedback.substring(1, feedback.length - 1), style: const TextStyle(fontSize: 20)),
        // Text("coursework feedback" + feedback.map((e) => e.feedback.toString()).toString()),
        // const CourseworkDetailsTableHeader(),
        // Expanded(
        //   child: SizedBox(
        //       height: 100,
        //       child: SizedBox(
        //           child: FutureBuilder(
        //               future: MongoDatabase.getstudentbycoursework(
        //                   widget.coursework.id),
        //               builder: (context, AsyncSnapshot snapshot) {
        //                 if (snapshot.hasData) {
        //                   var totalData = snapshot.data.length;
        //                   print("Total Data" + totalData.toString());

        //                   final List<Map<String, dynamic>> items =
        //                       snapshot.data!;

        //                   final List<List<String>> studentsList =
        //                       items.map((map) {
        //                     return map.values
        //                         .map((value) => value.toString())
        //                         .toList();
        //                   }).toList();

        //                   // final List<String> itemNames = items
        //                   //     .map((map) => map['assigneeslist'][1] as String)
        //                   //     .toList();

        //                   // print(items);
        //                   // print(jsonDecode(studentsList[0][7])[1]);

        //                   String studentt = studentsList[0][7].toString();

        //                   var josndecosdedtest = jsonDecode(studentt);

        //                   final List<AssignStudentModel> assigneeslist =
        //                       (josndecosdedtest as List).map((userData) {
        //                     print("inside test" + userData.toString());

        //                     var encodedstssring = jsonEncode(userData);
        //                     Map<String, dynamic> assigneeslistsss =
        //                         jsonDecode(encodedstssring);

        //                     print("inside test 32" + userData.toString());

        //                     // m.ObjectId id = m.ObjectId.parse("6644659a162faa9b21000000");

        //                     return AssignStudentModel.fromJson(
        //                         assigneeslistsss);
        //                   }).toList();

        //                   return ListView.builder(
        //                       itemCount: assigneeslist.length,
        //                       itemBuilder: (context, index) {
        //                         return CourseworkDetailsStudentContainer(
        //                             assignees: assigneeslist[index]);
        //                         // coursework: AssignStudentModel.fromJson(
        //                       });
        //                 } else {
        //                   return Center(
        //                     child: Text("No Data Available"),
        //                   );
        //                 }
        //               }))),
        // ),
        // SizedBox(
        //   height: 80,
        //   child: AddFeedbackButton(
        //     coursework: widget.coursework,
        //   ),
        // )
        // Text("Assignees Type" + widget.coursework.assigneestype),

        // ListView.builder(
        //   shrinkWrap: true,
        //   padding: const EdgeInsets.symmetric(
        //     horizontal: 20,
        //     vertical: 8,
        //   ),
        //   // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        //   //   crossAxisCount: 1,
        //   //   childAspectRatio: 0.8,
        //   //   crossAxisSpacing: 20,
        //   //   mainAxisSpacing: 24,
        //   //   mainAxisExtent: 50,
        //   // ),
        //   itemBuilder: (context, index) {
        //     return CourseCard(
        //       coursework: courseworkList[index],
        //     );
        //   },
        //   itemCount: courseworkList.length,
        // ),
        // Padding(padding: const EdgeInsets.all(10), child:
        // Expanded(
        //   child:

        //   FutureBuilder(
        //       future: MongoDatabase.getcourseworkbyteacherid(m.ObjectId.parse('${context.watch<UserProvider>().id}'.substring(10, 34))),
        //       builder: (context, AsyncSnapshot snapshot) {
        //         // print('${context.read<UserProvider>().id}'.substring(10, 34));
        //         // print(m.ObjectId.parse('${context.watch<UserProvider>().id}'.substring(10, 34)));
        //         if (snapshot.hasData) {
        //           var totalData = snapshot.data.length;
        //           print("Total Data" + totalData.toString());
        //           // print("All Data" + snapshot.data.toString());
        //           return ListView.builder(
        //               itemCount: snapshot.data.length,
        //               itemBuilder: (context, index) {
        //                 return

        //                 CourseworkContainer( function: widget.function,
        //                     coursework: CourseworkModel.fromJson(
        //                         // snapshot.data[index]), color: _color.elementAt(int.parse(index.toString()[0])));
        //                         snapshot.data[index]), color: Colors.black);
        //               });

        //         } else {
        //           return const Center(
        //             child: Text("No Data Available"),
        //           );
        //         }
        //       })
        //       )
      ],
    ));
    // );
    // ],);
  }
}

class CourseworkDetailsStudentContainer extends StatelessWidget {
  final AssignStudentModel assignees;
  const CourseworkDetailsStudentContainer({Key? key, required this.assignees})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    print("ini assignees" + assignees.student.name);

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
                          assignees.student.name,
                          textScaler: const TextScaler.linear(0.8),
                        ),
                      ),
                      TableCell(
                          child: Center(
                        child: Text(
                          // "coursework.submission",
                          assignees.submission,
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

class AddFeedbackButton extends StatefulWidget {
  final CourseworkModel coursework;
  const AddFeedbackButton({Key? key, required this.coursework})
      : super(key: key);

  @override
  _AddFeedback createState() => _AddFeedback();
}

class _AddFeedback extends State<AddFeedbackButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30.0,
      ),
      child: Row(
        children: [
          // CustomIconButton(
          //   onTap: () {},
          //   height: 45,
          //   width: 45,
          //   child: const Icon(
          //     Icons.favorite,
          //     color: Colors.pink,
          //     size: 30,
          //   ),
          // ),
          // const SizedBox(
          //   width: 20,
          // ),
          Expanded(
            child: CustomIconButton(
              // onTap: () {Get.toNamed(RouteHelper.goto("Teacher","AddCoursework"));print(context.read<UserProvider>().role.toString());},
              onTap: () {
                // Get.toNamed(RouteHelper.goto(
                //     context.read<UserProvider>().role.toString(),
                //     "AddFeedback"));

                RouteHelper.navigateTo(RouteHelper.teacheraddfeedback,
                    arguments: widget.coursework);

                // return AddFeedback(coursework: widget.coursework)
              },
              // color: kPrimaryColor,
              color: Colors.blue,
              height: 45,
              width: 45,
              child: const Text(
                "Feedback",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
