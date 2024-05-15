// import 'package:flutter/cupertino.dart';
// import 'package:education_app/screens/details_screen.dart';
// import 'package:education_app/screens/addcoursework_screen.dart';
// import 'package:education_app/screens/generateregistrationcode_screen.dart';
// import 'package:education_app/screens/login_screen.dart';
// import 'package:education_app/screens/register_screen.dart';
// import 'package:education_app/screens/teacherbase_screen.dart';
// import 'package:education_app/screens/adminbase_screen.dart';
// import 'package:education_app/screens/teacherlist_screen.dart';
// import 'package:education_app/screens/uploadstudent_screen.dart';
// import 'package:education_app/screens/uploaduser_screen.dart';
// import 'package:education_app/screens/base_screen.dart';
import 'package:get/get.dart';
// import 'package:education_app/screens/studentlist_screen.dart';

import '../screens/addcoursework_screen.dart';
import '../screens/adminbase_screen.dart';
import '../screens/generateregistrationcode_screen.dart';
import '../screens/login_screen.dart';
import '../screens/register_screen.dart';
import '../screens/studentlist_screen.dart';
import '../screens/teacherbase_screen.dart';
import '../screens/teacherlist_screen.dart';
import '../screens/uploadstudent_screen.dart';
import '../screens/uploaduser_screen.dart';


class RouteHelper{
  static const String initial = "/";
  static const String login = "/Login";
  static const String register = "/Register";
  static const String listteacher = "/Admin/TeacherList";
  static const String liststudent = "/Admin/StudentList";
  static const String uploadstudentdata = "/Admin/UploadStudentData";
  static const String uploaduserdata = "/Admin/UploadUserData";
  static const String generateregistrationcode = "/Admin/GenerateRegCode";
  static const String adminContext = "/Admin";
  static const String teacherContext = "/Teacher";
  static const String teachercoursework = "/Teacher/Coursework";
  static const String teacheraddcoursework = "/Teacher/AddCoursework";
  static const String studentContext = "/Student";

  static String goto(String usercontextrole, String module ) => '/$usercontextrole/$module';
  static String getlist(String role, String kategori) => '/$role/$kategori';
  static String gotocontext(String usercontext) => '/$usercontext';
  static String loginscreen() => '/Login';

  static List<GetPage> routes=[
    GetPage(name: initial, page: () => const LoginScreen()),
    GetPage(name: login, page: () => const LoginScreen()),
    GetPage(name: register, page: () => const RegisterScreen()),
    GetPage(name: listteacher, page: () => const TeacherListScreen()),
    GetPage(name: liststudent, page: () => const StudentListScreen()),
    GetPage(name: teacherContext, page: () => const TeacherBaseScreen()),
    GetPage(name: adminContext, page: () => const AdminBaseScreen()),
    GetPage(name: teachercoursework, page: () => const TeacherBaseScreen()),
    GetPage(name: teacheraddcoursework, page: () => const AddCoursework()),
    GetPage(name: uploadstudentdata, page: () => const UploadStudent()),
    GetPage(name: uploaduserdata, page: () => const UploadUser()),
    GetPage(name: generateregistrationcode, page: () => const GenerateRegistrationCode())
  ];
}