import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mongo_dart/mongo_dart.dart' as m;

import '../constants/color.dart';
import '../dbHelper/mongodb.dart';
import '../models/users_modeltemporary.dart';
import '../widgets/custom_icon_button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreen createState() => _RegisterScreen();
}

class _RegisterScreen extends State<RegisterScreen> {
  var fullname = TextEditingController();
  var username = TextEditingController();
  var matric = TextEditingController();
  var password = TextEditingController();
  var useremail = TextEditingController();
  var secretcode = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        body: SafeArea(
          bottom: false,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 40, bottom: 20),
                    child: Text(
                      'Register',
                      style: Theme.of(context).textTheme.headline4?.copyWith(
                            color: kPrimaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  _buildTextField(fullname, 'Full Name'),
                  _buildTextField(username, 'Username'),
                  _buildTextField(matric, 'Matric Number'),
                  _buildTextField(password, 'Password', obscureText: true),
                  _buildTextField(useremail, 'Email'),
                  _buildTextField(secretcode, 'Secret Code'),
                  const SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
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
                              .bodyText1
                              ?.copyWith(color: kPrimaryColor),
                        ),
                      ),
                      CustomIconButton(
                        onTap: () {
                          _userregister(
                            fullname.text,
                            username.text,
                            matric.text,
                            password.text,
                            useremail.text,
                            secretcode.text,
                            context,
                          );
                        },
                        color: kPrimaryColor,
                        height: 45,
                        width: 150,
                        child: const Text(
                          "Register",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 80),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String hintText,
      {bool obscureText = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(fontSize: 16, color: Colors.grey),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
          isDense: true,
          contentPadding: const EdgeInsets.all(16),
        ),
      ),
    );
  }

  Future<void> _userregister(
    String fullname,
    String username,
    String matric,
    String password,
    String useremail,
    String secretcode,
    BuildContext context,
  ) async {
    var _id = m.ObjectId();
    var bytes = utf8.encode(password);
    var digest = sha1.convert(bytes);
    final data = UserModelTemporary(
      id: _id,
      name: username,
      username: username,
      matric: matric,
      emel: useremail,
      role: "",
      password: digest.toString(),
      children: [],
    );
    await MongoDatabase.userregister(secretcode, data, context);
  }
}
