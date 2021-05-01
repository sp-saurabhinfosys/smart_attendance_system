import 'package:flutter/material.dart';
import 'package:smart_attendance_system/custom_widgets/buttons.dart';
import 'package:smart_attendance_system/custom_widgets/custom_dropdown.dart';
import 'package:smart_attendance_system/custom_widgets/text_field.dart';
import 'package:smart_attendance_system/screens/admin_dashboard.dart';
import 'package:smart_attendance_system/utils/database_helper.dart';
import 'package:smart_attendance_system/utils/utils.dart';

class SignUp extends StatefulWidget {
  static String route = "SignUp";

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  TextEditingController phoneController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController collegeController = TextEditingController();
  TextEditingController deptController = TextEditingController();
  String selectedDept;
  String selectedCollege;
  String selectedCollegeId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              NameTextField(controller: nameController),
              PhoneNoTextField(controller: phoneController),
              //College
              CustomDropDown(
                validator: (x) {
                  return x == null ? "Select Value" : null;
                },
                isAlign: true,
                hint: Text("Select College"),
                value: selectedCollege,
                onChanged: (x) {
                  selectedCollege = x;
                  for (int i = 0; i < MyStrings.collegeList.length; i++) {
                    if (MyStrings.collegeList[i].containsValue(selectedCollege)) {
                      selectedCollegeId = MyStrings.collegeList[i]["code"];
                      print(selectedCollegeId);
                      print(MyStrings.collegeList[i]);
                    }
                  }
                  print(MyStrings.collegeList.contains("001"));
                  setState(() {});
                },
                list: MyStrings.collegeList
                    .map((e) =>
                    DropdownMenuItem(
                      child: Container(
                        //width: ,
                          child: Text(e['college_name'], overflow: TextOverflow.clip,)),
                      value: e['college_name'],
                    ))
                    .toList(),
              ),
              //Dept
              CustomDropDown(
                validator: (x) {
                  return x == null ? " " : null;
                },
                isAlign: true,
                hint: Text("Select Department"),
                value: selectedDept,
                onChanged: (x) {
                  selectedDept = x;
                  setState(() {});
                },
                list: MyStrings.department
                    .map((e) =>
                    DropdownMenuItem(
                      child: Container(
                        //width: ,
                          child: Text(e, overflow: TextOverflow.clip,)),
                      value: e,
                    ))
                    .toList(),
              ),
              PasswordTextField(controller: passController),


              SignUpButton(
                  onClick: () async {
                    await DatabaseHelper().signUpMethod(
                        collegeId: selectedCollegeId, departmentName: selectedDept, phoneNo: phoneController.text, map: {
                      "name": nameController.text,
                      "phone": phoneController.text,
                      "college": selectedCollege,
                      "cid": selectedCollegeId,
                      "dept": selectedDept,
                      "password": passController.text
                    });
                    MyStrings.userInfo = { "name": nameController.text,
                      "phone": phoneController.text,
                      "college": selectedCollege,
                      "cid": selectedCollegeId,
                      "dept": selectedDept,
                      "password": passController.text};
                    //Navigator.of(context).pushReplacementNamed(Dashboard.route);
                    Navigator.of(context).pushNamed(Dashboard.route);
                  }

              ),
            ],
          ),
        ),
      ),
    );
  }
}
