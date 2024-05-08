import 'package:education_app/dbHelper/mongodb.dart';
import 'package:education_app/dbHelper/userprovider.dart';
import 'package:education_app/models/users_modeltemporary.dart';
import 'package:education_app/routes/route_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreen createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
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
              )
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
                      }))

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
        context.read<UserProvider>().setuser(users);
        // MongoDatabase.setusers(users.id);

        Get.toNamed(RouteHelper.getlist(users.role));
        // MongoDatabase.setuserid(users.id.toString());
        // MongoDatabase.setuserid("users.id.toString()");
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


