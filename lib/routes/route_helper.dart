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
import 'package:smart_hub/models/coursework_model.dart';
import 'package:smart_hub/screens/studentbase_screen.dart';
// import 'package:education_app/screens/studentlist_screen.dart';

import '../screens/addcoursework_screen.dart';
import '../screens/addfeedback_screen.dart';
import '../screens/addmaterialnotice_screen.dart';
import '../screens/adminbase_screen.dart';
import '../screens/generateregistrationcode_screen.dart';
import '../screens/login_screen.dart';
import '../screens/parentbase_screen.dart';
import '../screens/register_screen.dart';
import '../screens/roleregistrationcodes_screen.dart';
import '../screens/studentdetails_screen.dart';
import '../screens/studentlist_screen.dart';
import '../screens/teacherbase_screen.dart';
import '../screens/teachercoursework_screen.dart';
import '../screens/teacherdetails_screen.dart';
import '../screens/teacherlist_screen.dart';
import '../screens/uploadstudent_screen.dart';
import '../screens/uploadteacher_screen.dart';
import '../screens/uploaduser_screen.dart';
import '../screens/userdetails_screen.dart';
import '../screens/userlist_screen.dart';

class RouteHelper {
  static const String initial = "/";
  static const String login = "/Login";
  static const String register = "/Register";
  static const String listteacher = "/Admin/TeacherList";
  static const String listteacherdetails = "/Admin/TeacherDetails";
  static const String liststudent = "/Admin/StudentList";
  static const String listuser = "/Admin/UserList";
  static const String listuserdetails = "/Admin/UserDetails";
  static const String liststudentdetails = "/Admin/StudentDetails";
  static const String uploadstudentdata = "/Admin/UploadStudentData";
  static const String uploadteacherdata = "/Admin/UploadTeacherData";
  static const String uploaduserdata = "/Admin/UploadUserData";
  static const String generateregistrationcode = "/Admin/GenerateRegCode";
  static const String roleregistrationcodes = "/Admin/RoleRegCode";
  // static const String generatestudentregistrationcode = "/Admin/GenerateStudentRegCode";
  // static const String generateteacherregistrationcode = "/Admin/GenerateTeacherRegCode";
  // static const String generateadminregistrationcode = "/Admin/GenerateAdminRegCode";
  // static const String generateparentsregistrationcode = "/Admin/GenerateParentsRegCode";
  static const String adminContext = "/Admin";
  static const String teacherContext = "/Teacher";
  static const String studentContext = "/Student";
  static const String parentContext = "/Parent";
  static const String teacheraddcoursework = "/Teacher/AddCoursework";
  static const String teachermaterialnotice = "/Teacher/AddMaterialNotice";
  static const String teacheraddfeedback = "/Teacher/AddFeedback";

  static String goto(String usercontextrole, String module) =>'/$usercontextrole/$module';
  static String getlist(String role, String kategori) => '/$role/$kategori';
  static String gotocontext(String usercontext) => '/$usercontext';
  static String loginscreen() => '/Login';
  static void navigateTo(String routeName, {dynamic arguments}) { Get.toNamed(routeName, arguments: arguments);}

  static List<GetPage> routes = [
    GetPage(name: initial, page: () => const LoginScreen()),
    GetPage(name: login, page: () => const LoginScreen()),
    GetPage(name: register, page: () => const RegisterScreen()),
    GetPage(name: listteacher, page: () => const TeacherListScreen()),
    GetPage(name: listteacherdetails, page: () => const TeacherDetailsScreen()),
    GetPage(name: liststudent, page: () => const StudentListScreen()),
    GetPage(name: liststudentdetails, page: () => const StudentDetailsScreen()),
    GetPage(name: listuser, page: () => const UserListScreen()),
    GetPage(name: listuserdetails, page: () => const UserDetailsScreen()),
    GetPage(name: teacherContext, page: () => const TeacherBaseScreen()),
    GetPage(name: adminContext, page: () => const AdminBaseScreen()),
    GetPage(name: studentContext, page: () => const StudentBaseScreen()),
    GetPage(name: parentContext, page: () => const ParentBaseScreen()),
    GetPage(name: teacheraddcoursework, page: () => const AddCoursework()),
    GetPage(name: uploadstudentdata, page: () => const UploadStudent()),
    GetPage(name: uploadteacherdata, page: () => const UploadTeacher()),
    GetPage(name: uploaduserdata, page: () => const UploadUser()),
    GetPage(name: generateregistrationcode, page: () => const GenerateRegistrationCode()),
    // GetPage(name: generatestudentregistrationcode,page: () => const GenerateRegistrationCode()),
    // GetPage(name: generateparentsregistrationcode,page: () => const GenerateRegistrationCode()),
    // GetPage(name: generateadminregistrationcode,page: () => const GenerateRegistrationCode()),
    // GetPage(name: generateteacherregistrationcode,page: () => const GenerateRegistrationCode()),
    GetPage(name: roleregistrationcodes,page: () => const RoleRegistrationCodes()),
    GetPage(name: teacheraddfeedback, page: () => const AddFeedback()),
    GetPage(name: teachermaterialnotice, page: () => const AddMaterialNotice()),
  ];
}
