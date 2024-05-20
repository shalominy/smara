// import 'package:education_app/constants/color.dart';
//import 'package:education_app/constants/size.dart';
// import 'package:education_app/dbHelper/mongodb.dart';
// import 'package:education_app/dbHelper/userprovider.dart';
// // import 'package:education_app/main.dart';
// import 'package:education_app/models/category.dart';
// // import 'package:education_app/models/users_modeltemporary.dart';
// import 'package:education_app/routes/route_helper.dart';
// //import 'package:education_app/screens/course_screen.dart';
// // import 'package:education_app/screens/studentlist_screen.dart';
// // import 'package:education_app/screens/teacherlist_screen.dart';
// //import 'package:education_app/screens/details_screen.dart';
// import 'package:education_app/widgets/circle_button.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import '../widgets/search_testfield.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../dbHelper/userprovider.dart';
import '../models/category.dart';
import '../routes/route_helper.dart';
import '../widgets/circle_button.dart';

class DatabaseScreen extends StatefulWidget {
  const DatabaseScreen({Key? key}) : super(key: key);

  @override
  _DatabaseScreen createState() => _DatabaseScreen();
}

class _DatabaseScreen extends State<DatabaseScreen> {
  @override
  Widget build(BuildContext context) {
    String userrole = '${context.watch<UserProvider>().role}';
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: Column(
          children: [
            AppBar(),
            Body(userrole: userrole),
          ],
        ),
      ),
    );
  }
}

class Body extends StatelessWidget {
  final String userrole;
  const Body({Key? key, required this.userrole}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Categories",
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
        ListView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 8,
          ),
          // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //   crossAxisCount: 1,
          //   childAspectRatio: 0.8,
          //   crossAxisSpacing: 20,
          //   mainAxisSpacing: 24,
          //   mainAxisExtent: 50,
          // ),
          itemBuilder: (context, index) {
            return CategoryCard(
              role: userrole,
              category: categoryList[index],
            );
          },
          itemCount: categoryList.length,
        ),
      ],
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String role;
  final DataList category;
  const CategoryCard({
    Key? key,
    required this.category,
    required this.role,
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
          Get.toNamed(RouteHelper.getlist(role, category.list));
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
                  child: Text(category.name),
                ),
                // Text(
                //   "${category.noOfCourses.toString()} courses",
                //   style: Theme.of(context).textTheme.bodySmall,
                // ),
              ],
            ),
          ),
        ));
  }
}

class AppBar extends StatelessWidget {
  // final String name;
  AppBar({
    Key? key,
    // required this.name,
  }) : super(key: key);

  // final Future<UserModelTemporary> bb = MongoDatabase.getuserdetails(MongoDatabase.getuserid());
  // final Future<String> bb = MongoDatabase.getuserdetailstesting(MongoDatabase.getuserid());

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
                textScaler: const TextScaler.linear(0.8),
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
          //     const Center(
          //   child: Column(
          //     mainAxisSize: MainAxisSize.min,
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: <Widget>[
          //       Text('You have pushed the button this many times:'),

          //       /// Extracted as a separate widget for performance optimization.
          //       /// As a separate widget, it will rebuild independently from [MyHomePage].
          //       ///
          //       /// This is totally optional (and rarely needed).
          //       /// Similarly, we could also use [Consumer] or [Selector].
          //       Name(),
          //     ],
          //   ),
          // ),
          Center(
            child: Text(
              // "Aly Zanaty",
              // "{$context.watch<UserProvider>().name}",
              '${context.watch<UserProvider>().nickname}',
              key: const Key('counterState'),
              textScaler: const TextScaler.linear(3.5),
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),

          // const SearchTextField()
        ],
      ),
    );
  }
}

class Name extends StatelessWidget {
  const Name({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      /// Calls `context.watch` to make [Count] rebuild when [Counter] changes.
      '${context.watch<UserProvider>().name}',
      key: const Key('counterState'),
      style: Theme.of(context).textTheme.headlineMedium,
    );
  }
}
