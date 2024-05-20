// import 'package:education_app/constants/color.dart';
// import 'package:education_app/dbHelper/mongodb.dart';
// import 'package:education_app/dbHelper/userprovider.dart';
// import 'package:education_app/models/users_modeltemporary.dart';
// import 'package:education_app/routes/route_helper.dart';
// import 'package:education_app/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../constants/color.dart';
import '../dbHelper/mongodb.dart';
import '../dbHelper/userprovider.dart';
import '../models/users_modeltemporary.dart';
import '../routes/route_helper.dart';
import '../widgets/custom_icon_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreen createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  var matric = TextEditingController();
  var password = TextEditingController();
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
                        'Login as User ',
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                    ),
                  ],
                ),
              )),
              SizedBox(
                height: 200,
              ),

              Padding(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: matric,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
                      fontWeight: FontWeight.lerp(
                          FontWeight.w500, FontWeight.w400, 0.5),
                      overflow: TextOverflow.visible,
                    ),
                    labelText: 'Enter User Id (Matric Id) ',
                    border: const OutlineInputBorder(),
                    floatingLabelStyle: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.lerp(
                          FontWeight.w500, FontWeight.w400, 0.5),
                      overflow: TextOverflow.visible,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: password,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
                      fontWeight: FontWeight.lerp(
                          FontWeight.w500, FontWeight.w400, 0.5),
                      overflow: TextOverflow.visible,
                    ),
                    labelText: 'Password',
                    border: const OutlineInputBorder(),
                    floatingLabelStyle: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.lerp(
                          FontWeight.w500, FontWeight.w400, 0.5),
                      overflow: TextOverflow.visible,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(
                        fixedSize: const Size(150, 45),
                      ),
                      onPressed: () {
                        // Navigator.pop(context);
                        Get.toNamed(RouteHelper.gotocontext("Register"));
                      },
                      child: Text(
                        "Register",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(color: kPrimaryColor),
                      ),
                    ),
                    CustomIconButton(
                      onTap: () {
                        MongoDatabase.login(
                            matric.text, password.text, context);
                        // _insertData(studentname.text, studentid.text,
                        //     studentclass.text, studentgender!, context);
                      },
                      color: kPrimaryColor,
                      height: 45,
                      width: 150,
                      child: const Text(
                        "Submit",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // const AppBar(),
              const SizedBox(
                height: 15,
              ),
              const SizedBox(
                height: 10,
              ),
              // const TableHeader(),

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
                      future: MongoDatabase.getusers(),
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          var totalData = snapshot.data.length;
                          print("Total Data" + totalData.toString());
                          // print("All Data" + snapshot.data.toString());
                          return ListView.builder(
                              itemCount: snapshot.data.length,
                              itemBuilder: (context, index) {
                                return UsersContainer(
                                    users: UserModelTemporary.fromJson(
                                        snapshot.data[index]));
                              });
                        } else {
                          return Center(
                            child: Text("No Data Available"),
                          );
                        }
                      })),

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
              const SizedBox(
                height: 10,
              )
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

class UsersContainer extends StatelessWidget {
  final UserModelTemporary users;
  const UsersContainer({Key? key, required this.users}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () => Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //         builder: (context) => const BaseScreen())),
      onTap: () {
        // MongoDatabase.getstudents(context);
        context.read<UserProvider>().setuser(users);

        Get.toNamed(RouteHelper.gotocontext(users.role));
      },
      child: Padding(
        padding:
            const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
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
                child: Text(users.name + " (" + users.role + ")"),
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
