//import 'package:education_app/constants/color.dart';
// import 'package:education_app/models/course.dart';
import 'package:education_app/models/teacherlist.dart';
// import 'package:education_app/screens/details_screen.dart';
import 'package:education_app/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TeacherListScreen extends StatefulWidget {
  const TeacherListScreen({Key? key}) : super(key: key);

  @override
  _TeacherListScreenState createState() => _TeacherListScreenState();
}

class _TeacherListScreenState extends State<TeacherListScreen> {
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
                          'Teacher List',
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
                      return TeacherContainer(
                        teachers: teachers[index],
                      );
                    },
                    itemCount: teachers.length,
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

class TeacherContainer extends StatelessWidget {
  final Teacherlist teachers;
  const TeacherContainer({
    Key? key,
    required this.teachers,
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(teachers.name),
                  Text(
                    " ${teachers.teacherid}",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Text(
                    " ${teachers.grade}",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Text(
                    " ${teachers.course}",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Text(
                    " ${teachers.information}",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  // LinearProgressIndicator(
                  //   value: course.completedPercentage,
                  //   backgroundColor: Colors.black12,
                  //   color: kPrimaryColor,
                  // )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
