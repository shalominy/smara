import 'dart:math';

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
import '../widgets/custom_icon_button.dart';

class GenerateRegistrationCode extends StatefulWidget {
  const GenerateRegistrationCode({Key? key}) : super(key: key);

  @override
  _GenerateRegistrationCode createState() => _GenerateRegistrationCode();
}

class _GenerateRegistrationCode extends State<GenerateRegistrationCode> {
  var username = TextEditingController();
  var password = TextEditingController();
  String randomString = "CODES";

  bool _isButtonEnabled = true;

  @override
  Widget build(BuildContext context) {
    // getregistrationcode();    
    final String roletype = Get.arguments as String;


    return //Scaffold(body: SafeArea(child: FutureBuilder(future: MongoDatabase.getstudents(), builder: (, Asyncsnapshot snapshot) )))
        AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        body: SafeArea(
          bottom: false,
          child: Column(
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
                        'Generate Registration Code ',
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
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Center(
                        child: Text(
                          randomString,
                          style: TextStyle(fontSize: 70),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomIconButton(
                      onTap: () {
                        // Get.toNamed(RouteHelper.loginscreen());

                        // _insertData(studentname.text, studentid.text,
                        //     studentclass.text, studentgender!, context);

                        _isButtonEnabled
                            ? {
                                randomString = generateRandomString(5),

                                setState(() {
                                  // getregistrationcode();

                                  insertnewregistrationcode(roletype ,randomString);

                                  _isButtonEnabled = false;
                                }),

                                Future.delayed(Duration(seconds: 5), () {
                                  setState(() {
                                    getregistrationcode(roletype);
                                    _isButtonEnabled = true;
                                  });
                                }),
                                setState(() {
                                  // randomString = gotcode;
                                }),
                                //print(_isButtonEnabled),
                                //  randomString = generateRandomString(5)
                              }
                            : ScaffoldMessenger.of(context)
                                .showSnackBar(SnackBar(
                                content: Text(
                                    " Please wait 5 seconds before generating a new code again"),
                              ));
                        //  randomString = generateRandomString(5);
                        // print(_isButtonEnabled);
                        // getregistrationcode();
                        print(randomString);

                        // print("New Code Generated ");
                      },
                      color: kPrimaryColor,
                      height: 45,
                      width: 150,
                      child: const Text(
                        "Generate Code",
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
            ],
          ),
        ),
        bottomSheet: BottomSheet(
          onClosing: () {},
          backgroundColor: Colors.white,
          enableDrag: false,
          builder: (context) {
            return SizedBox(
              height: 80,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // TextButton(
                    //   style: TextButton.styleFrom(
                    //     fixedSize: const Size(150, 45),
                    //   ),
                    //   onPressed: () {
                    //     Navigator.pop(context);
                    //   },
                    //   child: Text(
                    //     "Cancel",
                    //     style: Theme.of(context)
                    //         .textTheme
                    //         .bodyLarge
                    //         ?.copyWith(color: kPrimaryColor),
                    //   ),
                    // ),
                    Expanded(
                      child: CustomIconButton(
                        onTap: () {
                          // _insertDataUser(
                          //     username.text, useremail.text, userrole.text);

                          // _insertCoursework(
                          //     teacherid,
                          //     coursetype!,
                          //     courseworkname.text,
                          //     assigneddate!,
                          //     duedate!,
                          //     assigneestype!,
                          //     assignees,
                          //     courseworkcontent.text);
                          // _insertCoursework(coursetype, courseworkname.text, assinggn, sdsd, sssss, assignees, courseworkcontent.text);

                          print("back!");

                          Navigator.pop(context);
                        },
                        // color: kPrimaryColor,
                        // color: Colors.white,
                        height: 45,
                        width: 150,
                        child: const Text(
                          "Back to Home ",
                          style: TextStyle(
                            // color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
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

  Future<String> getregistrationcode(String roletype) async {
    if(roletype == 'Students'){
    String registrationcode = await MongoDatabase.getstudentregistrationcode(context);
    print(registrationcode);
    setState(() {
      randomString = registrationcode;
    });
    return registrationcode;
    } else
    if(roletype == 'Teachers'){
    String registrationcode = await MongoDatabase.getteacherregistrationcode(context);
    print(registrationcode);
    setState(() {
      randomString = registrationcode;
    });
    return registrationcode;
    }else 
    if(roletype == 'Parents'){
    String registrationcode = await MongoDatabase.getparentsregistrationcode(context);
    print(registrationcode);
    setState(() {
      randomString = registrationcode;
    });
    return registrationcode;
    }else 
    if(roletype == 'Admin'){
    String registrationcode = await MongoDatabase.getadminregistrationcode(context);
    print(registrationcode);
    setState(() {
      randomString = registrationcode;
    });
    return registrationcode;
    } else {return 'ROLETYPE ERROR';}
  }

  Future<void> insertnewregistrationcode(String roletype,String newcode) async {
    if     (roletype == 'Teachers') { await MongoDatabase.insertnewteacherregistrationcode(newcode, context);}
    else if(roletype == 'Students') { await MongoDatabase.insertnewstudentregistrationcode(newcode, context);}
    else if(roletype == 'Parents') { await MongoDatabase.insertnewparentsregistrationcode(newcode, context);}
    else if(roletype == 'Admin') { await MongoDatabase.insertnewadminregistrationcode(newcode, context);}
    else {print("roletype is invalid");}
    // print(registrationcode);
    // setState(() {
    // randomString = registrationcode;

    // });
    // return registrationcode;
  }

  String generateRandomString(int length) {
    const chars =
        'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    final rand = Random();
    return List.generate(length, (index) => chars[rand.nextInt(chars.length)])
        .join();
  }
}
