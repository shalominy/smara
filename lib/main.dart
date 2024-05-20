// import 'package:education_app/dbHelper/mongodb.dart';
// import 'package:education_app/dbHelper/userprovider.dart';
// import 'package:education_app/routes/route_helper.dart';
// // import 'package:education_app/screens/addcoursework_screen.dart';
// // import 'package:education_app/screens/base_screen.dart';
// import 'package:education_app/screens/login_screen.dart';
// // import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:provider/provider.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:smart_hub/screens/testdb_screen.dart';

import 'dbHelper/mongodb.dart';
import 'dbHelper/userprovider.dart';
import 'routes/route_helper.dart';
import 'screens/login_screen.dart';
import 'screens/teacherdetails_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MongoDatabase.connect();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

// class Counter with ChangeNotifier, DiagnosticableTreeMixin {
//   int _count = 222;

//   int get count => _count;

//   // int get counttambahsatu => _count + 1;

//   void increment() {
//     _count++;
//     notifyListeners();
//   }

//   void setto2881() {
//   _count = 2881;
//     notifyListeners();

//   }

//   /// Makes `Counter` readable inside the devtools by listing all of its properties
//   @override
//   void debugFillProperties(DiagnosticPropertiesBuilder properties) {
//     super.debugFillProperties(properties);
//     properties.add(IntProperty('count', count));
//   }
// }

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LOLLY HUB',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Poppins',
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
          bodyLarge: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
          bodyMedium: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          displayMedium: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 18,
            color: Colors.black,
          ),
        ),
      ),
      home: const SafeArea(child: LoginScreen()) ,
      // home: const SafeArea(child: TestDbLogin()),
      // home: const SafeArea(child: TeacherDetailsScreen()),
      initialRoute: RouteHelper.initial,
      getPages: RouteHelper.routes,
    );
  }
}
