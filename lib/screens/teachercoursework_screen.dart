import 'package:education_app/constants/color.dart';
import 'package:education_app/dbHelper/userprovider.dart';
// import 'package:education_app/constants/icons.dart';
// import 'package:education_app/models/category.dart';
import 'package:education_app/models/coursework.dart';
import 'package:education_app/models/lesson.dart';
import 'package:education_app/routes/route_helper.dart';
import 'package:education_app/widgets/circle_button.dart';
import 'package:education_app/widgets/custom_icon_button.dart';
// import 'package:education_app/widgets/custom_video_player.dart';
import 'package:education_app/widgets/search_testfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
//import 'package:video_player/video_player.dart';

import '../widgets/lesson_card.dart';

class TeacherCoursework extends StatefulWidget {
  final String title;
  const TeacherCoursework({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  _TeacherCoursework2 createState() => _TeacherCoursework2();
}

class _TeacherCoursework2 extends State<TeacherCoursework> {
  // ignore: unused_field
  int _selectedTag = 0;

  void changeTab(int index) {
    setState(() {
      _selectedTag = index;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Active Courseworks",
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
                      coursework: courseworkList[index],
                    );
                  },
                  itemCount: courseworkList.length,
                ),
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
        bottomSheet: BottomSheet(
          onClosing: () {},
          backgroundColor: Colors.white,
          enableDrag: false,
          builder: (context) {
            return const SizedBox(
              height: 80,
              child: AddNewCoursework(),
            );
          },
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final Coursework coursework;
  const CategoryCard({
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
        Get.toNamed(RouteHelper.getlist("coursework.id"));
      },
      child: 
      Padding(padding: const EdgeInsets.only(top: 10, left: 20, right: 20), child: 
      Container(
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

class AddNewCoursework extends StatefulWidget {
  const AddNewCoursework({Key? key}) : super(key: key);

  @override
  _AddNewCoursework createState() => _AddNewCoursework();
}

class _AddNewCoursework extends State<AddNewCoursework> {
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
              onTap: () {Get.toNamed(RouteHelper.goto(context.read<UserProvider>().role.toString(),"AddCoursework"));print(context.read<UserProvider>().role.toString());},
              // color: kPrimaryColor,
              color: Colors.green,
              height: 45,
              width: 45,
              child: const Text(
                "+ New Coursework",
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
