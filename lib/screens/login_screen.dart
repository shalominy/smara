import 'package:education_app/dbHelper/mongodb.dart';
import 'package:education_app/models/users_modeltemporary.dart';
import 'package:education_app/routes/route_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class UsersListScreen extends StatefulWidget {
  const UsersListScreen({Key? key}) : super(key: key);

  @override
  _UsersListScreen createState() => _UsersListScreen();
}

class _UsersListScreen extends State<UsersListScreen> {
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
        Get.toNamed(RouteHelper.getlist(users.role));
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

class TableHeader extends StatelessWidget {
  const TableHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child:
          // Padding(
          // padding: const EdgeInsets.all(15.0),
          // child:
          Table(
        border: TableBorder.all(color: Colors.white30),
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: const [
          TableRow(
            decoration: BoxDecoration(
              color: Colors.redAccent,
            ),
            children: [
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Name',
                    textScaler: TextScaler.linear(0.8),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Id',
                    textScaler: TextScaler.linear(0.8),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Class',
                    textScaler: TextScaler.linear(0.8),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Grade',
                    textScaler: TextScaler.linear(0.8),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Padding(
                  padding: EdgeInsets.all(0),
                  child: Text(
                    'Transcript',
                    textScaler: TextScaler.linear(0.8),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ],
        // )
      ),
    );
  }
}
