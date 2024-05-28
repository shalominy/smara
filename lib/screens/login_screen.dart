
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
    return
        AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        body: SafeArea(
          bottom: false,
          child:


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

                  SizedBox(height: 30,),

                  Center(child:
                  Positioned(
                    bottom: 0,
                    right: 0,
                    left: 0,
                    child: Image.asset(
                      'assets/images/program_photo.jpg',
                      width: 200.0,
                      height: 200.0,
                      ),
                    ),
                    ),

                  SizedBox(height: 20,),

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


              const SizedBox(
                height: 15,
              ),
              const SizedBox(
                height: 10,
              ),

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


}

class UsersContainer extends StatelessWidget {
  final UserModelTemporary users;
  const UsersContainer({Key? key, required this.users}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      onTap: () {
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
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Align(
                child: Text(users.name + " (" + users.role + ")"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
