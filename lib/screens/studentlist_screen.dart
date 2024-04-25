//import 'package:education_app/constants/color.dart';
// import 'package:education_app/models/course.dart';
import 'package:education_app/models/studentlist.dart';
import 'package:education_app/screens/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StudentListScreen extends StatefulWidget {
  const StudentListScreen({Key? key}) : super(key: key);

  @override
  _StudentListScreenState createState() => _StudentListScreenState();
}

class _StudentListScreenState extends State<StudentListScreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        body: SafeArea(
          bottom: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IntrinsicHeight(
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
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Table(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                   TableRow(
                    decoration:  BoxDecoration(
                      color: Colors.blue,
                    ),
                      children: [
                        TableCell(
                        // child: Padding(
                        //   padding: EdgeInsets.all(1.0),
                          child: Text('Name'),),
                        // ),
                        TableCell(
                        // child: Padding(
                        //   padding: EdgeInsets.all(1.0),
                          child: Text('Id', textScaler: TextScaler.linear(1.0)),),
                        // ),
                        TableCell(
                        // child: Padding(
                        //   padding: EdgeInsets.all(1.0),
                          child: Text('Class', textScaler: TextScaler.linear(1.0)),),
                        // ),
                        TableCell(
                        // child: Padding(
                        //   padding: EdgeInsets.all(1.0),
                          child: Text('Grade', textScaler: TextScaler.linear(1.0)),),
                        // ),
                        TableCell(
                        // child: Padding(
                        //   padding: EdgeInsets.all(1.0),
                          child: Text('Transcript', textScaler: TextScaler.linear(0.9)),),
                        // ),
                      ],
                    ),
                  ],
                ),
                Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    separatorBuilder: (_, __) {
                      return const SizedBox(
                        height: 10,
                      );
                    },
                    shrinkWrap: true,
                    itemBuilder: (_, int index) {
                      return StudentContainer(
                        students: students[index],
                      );
                    },
                    itemCount: students.length,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class StudentContainer extends StatelessWidget {
  final Studentlist students;
  const StudentContainer({
    Key? key,
    required this.students,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () => Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //         builder: (context) => DetailsScreen(
      //               title: course.name,
      //             ))),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        padding: const EdgeInsets.all(10),
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
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Table(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // const TableRow(
                  //   decoration:  BoxDecoration(
                  //     color: Colors.blue,
                  //   ),
                  //     children: [
                  //       TableCell(
                  //       // child: Padding(
                  //       //   padding: EdgeInsets.all(1.0),
                  //         child: Text('Name'),),
                  //       // ),
                  //       TableCell(
                  //       // child: Padding(
                  //       //   padding: EdgeInsets.all(1.0),
                  //         child: Text('Id', textScaler: TextScaler.linear(1.0)),),
                  //       // ),
                  //       TableCell(
                  //       // child: Padding(
                  //       //   padding: EdgeInsets.all(1.0),
                  //         child: Text('Class', textScaler: TextScaler.linear(1.0)),),
                  //       // ),
                  //       TableCell(
                  //       // child: Padding(
                  //       //   padding: EdgeInsets.all(1.0),
                  //         child: Text('Grade', textScaler: TextScaler.linear(1.0)),),
                  //       // ),
                  //       TableCell(
                  //       // child: Padding(
                  //       //   padding: EdgeInsets.all(1.0),
                  //         child: Text('Transcript', textScaler: TextScaler.linear(0.9)),),
                  //       // ),
                  //     ],


                  // ),

                   TableRow(
                   children: [
                    TableCell( child: 
                      Text(students.name, textScaler: const TextScaler.linear(0.8),
                      ),
                    ),

                    TableCell( child: 
                      Text(students.studentid, textScaler: const TextScaler.linear(0.8),
                      ),
                    ),

                    TableCell( child: 
                      Text(students.studentclass, textScaler: const TextScaler.linear(0.8),
                      ),
                    ),

                    TableCell( child: 
                      Text(students.grade, textScaler: const TextScaler.linear(0.8),
                      ),
                    ),

                    TableCell( child: 
                      Text(students.transcript, textScaler: const TextScaler.linear(0.8),
                      ),
                    ),





                      // Text(
                      //   " ${students.studentid}",
                      //   // style: Theme.of(context).textTheme.bodySmall,
                      //   textScaler: const TextScaler.linear(0.8),
                      // ),
                      // Text(
                      //   " ${students.studentclass}",
                      //   // style: Theme.of(context).textTheme.bodySmall,
                      //   textScaler: const TextScaler.linear(0.8),
                      // ),
                      // Text(
                      //   " ${students.grade}",
                      //   // style: Theme.of(context).textTheme.bodySmall,
                      //   textScaler: const TextScaler.linear(0.8),
                      // ),
                      // Text(
                      //   " ${students.transcript}",
                      //   // style: Theme.of(context).textTheme.bodySmall,
                      //   textScaler: const TextScaler.linear(0.8),
                      // ),
                      // const SizedBox(
                      //   height: 5,
                      // ),
                      // LinearProgressIndicator(
                      //   value: course.completedPercentage,
                      //   backgroundColor: Colors.black12,
                      //   color: kPrimaryColor,
                      // )
                      
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
