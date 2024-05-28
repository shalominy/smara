// import 'package:education_app/constants/color.dart';
// import 'package:education_app/models/course.dart';
// import 'package:education_app/dbHelper/mongodb.dart';
// import 'package:education_app/dbHelper/mongodb.dart';
// import 'package:education_app/models/student_model.dart';
// // import 'package:education_app/models/studentlist.dart';
// import 'package:education_app/screens/details_screen.dart';
// // import 'package:education_app/widgets/circle_button.dart';
// import 'package:education_app/widgets/custom_icon_button.dart';
// import 'package:education_app/widgets/search_testfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../dbHelper/mongodb.dart';
import '../models/student_model.dart';
import '../routes/route_helper.dart';
import '../widgets/custom_icon_button.dart';
import '../widgets/search_testfield.dart';
import 'details_screen.dart';

class StudentListScreen extends StatefulWidget {
  const StudentListScreen({Key? key}) : super(key: key);

  @override
  _StudentListScreenState createState() => _StudentListScreenState();
}

class _StudentListScreenState extends State<StudentListScreen> {
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
                        'Student List',
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
              const AppBar(),
              const SizedBox(
                height: 10,
              ),
              const TableHeader(),

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
              Expanded(
                  child: FutureBuilder(
                      future: MongoDatabase.getstudents(),
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          var totalData = snapshot.data.length;
                          print(snapshot.data);
                          print("Total Data" + totalData.toString());
                          return ListView.builder(
                              itemCount: snapshot.data.length,
                              itemBuilder: (context, index) {
                                return StudentContainer(
                                    // students: StudentModel.fromJson(
                                    //     snapshot.data[index]));
                                    students: snapshot.data[index]);
                              });
                        } else {
                          return Center(
                            child: Text("No Data Available"),
                          );
                        }
                      }))

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
}

class StudentContainer extends StatelessWidget {
  // final StudentModel students;
  final students;
  const StudentContainer({Key? key, required this.students}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => 
      // Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //         builder: (context) => const DetailsScreen(
      //               title: "course.name",
      //             ))),

      RouteHelper.navigateTo(RouteHelper.liststudentdetails,
                    arguments: students),
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
                          // students.name,
                          students["name"],
                          textScaler: const TextScaler.linear(0.8),
                        ),
                      ),
                      TableCell(
                          child: Center(
                        child: Text(
                          // students.studentid,
                          students["studentid"],
                          textScaler: const TextScaler.linear(0.8),
                        ),
                      )),
                      TableCell(
                          child: Center(
                        child: Text(
                          // students.studentclass,
                          students["studentclass"],
                          textScaler: const TextScaler.linear(0.8),
                        ),
                      )),
                      TableCell(
                          child: Center(
                        child: Text(
                          // students.gender,
                          students["gender"],
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
        columnWidths: const {
          0: FlexColumnWidth(50),
          1: FlexColumnWidth(20),
          2: FlexColumnWidth(15),
          3: FlexColumnWidth(15),
        },
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
                    child: Center(
                      child: Text(
                        'Id',
                        textScaler: TextScaler.linear(0.8),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    )),
              ),
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        'Class',
                        textScaler: TextScaler.linear(0.8),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    )),
              ),
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        'M/F',
                        textScaler: TextScaler.linear(0.8),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    )),
              ),
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
