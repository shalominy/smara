import 'dart:convert';

import 'package:crypto/crypto.dart';
// import 'package:education_app/constants/color.dart';
// import 'package:education_app/dbHelper/mongodb.dart';
// import 'package:education_app/dbHelper/userprovider.dart';
// import 'package:education_app/models/assignstudent_model.dart';
// import 'package:education_app/models/coursework_model.dart';
// import 'package:education_app/models/student_model.dart';
// import 'package:education_app/models/users_modeltemporary.dart';
// import 'package:education_app/routes/route_helper.dart';
// import 'package:education_app/widgets/custom_icon_button.dart';
// import 'package:education_app/widgets/selectmongodbdata.dart';
// import 'package:education_app/widgets/search_testfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mongo_dart/mongo_dart.dart' as m;
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../constants/color.dart';
import '../dbHelper/mongodb.dart';
import '../dbHelper/userprovider.dart';
import '../models/assignstudent_model.dart';
import '../models/coursework_model.dart';
import '../models/student_model.dart';
import '../models/users_modeltemporary.dart';
import '../routes/route_helper.dart';
import '../widgets/custom_icon_button.dart';
import '../widgets/search_testfield.dart';
import '../widgets/selectmongodbdata.dart';

class AddCoursework extends StatefulWidget {
  const AddCoursework({Key? key}) : super(key: key);

  @override
  _AddCoursework createState() => _AddCoursework();
}

class _AddCoursework extends State<AddCoursework> {
  String? coursetype;
  var courseworkname = TextEditingController();
  DateTime? assigneddate;
  DateTime? duedate;
  String? assigneestype;
  List<List<String>> assignees = [];
  var courseworkcontent = TextEditingController();

  // DateTime? date;

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(child: Text("Homework"), value: "homework"),
      const DropdownMenuItem(
          child: Text("Extra Exercise"), value: "extraexercise"),
    ];
    return menuItems;
  }

// ignore: unused_field, prefer_final_fields
  bool _isSelected = false;

  String selectedValue = "homework";

  List<List<String>> _selectedStudents = [];
  List<List<String>> _selectedClasses = [];
  // List<String> _selectedItems = [];

  bool isContent1Visible = false;
  bool isContent2Visible = false;
  bool isContent3Visible = false;
  bool isContent4Visible = false;
  TextEditingController textController1 = TextEditingController();
  TextEditingController textController2 = TextEditingController();

  void _showSelectStudents() async {
    // a list of selectable items
    // these items can be hard-coded or dynamically fetched from a database/API
    // final List<List<String>> items = [
    // final List<String> items = [
    // ['Flutter', '1111'],
    // ['Node.js', '22222'],
    // ['Reacnative'],
    // ['Java', '4444'],
    //   'Node.js',
    //   'React Native',
    //   'Java',
    //   'Docker',
    //   'MySQL'
    // ];

    final List<List<String>>? results = await showDialog(
      // final List<String>? results = await showDialog(
      context: context,
      builder: (BuildContext context) {
        // return  MultiSelect(items: MongoDatabase.getstudentstocoursework(),
        //  selecteditems: _selectedItems);
        return FutureBuilder(
          future: MongoDatabase.getstudents(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              // var totalData = snapshot.data.length;
              // print("Total Data" + totalData.toString());
              // return ListView.builder(
              //     itemCount: snapshot.data.length,
              //     itemBuilder: (context, index) {
              //       return
              //       StudentCheckbox(
              //           selecteditems: _selectedItems.toList(),
              //           students: StudentModel.fromJson(
              //               snapshot.data[index]
              //               ));
              //     });
              final List<Map<String, dynamic>> items = snapshot.data!;

              final List<List<String>> studentsList = items.map((map) {
                return map.values.map((value) => value.toString()).toList();
              }).toList();

              final List<String> itemNames =
                  items.map((map) => map['name'] as String).toList();

              print('item list' + studentsList.toString());
              print('selecteditem' + _selectedStudents.toString());

              return SelectMongodbData(
                  items: studentsList, selecteditems: _selectedStudents);
              // MultiSelect(items: itemNames,
              // selecteditems: _selectedItems);
            } else {
              return const Center(
                child: Text("No Data Available"),
              );
            }
          },
        );
      },
    );

    // Update UI
    if (results != null) {
      setState(() {
        _selectedStudents = results;
      });
    }
  }

  void _showSelectClasses() async {
    final List<List<String>>? results = await showDialog(
      // final List<String>? results = await showDialog(
      context: context,
      builder: (BuildContext context) {
        // return  MultiSelect(items: MongoDatabase.getstudentstocoursework(),
        //  selecteditems: _selectedItems);
        return FutureBuilder(
          future: MongoDatabase.getclasses(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              // var totalData = snapshot.data.length;
              // print("Total Data" + totalData.toString());
              // return ListView.builder(
              //     itemCount: snapshot.data.length,
              //     itemBuilder: (context, index) {
              //       return
              //       StudentCheckbox(
              //           selecteditems: _selectedItems.toList(),
              //           students: StudentModel.fromJson(
              //               snapshot.data[index]
              //               ));
              //     });
              final List<Map<String, dynamic>> items = snapshot.data!;

              final List<List<String>> classesList = items.map((map) {
                return map.values.map((value) => value.toString()).toList();
              }).toList();

              final List<String> itemNames =
                  items.map((map) => map['name'] as String).toList();

              print('item list' + classesList.toString());
              print('selecteditem' + _selectedClasses.toString());

              return SelectMongodbData(
                  items: classesList, selecteditems: _selectedClasses);
              // MultiSelect(items: itemNames,
              // selecteditems: _selectedItems);
            } else {
              return const Center(
                child: Text("No Data Available"),
              );
            }
          },
        );
      },
    );

    // Update UI
    if (results != null) {
      setState(() {
        _selectedStudents = results;
      });
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    setState(() {
      assigneddate = DateTime.now();
    });

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != assigneddate) {
      setState(() {
        assigneddate = picked;
      });
    }
  }

  String _getFormattedDate() {
    if (assigneddate != null) {
      return DateFormat('EEEE, MMMM d, y').format(assigneddate!);
    } else {
      return 'No date selected';
    }
  }

  Future<void> _selectDueDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != duedate) {
      setState(() {
        duedate = picked;
      });
    }
  }

  String _getFormattedDueDate() {
    if (duedate != null) {
      return DateFormat('EEEE, MMMM d, y').format(duedate!);
    } else {
      return 'No date selected';
    }
  }

  @override
  Widget build(BuildContext context) {
    m.ObjectId teacherid = m.ObjectId.parse(
        // ignore: unnecessary_string_interpolations
        '${context.watch<UserProvider>().id}'.substring(10, 34));
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
              SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IntrinsicHeight(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10),
                  child: Stack(
                    children: [
                      Align(
                        child: Text(
                          'Add Coursework',
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                      ),
                      Positioned(
                        left: 0,
                        child: CustomIconButton(
                          child: const Icon(Icons.arrow_back),
                          height: 35,
                          width: 35,
                          onTap: () => Navigator.pop(context),
                        ),
                      ),
                      // Scaffold(
                      //     body: SafeArea(
                      //         child: FutureBuilder(
                      //             future: MongoDatabase.getstudents(),
                      //             builder: (context, AsyncSnapshot snapshot) {
                      //               if (snapshot.hasData) {
                      //                 var totalData = snapshot.data.length;
                      //                 print("Total Data" + totalData.toString());
                      //                 return ListView.builder(
                      //                     itemCount: snapshot.data.length,
                      //                     itemBuilder: (context, index) {
                      //                       return StudentCard(
                      //                           StudentModel.fromJson(
                      //                               snapshot.data[index]));
                      //                     });
                      //               } else {
                      //                 return Center(
                      //                   child: Text("No Data Available"),
                      //                 );
                      //               }
                      //             })))
                    ],
                  ),
                )
                    // Stack(
                    //   children: [
                    //     Align(
                    //       child: Text(
                    //         'Student List',
                    //         style: Theme.of(context).textTheme.displayMedium,
                    //       ),
                    //     ),

                    //     Positioned(
                    //       left: 0,
                    //       child: CustomIconButton(
                    //         child: const Icon(Icons.arrow_back),
                    //         height: 35,
                    //         width: 35,
                    //         onTap: () => Navigator.pop(context),
                    //       ),
                    //     ),

                    //   ],
                    // ),
                    ),

                // const AppBar(),
                const SizedBox(
                  height: 15,
                ),
                // const AppBar(),
                const SizedBox(
                  height: 10,
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Add New Coursework",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  child: ListBody(
                    children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Align(
                            //   child: Text(
                            //     "Courework Details",
                            //     style: Theme.of(context).textTheme.bodyMedium,
                            //   ),
                            // ),
                            const SizedBox(
                              height: 15,
                            ),
                            // Text(
                            //   "Student Information",
                            //   style: Theme.of(context).textTheme.bodyMedium,
                            // ),
                            // Padding(
                            //   padding: const EdgeInsets.all(10),
                            //   child: DropdownButtonFormField(

                            //       style: TextStyle(
                            //         fontSize: 20,
                            //         color: Colors.grey,
                            //         fontWeight: FontWeight.lerp(
                            //             FontWeight.w500, FontWeight.w400, 0.5),
                            //         overflow: TextOverflow.visible,
                            //       ),
                            //       decoration: const InputDecoration(
                            //         // hintStyle: TextStyle(fontSize: 20, color: Colors.grey),
                            //         floatingLabelBehavior:
                            //             FloatingLabelBehavior.never,
                            //         // labelText: "Student Transcript",
                            //         filled: true,
                            //         fillColor: Colors.white,
                            //         border: OutlineInputBorder(
                            //             // borderRadius: BorderRadius.circular(40),
                            //             ),
                            //         // isDense: true,
                            //         enabledBorder: OutlineInputBorder(
                            //           borderSide: BorderSide(
                            //               color: Colors.black, width: 1),
                            //           // borderRadius: BorderRadius.circular(20),
                            //         ),
                            //       ),
                            //       dropdownColor: Colors.white,
                            //       value: selectedValue,
                            //       onChanged: (String? newValue) {
                            //         setState(() {
                            //           selectedValue = newValue!;
                            //         });
                            //       },
                            //       items: dropdownItems),
                            // ),
                            // DropDownContentButton(
                            //   title: 'Coursework Type',
                            // ),
                            Column(
                              children: [
                                SizedBox(
                                  width: double
                                      .infinity, // Make the width of the content match its parent button
                                  child: OutlinedButton(
                                      onPressed: () {
                                        setState(() {
                                          isContent1Visible =
                                              !isContent1Visible;
                                        });
                                      },
                                      style: ButtonStyle(
                                        shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(0),
                                          ),
                                        ),
                                        minimumSize:
                                            MaterialStateProperty.all<Size>(
                                          const Size(double.infinity,
                                              48), // Set the width to fill the available space
                                        ),
                                      ),
                                      child: const Row(
                                        children: [
                                          Text(
                                            'Coursework Type',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20),
                                          ),
                                          Icon(
                                            Icons.arrow_drop_down,
                                            color: Colors.black,
                                          ),
                                        ],
                                      )),
                                ),
                                if (isContent1Visible)
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    color: Colors.grey[200],
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text('Select Coursework Type'),
                                        const SizedBox(height: 10),
                                        DropdownButtonFormField(
                                          value: coursetype,
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.black,
                                            fontWeight: FontWeight.lerp(
                                                FontWeight.w500,
                                                FontWeight.w400,
                                                0.5),
                                            overflow: TextOverflow.visible,
                                          ),
                                          decoration: InputDecoration(
                                            hintText: "Select Course Type",
                                            hintStyle: TextStyle(
                                              fontSize: 20,
                                              color: Colors.grey,
                                              fontWeight: FontWeight.lerp(
                                                  FontWeight.w500,
                                                  FontWeight.w400,
                                                  0.5),
                                              overflow: TextOverflow.visible,
                                            ),
                                            floatingLabelBehavior:
                                                FloatingLabelBehavior.never,
                                            // labelText: "Student Transcript",
                                            // filled: true,
                                            // fillColor: Colors.white,
                                            border: const OutlineInputBorder(
                                                // borderRadius: BorderRadius.circular(40),
                                                ),
                                            // isDense: true,
                                            enabledBorder:
                                                const OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.black,
                                                  width: 1),
                                              // borderRadius: BorderRadius.circular(20),
                                            ),
                                          ),
                                          isExpanded:
                                              true, // Ensure the dropdown opens below the button
                                          items: const [
                                            DropdownMenuItem(
                                              value: "homework",
                                              child: Text("Homework"),
                                            ),
                                            DropdownMenuItem(
                                              value: "extraexercise",
                                              child: Text("Extra Exercise"),
                                            ),
                                            // Add more items as needed
                                          ],
                                          onChanged: (value) {
                                            coursetype = value.toString();
                                            // Handle the selected value
                                          },
                                        ),
                                        // const SizedBox(height: 10),
                                        // TextField(
                                        //   controller: textController2,
                                        //   decoration: const InputDecoration(
                                        //     labelText: 'Text Input 2',
                                        //     border: OutlineInputBorder(),
                                        //   ),
                                        // ),
                                      ],
                                    ),
                                  ),
                              ],
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  width: double
                                      .infinity, // Make the width of the content match its parent button
                                  child: OutlinedButton(
                                      onPressed: () {
                                        setState(() {
                                          isContent2Visible =
                                              !isContent2Visible;
                                        });
                                      },
                                      style: ButtonStyle(
                                        shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(0),
                                          ),
                                        ),
                                        minimumSize:
                                            MaterialStateProperty.all<Size>(
                                          const Size(double.infinity,
                                              48), // Set the width to fill the available space
                                        ),
                                      ),
                                      child: const Row(
                                        children: [
                                          Text(
                                            'Coursework Details',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20),
                                          ),
                                          Icon(
                                            Icons.arrow_drop_down,
                                            color: Colors.black,
                                          ),
                                        ],
                                      )),
                                ),
                                if (isContent2Visible)
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    color: Colors.grey[200],
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text('Coursework Details'),
                                        const SizedBox(height: 10),
                                        TextField(
                                          controller: courseworkname,
                                          decoration: InputDecoration(
                                            labelStyle: TextStyle(
                                              fontSize: 20,
                                              color: Colors.grey,
                                              fontWeight: FontWeight.lerp(
                                                  FontWeight.w500,
                                                  FontWeight.w400,
                                                  0.5),
                                              overflow: TextOverflow.visible,
                                            ),
                                            labelText: 'Coursework Name',
                                            border: const OutlineInputBorder(),
                                            floatingLabelStyle: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black,
                                              fontWeight: FontWeight.lerp(
                                                  FontWeight.w500,
                                                  FontWeight.w400,
                                                  0.5),
                                              overflow: TextOverflow.visible,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        const Text('Assigned Date'),
                                        const SizedBox(height: 10),
                                        GestureDetector(
                                          onTap: () => _selectDate(context),
                                          child: Container(
                                              alignment: Alignment.centerLeft,
                                              width: double.infinity,
                                              height: 60,
                                              decoration: BoxDecoration(
                                                color: Colors.transparent,
                                                border: Border.all(
                                                    color: Colors.black,
                                                    width: 1.0), // Add border
                                                borderRadius: BorderRadius.circular(
                                                    5.0), // Optional: Add border radius
                                              ),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal:
                                                          16.0), // Add padding
                                              child: Row(
                                                children: [
                                                  Text(
                                                    _getFormattedDate(),
                                                    style: const TextStyle(
                                                      color: Colors
                                                          .black, // Set text color
                                                      fontSize: 20.0,
                                                      // fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                  const Icon(
                                                    Icons.arrow_drop_down,
                                                    color: Colors.black,
                                                  ),
                                                ],
                                              )),
                                        ),
                                        const SizedBox(height: 10),
                                        const Text('Due Date'),
                                        const SizedBox(height: 10),
                                        GestureDetector(
                                          onTap: () => _selectDueDate(context),
                                          child: Container(
                                              alignment: Alignment.centerLeft,
                                              width: double.infinity,
                                              height: 60,
                                              decoration: BoxDecoration(
                                                color: Colors.transparent,
                                                border: Border.all(
                                                    color: Colors.black,
                                                    width: 1.0), // Add border
                                                borderRadius: BorderRadius.circular(
                                                    5.0), // Optional: Add border radius
                                              ),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal:
                                                          16.0), // Add padding
                                              child: Row(
                                                children: [
                                                  Text(
                                                    _getFormattedDueDate(),
                                                    style: const TextStyle(
                                                      color: Colors
                                                          .black, // Set text color
                                                      fontSize: 20.0,
                                                      // fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                  const Icon(
                                                    Icons.arrow_drop_down,
                                                    color: Colors.black,
                                                  ),
                                                ],
                                              )),
                                        ),
                                      ],
                                    ),
                                  ),
                              ],
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  width: double
                                      .infinity, // Make the width of the content match its parent button
                                  child: OutlinedButton(
                                      onPressed: () {
                                        setState(() {
                                          isContent3Visible =
                                              !isContent3Visible;
                                        });
                                      },
                                      style: ButtonStyle(
                                        shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(0),
                                          ),
                                        ),
                                        minimumSize:
                                            MaterialStateProperty.all<Size>(
                                          const Size(double.infinity,
                                              48), // Set the width to fill the available space
                                        ),
                                      ),
                                      child: const Row(
                                        children: [
                                          Text(
                                            'Coursework Assign',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20),
                                          ),
                                          Icon(
                                            Icons.arrow_drop_down,
                                            color: Colors.black,
                                          ),
                                        ],
                                      )),
                                ),
                                if (isContent3Visible)
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    color: Colors.grey[200],
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text('Assignees'),
                                        const SizedBox(height: 10),
                                        DropdownButtonFormField(
                                          value: assigneestype,
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.black,
                                            fontWeight: FontWeight.lerp(
                                                FontWeight.w500,
                                                FontWeight.w400,
                                                0.5),
                                            overflow: TextOverflow.visible,
                                          ),
                                          decoration: InputDecoration(
                                            hintText: "Class / Students",
                                            hintStyle: TextStyle(
                                              fontSize: 20,
                                              color: Colors.grey,
                                              fontWeight: FontWeight.lerp(
                                                  FontWeight.w500,
                                                  FontWeight.w400,
                                                  0.5),
                                              overflow: TextOverflow.visible,
                                            ),
                                            floatingLabelBehavior:
                                                FloatingLabelBehavior.never,
                                            // labelText: "Student Transcript",
                                            // filled: true,
                                            // fillColor: Colors.white,
                                            border: const OutlineInputBorder(
                                                // borderRadius: BorderRadius.circular(40),
                                                ),
                                            // isDense: true,
                                            enabledBorder:
                                                const OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.black,
                                                  width: 1),
                                              // borderRadius: BorderRadius.circular(20),
                                            ),
                                          ),
                                          isExpanded:
                                              true, // Ensure the dropdown opens below the button
                                          items: const [
                                            DropdownMenuItem(
                                              value: "class",
                                              child: Text("Class"),
                                            ),
                                            DropdownMenuItem(
                                              value: "student",
                                              child: Text("Student"),
                                            ),
                                            // Add more items as needed
                                          ],
                                          onChanged: (value) {
                                            setState(() {
                                              assigneestype = value.toString();
                                              _selectedStudents = [];
                                              _selectedClasses = [];
                                              assignees = [];
                                            });
                                            // coursetype = value.toString();
                                            // Handle the selected value
                                          },
                                        ),
                                        // TextField(
                                        //   controller: courseworkname,
                                        //   decoration: InputDecoration(
                                        //     labelStyle: TextStyle(
                                        //       fontSize: 20,
                                        //       color: Colors.grey,
                                        //       fontWeight: FontWeight.lerp(
                                        //           FontWeight.w500,
                                        //           FontWeight.w400,
                                        //           0.5),
                                        //       overflow: TextOverflow.visible,
                                        //     ),
                                        //     labelText: 'zzzzzzzzzzzzz',
                                        //     border: const OutlineInputBorder(),
                                        //     floatingLabelStyle: TextStyle(
                                        //       fontSize: 20,
                                        //       color: Colors.black,
                                        //       fontWeight: FontWeight.lerp(
                                        //           FontWeight.w500,
                                        //           FontWeight.w400,
                                        //           0.5),
                                        //       overflow: TextOverflow.visible,
                                        //     ),
                                        //   ),
                                        // ),

                                        const SizedBox(height: 10),
                                        if (assigneestype == 'student')
                                          Column(
                                            children: [
                                              Center(
                                                child:
                                                    // Padding(
                                                    // padding: const EdgeInsets.all(15.0),
                                                    // child:
                                                    Table(
                                                  border: TableBorder.all(
                                                      color: Colors.white30),
                                                  defaultVerticalAlignment:
                                                      TableCellVerticalAlignment
                                                          .middle,
                                                  children: [
                                                    TableRow(
                                                      decoration:
                                                          const BoxDecoration(
                                                        color: kPrimaryColor,
                                                      ),
                                                      children: [
                                                        CustomIconButton(
                                                          onTap:
                                                              _showSelectStudents,
                                                          height: 45,
                                                          width: 500,
                                                          child: const Text(
                                                            "Add Students",
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 18,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(height: 10),
                                              const TableHeader(),
                                              SizedBox(
                                                height: 100,
                                                child: FutureBuilder(
                                                  future: MongoDatabase
                                                      .getstudentsbyname(
                                                          _selectedStudents
                                                              .map((map) =>
                                                                  map[1])
                                                              .toList()),
                                                  builder: (context,
                                                      AsyncSnapshot snapshot) {
                                                    if (snapshot.hasData) {
                                                      // var totalData =
                                                      //     snapshot.data.length;

                                                      final List<
                                                              Map<String,
                                                                  dynamic>>
                                                          items =
                                                          snapshot.data!;

                                                      final List<List<String>>
                                                          studentsList =
                                                          items.map((map) {
                                                        return map.values
                                                            .map((value) =>
                                                                value
                                                                    .toString())
                                                            .toList();
                                                      }).toList();

                                                      assignees = studentsList;

                                                      print(" selected students"+ _selectedStudents.toString());
                                                      print("items" +
                                                          items.toString());

                                                      print("assignees" +
                                                          assignees.toString());

                                                      print("encode" +
                                                          jsonEncode(assignees
                                                              .toString()));
                                                      // print("Total Data" + totalData.toString());
                                                      // print("Total Data" + snapshot.data.toString());
                                                      return ListView.builder(
                                                          itemCount: snapshot
                                                              .data.length,
                                                          itemBuilder:
                                                              (context, index) {
                                                            return StudentContainer(
                                                                // students: StudentModel.fromJson(snapshot.data[index]));
                                                                students:
                                                                    snapshot.data[
                                                                        index]);
                                                          });
                                                    } else {
                                                      return const Center(
                                                        child: Text(
                                                            "No Data Available"),
                                                      );
                                                    }
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        const SizedBox(height: 10),
                                        if (assigneestype == 'class')
                                          Column(
                                            children: [
                                              Center(
                                                child:
                                                    // Padding(
                                                    // padding: const EdgeInsets.all(15.0),
                                                    // child:
                                                    Table(
                                                  border: TableBorder.all(
                                                      color: Colors.white30),
                                                  defaultVerticalAlignment:
                                                      TableCellVerticalAlignment
                                                          .middle,
                                                  children: [
                                                    TableRow(
                                                      decoration:
                                                          const BoxDecoration(
                                                        color: kPrimaryColor,
                                                      ),
                                                      children: [
                                                        CustomIconButton(
                                                          onTap:
                                                              _showSelectClasses,
                                                          height: 45,
                                                          width: 500,
                                                          child: const Text(
                                                            "Select Class",
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 18,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(height: 10),
                                              TableHeader(),
                                              SizedBox(
                                                height: 100,
                                                child: FutureBuilder(
                                                  future: MongoDatabase
                                                      .getstudentsbyclass(
                                                          _selectedClasses
                                                              .map((map) =>
                                                                  map[1])
                                                              .toList()),
                                                  builder: (context,
                                                      AsyncSnapshot snapshot) {
                                                    if (snapshot.hasData) {
                                                      var totalData =
                                                          snapshot.data.length;

                                                      final List<
                                                              Map<String,
                                                                  dynamic>>
                                                          items =
                                                          snapshot.data!;

                                                      final List<List<String>>
                                                          studentsList =
                                                          items.map((map) {
                                                        return map.values
                                                            .map((value) =>
                                                                value
                                                                    .toString())
                                                            .toList();
                                                      }).toList();

                                                      assignees = studentsList;
                                                      print("assignees" +
                                                          assignees.toString());
                                                      // print("Total Data" + totalData.toString());
                                                      // print("Total Data" + snapshot.data.toString());

                                                      return ListView.builder(
                                                          itemCount: snapshot
                                                              .data.length,
                                                          itemBuilder:
                                                              (context, index) {
                                                            return StudentContainer(
                                                                // students: StudentModel
                                                                //     .fromJson(snapshot
                                                                //             .data[
                                                                //         index]));
                                                                students: snapshot.data[index]);
                                                          });
                                                    } else {
                                                      return const Center(
                                                        child: Text(
                                                            "No Data Available"),
                                                      );
                                                    }
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        const SizedBox(height: 10),
                                      ],
                                    ),
                                  ),
                              ],
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  width: double
                                      .infinity, // Make the width of the content match its parent button
                                  child: OutlinedButton(
                                      onPressed: () {
                                        setState(() {
                                          isContent4Visible =
                                              !isContent4Visible;
                                        });
                                      },
                                      style: ButtonStyle(
                                        shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(0),
                                          ),
                                        ),
                                        minimumSize:
                                            MaterialStateProperty.all<Size>(
                                          const Size(double.infinity,
                                              48), // Set the width to fill the available space
                                        ),
                                      ),
                                      child: const Row(
                                        children: [
                                          Text(
                                            'Coursework Content',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20),
                                          ),
                                          Icon(
                                            Icons.arrow_drop_down,
                                            color: Colors.black,
                                          ),
                                        ],
                                      )),
                                ),
                                if (isContent4Visible)
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    color: Colors.grey[200],
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text('Content'),
                                        const SizedBox(height: 10),
                                        Container(
                                          height: 200,
                                          child: TextField(
                                            expands: true,
                                            textAlignVertical:
                                                TextAlignVertical.top,
                                            maxLines: null,
                                            controller: courseworkcontent,
                                            decoration: InputDecoration(
                                              labelStyle: TextStyle(
                                                fontSize: 20,
                                                color: Colors.grey,
                                                fontWeight: FontWeight.lerp(
                                                    FontWeight.w500,
                                                    FontWeight.w400,
                                                    0.5),
                                                overflow: TextOverflow.visible,
                                              ),
                                              labelText: 'Content',
                                              border:
                                                  const OutlineInputBorder(),
                                              floatingLabelStyle: TextStyle(
                                                fontSize: 20,
                                                color: Colors.black,
                                                fontWeight: FontWeight.lerp(
                                                    FontWeight.w500,
                                                    FontWeight.w400,
                                                    0.5),
                                                overflow: TextOverflow.visible,
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                              ],
                            ),
                            // Padding(
                            //     padding: const EdgeInsets.all(10),
                            //     child: DropdownButtonFormField(
                            //       style: TextStyle(
                            //         fontSize: 20,
                            //         color: Colors.grey,
                            //         fontWeight: FontWeight.lerp(
                            //             FontWeight.w500, FontWeight.w400, 0.5),
                            //         overflow: TextOverflow.visible,
                            //       ),
                            //       decoration: InputDecoration(
                            //         hintText: "sssss",
                            //         hintStyle: TextStyle(
                            //           fontSize: 20,
                            //           color: Colors.grey,
                            //           fontWeight: FontWeight.lerp(
                            //               FontWeight.w500,
                            //               FontWeight.w400,
                            //               0.5),
                            //           overflow: TextOverflow.visible,
                            //         ),
                            //         floatingLabelBehavior:
                            //             FloatingLabelBehavior.never,
                            //         // labelText: "Student Transcript",
                            //         filled: true,
                            //         fillColor: Colors.white,
                            //         border: const OutlineInputBorder(
                            //             // borderRadius: BorderRadius.circular(40),
                            //             ),
                            //         // isDense: true,
                            //         enabledBorder: const OutlineInputBorder(
                            //           borderSide: BorderSide(
                            //               color: Colors.black, width: 1),
                            //           // borderRadius: BorderRadius.circular(20),
                            //         ),
                            //       ),
                            //       isExpanded:
                            //           true, // Ensure the dropdown opens below the button
                            //       items: const [
                            //         DropdownMenuItem(
                            //           value: "1",
                            //           child: Text("Option 1"),
                            //         ),
                            //         DropdownMenuItem(
                            //           value: "a",
                            //           child: Text("r"),
                            //         ),
                            //         // Add more items as needed
                            //       ],
                            //       onChanged: (value) {
                            //         coursetype = value.toString();
                            //         // Handle the selected value
                            //       },
                            //     )),
                            // Padding(
                            //   padding: const EdgeInsets.all(10),
                            //   child: TextFormField(
                            //     controller: username,
                            //     decoration: const InputDecoration(
                            //       hintText: 'Enter User Name',
                            //       hintStyle: TextStyle(
                            //           fontSize: 20, color: Colors.grey),
                            //       floatingLabelBehavior:
                            //           FloatingLabelBehavior.never,
                            //       // labelText: "Student Transcript",
                            //       labelStyle: TextStyle(color: Colors.grey),
                            //       filled: true,
                            //       fillColor: Colors.white,
                            //       border: OutlineInputBorder(
                            //           // borderRadius: BorderRadius.circular(40),
                            //           ),
                            //       isDense: true,
                            //     ),
                            //   ),
                            // ),
                            // Padding(
                            //   padding: const EdgeInsets.all(10),
                            //   child: TextFormField(
                            //     controller: useremail,
                            //     decoration: const InputDecoration(
                            //       hintText: 'Enter User Email',
                            //       hintStyle: TextStyle(
                            //           fontSize: 20, color: Colors.grey),
                            //       floatingLabelBehavior:
                            //           FloatingLabelBehavior.never,
                            //       // labelText: "Student Transcript",
                            //       labelStyle: TextStyle(color: Colors.grey),
                            //       filled: true,
                            //       fillColor: Colors.white,
                            //       border: OutlineInputBorder(
                            //           // borderRadius: BorderRadius.circular(40),
                            //           ),
                            //       isDense: true,
                            //     ),
                            //   ),
                            // ),
                            // Padding(
                            //   padding: const EdgeInsets.all(10),
                            //   child: TextFormField(
                            //     controller: userrole,
                            //     decoration: const InputDecoration(
                            //       hintText: 'Admin, Teacher, Student',
                            //       hintStyle: TextStyle(
                            //           fontSize: 20, color: Colors.grey),
                            //       floatingLabelBehavior:
                            //           FloatingLabelBehavior.never,
                            //       // labelText: "Student Transcript",
                            //       labelStyle: TextStyle(color: Colors.grey),
                            //       filled: true,
                            //       fillColor: Colors.white,
                            //       border: OutlineInputBorder(
                            //           // borderRadius: BorderRadius.circular(40),
                            //           ),
                            //       isDense: true,
                            //     ),
                            //   ),
                            // ),
                            // Padding(
                            //   padding: const EdgeInsets.all(10),
                            //   child: DropdownButtonFormField(
                            //       style: TextStyle(
                            //         fontSize: 20,
                            //         color: Colors.grey,
                            //         fontWeight: FontWeight.lerp(
                            //             FontWeight.w500, FontWeight.w400, 0.5),
                            //         overflow: TextOverflow.visible,
                            //       ),
                            //       decoration: const InputDecoration(
                            //         // hintStyle: TextStyle(fontSize: 20, color: Colors.grey),
                            //         floatingLabelBehavior:
                            //             FloatingLabelBehavior.never,
                            //         // labelText: "Student Transcript",
                            //         filled: true,
                            //         fillColor: Colors.white,
                            //         border: OutlineInputBorder(
                            //             // borderRadius: BorderRadius.circular(40),
                            //             ),
                            //         isDense: true,
                            //         enabledBorder: OutlineInputBorder(
                            //           borderSide: BorderSide(
                            //               color: Colors.black, width: 1),
                            //           // borderRadius: BorderRadius.circular(20),
                            //         ),
                            //         // border: OutlineInputBorder(
                            //         //   borderSide: BorderSide(color: Colors.black, width: 1),
                            //         //   // borderRadius: BorderRadius.circular(20),
                            //         // ),
                            //         // filled: true,
                            //         // fillColor: Colors.white,
                            //       ),
                            //       dropdownColor: Colors.white,
                            //       value: selectedValue,
                            //       onChanged: (String? newValue) {
                            //         setState(() {
                            //           selectedValue = newValue!;
                            //         });
                            //       },
                            //       items: dropdownItems),
                            // ),
                            // Padding(
                            //   padding: const EdgeInsets.all(10),
                            //   child: Column(
                            //     children: [
                            //       CustomIconButton(
                            //         onTap:
                            //             // () {
                            //             _showMultiSelect,

                            //         // _insertDataUser(
                            //         //     username.text, useremail.text, userrole.text);
                            //         // },
                            //         color: kPrimaryColor,
                            //         height: 45,
                            //         width: 500,
                            //         child: const Text(
                            //           "Add Students",
                            //           style: TextStyle(
                            //             color: Colors.white,
                            //             fontSize: 18,
                            //           ),
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ),

                            // Wrap(
                            //   children:
                            //   _selectedStudents
                            //       .map((e) => Chip(
                            //             label: Text(e.toString()),
                            //           ))
                            //       .toList(),
                            //   // _selectedItems.map((map) => map['name'] as String).toList(),
                            // ),
                            // const TableHeader(),
                            // SizedBox(
                            //   height: 100,
                            //   child: FutureBuilder(
                            //     future: MongoDatabase.getstudentsbyid(
                            //         _selectedItems
                            //             .map((map) => map[1])
                            //             .toList()),
                            //     builder: (context, AsyncSnapshot snapshot) {
                            //       if (snapshot.hasData) {
                            //         var totalData = snapshot.data.length;
                            //         // print("Total Data" + totalData.toString());
                            //         // print("Total Data" + snapshot.data.toString());
                            //         return ListView.builder(
                            //             itemCount: snapshot.data.length,
                            //             itemBuilder: (context, index) {
                            //               return StudentContainer(
                            //                   students: StudentModel.fromJson(
                            //                       snapshot.data[index]));
                            //             });
                            //       } else {
                            //         return const Center(
                            //           child: Text("No Data Available"),
                            //         );
                            //       }
                            //     },
                            //   ),
                            // ),
                            // Padding(
                            //   padding: const EdgeInsets.only(
                            //       top: 10, left: 20, right: 20),
                            //   child: Row(
                            //     mainAxisAlignment:
                            //         MainAxisAlignment.spaceBetween,
                            //     children: [
                            //       // Text(
                            //       //   "Update Student",
                            //       //   style: Theme.of(context).textTheme.bodyLarge,
                            //       // ),
                            //       TextButton(
                            //         style: TextButton.styleFrom(
                            //           fixedSize: const Size(150, 45),
                            //         ),
                            //         onPressed: () {
                            //           Navigator.pop(context);
                            //         },
                            //         child: Text(
                            //           "Cancel",
                            //           style: Theme.of(context)
                            //               .textTheme
                            //               .bodyLarge
                            //               ?.copyWith(color: kPrimaryColor),
                            //         ),
                            //       ),
                            //       CustomIconButton(
                            //         onTap: () {
                            //           // _insertDataUser(
                            //           //     username.text, useremail.text, userrole.text);
                            //         },
                            //         color: kPrimaryColor,
                            //         height: 45,
                            //         width: 150,
                            //         child: const Text(
                            //           "Submit",
                            //           style: TextStyle(
                            //             color: Colors.white,
                            //             fontSize: 18,
                            //           ),
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            SizedBox(
                              height: 100,
                            )
                          ])
                    ],
                  ),
                ),
              ],
            ),
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
                    // Expanded(
                    //   child: CustomIconButton(
                    //     // onTap: () {Get.toNamed(RouteHelper.goto("Teacher","AddCoursework"));print(context.read<UserProvider>().role.toString());},
                    //     // onTap: () {Get.toNamed(RouteHelper.goto(context.read<UserProvider>().role.toString(),"AddCoursework"));print(context.read<UserProvider>().role.toString());},
                    //     onTap: () {},
                    //     // color: kPrimaryColor,
                    //     color: Colors.green,
                    //     height: 45,
                    //     width: 45,
                    //     child: const Text(
                    //       "+ New Coursework",
                    //       style: TextStyle(
                    //         color: Colors.white,
                    //         fontSize: 18,
                    //       ),
                    //     ),
                    //   ),
                    // )
                    TextButton(
                      style: TextButton.styleFrom(
                        fixedSize: const Size(150, 45),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Cancel",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(color: kPrimaryColor),
                      ),
                    ),
                    CustomIconButton(
                      onTap: () {
                        // _insertDataUser(
                        //     username.text, useremail.text, userrole.text);

                        _insertCoursework(
                            teacherid,
                            coursetype!,
                            courseworkname.text,
                            assigneddate!,
                            duedate!,
                            assigneestype!,
                            assignees,
                            courseworkcontent.text);
                        // _insertCoursework(coursetype, courseworkname.text, assinggn, sdsd, sssss, assignees, courseworkcontent.text);
                        print("submit pressed");
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

  // Future<void> _insertDataUser(
  //   String username,
  //   String useremail,
  //   String userrole,
  //   String password,
  // ) async {
  //   var _id = m.ObjectId();
  //   var bytes = utf8.encode(password); // data being hashed
  //   var digest = sha1.convert(bytes);

  //   final data = UserModelTemporary(
  //       id: _id, name: username, emel: useremail, role: userrole, password: digest.toString());
  //   await MongoDatabase.insertusertemporary(data);

  //   // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Inserted ID" + _id.oid),));
  //   // _clearAll();
  // }

  // void _clearAll() {
  //   username.text = "";
  //   useremail.text = "";
  //   userrole.text = "";
  // }

  Future<void> _insertCoursework(
      m.ObjectId teacherid,
      String coursetype,
      String courseworkname,
      DateTime assigneddate,
      DateTime duedate,
      String assigneestype,
      List<List<String>> assignees,
      String courseworkcontent) async {
    final List<StudentModel> studentslist = assignees.map((userData) {
      m.ObjectId id = m.ObjectId.parse(userData[0].substring(10, 34));
      String name = userData[1];
      String studentid = userData[2];
      String studentclass = userData[3];
      String gender = userData[4];

      return StudentModel(
        id: id,
        name: name,
        studentid: studentid,
        studentclass: studentclass,
        gender: gender,
      );
    }).toList();

    final List<AssignStudentModel> assignstudent = studentslist.map((userData) {
      StudentModel student = userData;
      String submission = 'ASSIGNED';
      String feedback = "";

      return AssignStudentModel(
          student: student, submission: submission, feedback: feedback);
    }).toList();

    // print(assignstudentModelToJson(submissionstatus));

    final List<String> studentsubmissionstatus = assignstudent.map((userData) {
      return assignstudentModelToJson(userData);
    }).toList();

    var _id = m.ObjectId();

    final data = CourseworkModel(
        id: _id,
        teacherid: teacherid,
        type: coursetype,
        name: courseworkname,
        assigndate: assigneddate,
        duedate: duedate,
        assigneestype: assigneestype,
        assigneeslist: studentsubmissionstatus,
        content: courseworkcontent);
    await MongoDatabase.insertcoursework(data);

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Inserted Coursework " + _id.oid),
    ));
    // _clearAll();

    // Navigator.pop(context);

    Get.toNamed(RouteHelper.goto('Teacher', 'Coursework'));
  }
}

class StudentContainer extends StatelessWidget {
  final students;
  const StudentContainer({Key? key, required this.students}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // StudentModel.fromJson(students);

    // StudentModel(id: students[0], name: students[1], studentid: students[2], studentclass: students[3], gender: students[4]);

    return GestureDetector(
      onTap: () => {},
      //Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //         builder: (context) => const DetailsScreen(
      //               title: "course.name",
      //             ))),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        // padding: const EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ClipRRect(
            //   borderRadius: BorderRadius.circular(10),
            //   child: Image.asset(
            //     course.thumbnail,
            //     height: 60,
            //   ),
            // ),
            // const SizedBox(
            //   width: 10,
            // ),

            Expanded(
              child: Table(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TableRow(
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                    ),
                    children: [
                      TableCell(
                        child: Text(
                          // students.name,
                          students["name"],
                          textScaler: const TextScaler.linear(0.8),
                        ),
                      ),
                      TableCell(
                        child: Text(
                          // students.studentid,
                          students["studentid"],
                          textScaler: const TextScaler.linear(0.8),
                        ),
                      ),
                      TableCell(
                        child: Text(
                          // "students.studentclass",
                          students["studentclass"],
                          textScaler: const TextScaler.linear(0.8),
                        ),
                      ),
                      // TableCell(
                      //   child: Text(
                      //     students.grade,
                      //     textScaler: const TextScaler.linear(0.8),
                      //   ),
                      // ),
                      // TableCell(
                      //   child: Text(
                      //     students.transcript,
                      //     textScaler: const TextScaler.linear(0.8),
                      //   ),
                      // ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StudentCheckbox extends StatelessWidget {
  final StudentModel students;
  final List<String> selecteditems;
  const StudentCheckbox(
      {Key? key, required this.students, required this.selecteditems})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () => Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //         builder: (context) => const DetailsScreen(
      //               title: "course.name",
      //             ))),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        // padding: const EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Table(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TableRow(
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                    ),
                    children: [
                      TableCell(
                          child: Card(
                        child: CheckboxListTile(
                            value: selecteditems.contains(students),
                            // value: true,
                            title: Text(students.name),
                            controlAffinity: ListTileControlAffinity.leading,
                            // onChanged: (isChecked) => _itemChange(item, isChecked!),
                            onChanged: (isChecked) => {}),
                      )),
                      // TableCell(
                      //   child: Text(
                      //     students.name,
                      //     textScaler: const TextScaler.linear(0.8),
                      //   ),
                      // ),
                      // TableCell(
                      //   child: Text(
                      //     students.studentid,
                      //     textScaler: const TextScaler.linear(0.8),
                      //   ),
                      // ),
                      // TableCell(
                      //   child: Text(
                      //     students.studentclass,
                      //     textScaler: const TextScaler.linear(0.8),
                      //   ),
                      // ),
                      // TableCell(
                      //   child: Text(
                      //     students.grade,
                      //     textScaler: const TextScaler.linear(0.8),
                      //   ),
                      // ),
                      // TableCell(
                      //   child: Text(
                      //     students.transcript,
                      //     textScaler: const TextScaler.linear(0.8),
                      //   ),
                      // ),
                    ],
                  ),
                ],
              ),
            ),
          ],
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
              // TableCell(
              //   verticalAlignment: TableCellVerticalAlignment.middle,
              //   child: Padding(
              //     padding: EdgeInsets.all(8.0),
              //     child: Text(
              //       'Grade',
              //       textScaler: TextScaler.linear(0.8),
              //       style: TextStyle(fontWeight: FontWeight.bold),
              //     ),
              //   ),
              // ),
              // TableCell(
              //   verticalAlignment: TableCellVerticalAlignment.middle,
              //   child: Padding(
              //     padding: EdgeInsets.all(0),
              //     child: Text(
              //       'Transcript',
              //       textScaler: TextScaler.linear(0.8),
              //       style: TextStyle(fontWeight: FontWeight.bold),
              //     ),
              //   ),
              // ),
            ],
          ),
        ],
        // )
      ),
    );
  }
}

class AppBar extends StatelessWidget {
  const AppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10, left: 7, right: 7),
      // padding: const EdgeInsets.only(left: 20, right: 20),
      height: 100,
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
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
                "Search Students",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              // CircleButton(
              //   icon: Icons.notifications,
              //   onPressed: () {},
              // ),
            ],
          ),
          const SizedBox(
            height: 3,
          ),
          const SearchTextFieldPlacehold(placeholder: "Search Student")
        ],
      ),
    );
  }
}
