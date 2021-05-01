import 'package:flutter/material.dart';
import 'package:smart_attendance_system/custom_widgets/buttons.dart';
import 'package:smart_attendance_system/custom_widgets/text_field.dart';

class Login extends StatefulWidget {
  static String route = "Login";

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            PhoneNoTextField(controller: phoneController),
            PasswordTextField(controller: passController),
            SignInButton(onClick: (){},),
          ],
        ),
      ),
    );
  }
}
