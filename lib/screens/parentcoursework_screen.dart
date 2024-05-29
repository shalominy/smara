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

class ParentCoursework extends StatefulWidget {
  // final String title;
  const ParentCoursework({
    Key? key,
    // required this.title,
  }) : super(key: key);

  @override
  _ParentCoursework createState() => _ParentCoursework();
}

class _ParentCoursework extends State<ParentCoursework> {
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
    currentwidget = CourseworkList(function: _changewidget);
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
                      stops: [0.1, 0.7],
                      colors: [
                        // Color(0xff886ff2),
                        Color.fromARGB(187, 42, 219, 78),
                        Color.fromARGB(255, 37, 211, 230),
                        // Color(0xff6849ef),
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

                Container(child: currentwidget),

              ],
            ),
          ),
        ),

      ),
    );
  }
}

class CourseworkList extends StatefulWidget {
  final Function function;
  const CourseworkList({Key? key, required this.function}) : super(key: key);

  @override
  _CourseworkList createState() => _CourseworkList();
}

class _CourseworkList extends State<CourseworkList> {
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
                "Active Courseworks",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
        ),

        Expanded(
            child: FutureBuilder(

                future: MongoDatabase.getcourseworkbychildren(context.watch<UserProvider>().children),
                builder: (context, AsyncSnapshot snapshot) {

                  if (snapshot.hasData) {
                    var totalData = snapshot.data.length;

                    print("snapshot data " + snapshot.data.toString());

                    return ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          return CourseworkContainer(
                              function: widget.function,
                              coursework:

                                  snapshot.data[index],
                              color: Colors.black);
                        });
                  } else {
                    return const Center(
                      child: Text("No Data Available"),
                    );
                  }
                })),

      ],
    ));
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

            ],
          ),
        ],
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


  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      onTap: () {

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

              Align(
                child: Text(coursework.name),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PlayList extends StatelessWidget {
  const PlayList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        separatorBuilder: (_, __) {
          return const SizedBox(
            height: 20,
          );
        },
        padding: const EdgeInsets.only(top: 20, bottom: 40),
        shrinkWrap: true,
        itemCount: lessonList.length,
        itemBuilder: (_, index) {
          return LessonCard(lesson: lessonList[index]);
        },
      ),
    );
  }
}

class Description extends StatelessWidget {
  const Description({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: Text(
          "Build Flutter iOS and Android Apps with a Single Codebase: Learn Google's Flutter Mobile Development Framework & Dart"),
    );
  }
}

class CustomTabView extends StatefulWidget {
  final Function(int) changeTab;
  final int index;
  const CustomTabView({Key? key, required this.changeTab, required this.index})
      : super(key: key);

  @override
  State<CustomTabView> createState() => _CustomTabViewState();
}

class _CustomTabViewState extends State<CustomTabView> {
  final List<String> _tags = ["Playlist (22)", "Description"];

  Widget _buildTags(int index) {
    return GestureDetector(
      onTap: () {
        widget.changeTab(index);
      },
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * .08, vertical: 15),
        decoration: BoxDecoration(
          color: widget.index == index ? kPrimaryColor : null,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          _tags[index],
          style: TextStyle(
            color: widget.index != index ? Colors.black : Colors.white,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey.shade200,
      ),
      child: Row(
        children: _tags
            .asMap()
            .entries
            .map((MapEntry map) => _buildTags(map.key))
            .toList(),
      ),
    );
  }
}

class CourseworkContainer extends StatelessWidget {
  final Function function;
  final CourseworkModel coursework;
  final Color color;
  const CourseworkContainer(
      {Key? key,
      required this.coursework,
      required this.color,
      required this.function})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      onTap: () {
      print("heree" + coursework.assigneeslist.toString());
        function(
            CourseworkListDetails(changetab: function, coursework: coursework));

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

              Align(
                child: Column(children: [
                  Text(coursework.name),
                  Text(coursework.content)
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CourseworkListDetails extends StatefulWidget {
  final Function changetab;
  final CourseworkModel coursework;
  const CourseworkListDetails(
      {Key? key, required this.coursework, required this.changetab})
      : super(key: key);

  @override
  _CourseworkListDetails createState() => _CourseworkListDetails();
}

class _CourseworkListDetails extends State<CourseworkListDetails> {
  @override
  Widget build(BuildContext context) {
  print("coursework assigneeslist" + widget.coursework.toString());
  print("coursework assigneeslist" + widget.coursework.content.toString());
  print("coursework assigneeslist" + widget.coursework.assigneeslist.map((studentt) {
        var studentModel = AssignStudentModel.fromJson(jsonDecode(studentt));
        if(context.watch<UserProvider>().children.contains(studentModel.student.studentid))
        {return AssignStudentModel.fromJson(jsonDecode(studentt)).feedback; }


      
      })
      .where((studentt) => studentt != null)
      // .cast<AssignStudentModel>()
      .toString());

    

      String feedback = widget.coursework.assigneeslist.map((studentt) {

        var studentModel = AssignStudentModel.fromJson(jsonDecode(studentt));

        if(context.watch<UserProvider>().children.contains(studentModel.student.studentid))
        {return studentModel.feedback; }

      
      })
      .where((studentt) => studentt != null)
      .toString();


    return
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
                ),
              ),
              Positioned(
                left: 0,
                child: CustomIconButton(
                  child: const Icon(Icons.arrow_back),
                  height: 35,
                  width: 35,
                  onTap: () => widget
                      .changetab(CourseworkList(function: widget.changetab)),
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
          widget.coursework.name,
          style: TextStyle(fontSize: 30),
        )),
        SizedBox(
          height: 5,
        ),
        Text("Assign Date" +
            DateFormat('dd-MM-yyy').format(widget.coursework.assigndate)),
        Text("Due Date" +
            DateFormat('dd-MM-yyy').format(widget.coursework.duedate)),
        Text("Due Date" +
            DateFormat('dd-MM-yyy').format(widget.coursework.duedate)),
        Text("Assignees Type" + widget.coursework.assigneestype),
        const SizedBox(height: 15,),
        const Text("coursework feedback " ),
        (feedback == "()") ? const Text("Feedback is yet to be received",  style: TextStyle(fontSize: 20)) : Text( feedback.substring(1, feedback.length - 1), style: const TextStyle(fontSize: 20)),

      ],
    ));
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
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [


            Expanded(
              child: Table(
                columnWidths: const {
                  0: FlexColumnWidth(50),
                  1: FlexColumnWidth(20),
                  2: FlexColumnWidth(15),
                  3: FlexColumnWidth(15),
                },

                children: [
                  TableRow(
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                    ),
                    children: [
                      TableCell(
                        child: Text(

                          assignees.student.name,
                          textScaler: const TextScaler.linear(0.8),
                        ),
                      ),
                      TableCell(
                          child: Center(
                        child: Text(

                          assignees.submission,
                          textScaler: const TextScaler.linear(0.8),
                        ),
                      )),

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
