// import 'package:education_app/constants/color.dart';
// import 'package:education_app/constants/icons.dart';
// import 'package:education_app/constants/size.dart';
// import 'package:education_app/screens/featuerd_screen.dart';
// import 'package:education_app/screens/login_screen.dart';
// import 'package:education_app/screens/logout_screen.dart';
// // import 'package:education_app/screens/teachercoursework_screen.dart';
// import 'package:education_app/screens/teachercoursework_screen.dart';
// // import 'package:education_app/screens/update_student.dart';
// import 'package:education_app/screens/uploaddata_screen.dart';
import 'package:flutter/material.dart';

import '../constants/color.dart';
import '../constants/icons.dart';
import '../constants/size.dart';
import 'featuerd_screen.dart';
import 'logout_screen.dart';
import 'parentcoursework_screen.dart';
import 'parentmaterialnotice_screen.dart';
import 'studentcoursework_screen.dart';
import 'studentmaterialnotice_screen.dart';
import 'teachercoursework_screen.dart';
import 'uploaddata_screen.dart';

class ParentBaseScreen extends StatefulWidget {
  const ParentBaseScreen({Key? key}) : super(key: key);

  @override
  _ParentBaseScreen createState() => _ParentBaseScreen();
}

class _ParentBaseScreen extends State<ParentBaseScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    FeaturedScreen(),
    ParentCoursework(),
    ParentMaterialNotice(),
    Logout(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: kPrimaryColor,
          backgroundColor: Colors.white,
          elevation: 0,
          items: [
            BottomNavigationBarItem(
              activeIcon: Image.asset(
                icFeatured,
                height: kBottomNavigationBarItemSize,
              ),
              icon: Image.asset(
                icFeaturedOutlined,
                height: kBottomNavigationBarItemSize,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              activeIcon: Image.asset(
                icLearning,
                height: kBottomNavigationBarItemSize,
              ),
              icon: Image.asset(
                icLearningOutlined,
                height: kBottomNavigationBarItemSize,
              ),
              label: "Coursework",
            ),
            BottomNavigationBarItem(
              activeIcon: Image.asset(
                icWishlist,
                height: kBottomNavigationBarItemSize,
              ),
              icon: Image.asset(
                icWishlistOutlined,
                height: kBottomNavigationBarItemSize,
              ),
              label: "Material\n  Notice  ",
            ),
            BottomNavigationBarItem(
              activeIcon: Image.asset(
                icSetting,
                height: kBottomNavigationBarItemSize,
              ),
              icon: Image.asset(
                icSettingOutlined,
                height: kBottomNavigationBarItemSize,
              ),
              label: "Profile",
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          }),
    );
  }
}
