// import 'package:education_app/dbHelper/userprovider.dart';
// import 'package:education_app/models/category.dart';
// import 'package:education_app/routes/route_helper.dart';
// import 'package:education_app/widgets/circle_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../dbHelper/userprovider.dart';
import '../models/category.dart';
import '../routes/route_helper.dart';
import '../widgets/circle_button.dart';
import '../widgets/search_testfield.dart';
import 'package:get/get.dart';

class UploadData extends StatefulWidget {
  const UploadData({Key? key}) : super(key: key);

  @override
  _UploadData createState() => _UploadData();
}

class _UploadData extends State<UploadData> {
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
  // var username = TextEditingController();
  // var useremail = TextEditingController();
  // var userrole = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String role = '${context.watch<UserProvider>().role}';
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
                  "Upload Data",
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
              "Select To Upload",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          // Text(
          //   "Student Information",
          //   style: Theme.of(context).textTheme.bodyMedium,
          // ),

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
                userrole: role,
                category: categoryList[index],
              );
            },
            itemCount: categoryList.length,
          ),
          GestureDetector(
              onTap: () {
                Get.toNamed(RouteHelper.goto(role, "RoleRegCode"));
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 40, right: 40),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.1),
                        blurRadius: 4.0,
                        spreadRadius: .05,
                      ), //BoxShadow
                    ],
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        child: Text("Registration Code"),
                      ),
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final DataList category;
  final String userrole;
  const CategoryCard({
    Key? key,
    required this.category,
    required this.userrole,
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
          Get.toNamed(RouteHelper.goto(userrole, category.upload));
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
