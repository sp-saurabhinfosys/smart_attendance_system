import 'package:flutter/material.dart';
import 'package:smart_attendance_system/utils/utils.dart';

class CTextField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final FormFieldValidator<String> validator;
  final TextInputType keyboardType;
  final bool isPass;

  CTextField({this.hint, this.controller, this.validator, this.keyboardType, this.isPass});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        primaryColor: Colors.grey,
      ),
      child: TextFormField(

        obscureText: isPass==null?false:isPass,
        validator: validator,
        cursorColor: Colors.grey,
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          isDense: true,
          hintText: hint,
          labelText: hint,
        ),
      ),
    );
  }
}

class AddClassNameTextField extends StatelessWidget {
  final TextEditingController controller;

  AddClassNameTextField({this.controller});

  @override
  Widget build(BuildContext context) {
    return CTextField(
      controller: controller,
      hint: MyStrings.addClassText,
     // validator: (x) {},
    );
  }
}

class AddSubjectTextField extends StatelessWidget {
  final TextEditingController controller;

  AddSubjectTextField({this.controller});

  @override
  Widget build(BuildContext context) {
    return CTextField(
      controller: controller,
      hint: MyStrings.subjectNameText,
      // validator: (x) {},
    );
  }
}

class NameTextField extends StatelessWidget {
  final TextEditingController controller;

  NameTextField({this.controller});

  @override
  Widget build(BuildContext context) {
    return CTextField(
      controller: controller,
      hint: MyStrings.firstNameText,
     // validator: (x) {},

    );
  }
}

class LastNameTextField extends StatelessWidget {
  final TextEditingController controller;

  LastNameTextField(this.controller);

  @override
  Widget build(BuildContext context) {
    return CTextField(
      controller: controller,
      hint: MyStrings.lastNameText,
     // validator: (x) {},
    );
  }
}

class EnrollmentNoTextField extends StatelessWidget {
  final TextEditingController controller;

  EnrollmentNoTextField({this.controller});

  @override
  Widget build(BuildContext context) {
    return CTextField(
      controller: controller,
      hint: MyStrings.enrollmentNoText,
      //validator: (x) {},
      keyboardType: TextInputType.number,
    );
  }
}

class PhoneNoTextField extends StatelessWidget {
  final TextEditingController controller;

  PhoneNoTextField({this.controller});

  @override
  Widget build(BuildContext context) {
    return CTextField(
      controller: controller,
      hint: MyStrings.phoneNumberText,
     // validator: (x) {},
      keyboardType: TextInputType.phone,
    );
  }
}

class SubjectNameTextField extends StatelessWidget {
  final TextEditingController controller;

  SubjectNameTextField(this.controller);

  @override
  Widget build(BuildContext context) {
    return CTextField(
      controller: controller,
      hint: MyStrings.subjectNameText,
     // validator: (x) {},
    );
  }
}

class EnterBatchNameTextField extends StatelessWidget {
  final TextEditingController controller;

  EnterBatchNameTextField({this.controller});

  @override
  Widget build(BuildContext context) {
    return CTextField(
      controller: controller,
      hint: MyStrings.addBatchText,
      //validator: (x) {},
    );
  }
}

class DeptTextField extends StatelessWidget {
  final TextEditingController controller;

  DeptTextField({this.controller});

  @override
  Widget build(BuildContext context) {
    return   CTextField(
      controller: controller,
      hint: "Department Name",
      //validator: (x) {},
      keyboardType: TextInputType.text,
    );
  }
}

class CollegeNameTextField extends StatelessWidget {
  final TextEditingController controller;

  CollegeNameTextField({this.controller});

  @override
  Widget build(BuildContext context) {
    return   CTextField(
      controller: controller,
      hint: "College Name",
      //validator: (x) {},
      keyboardType: TextInputType.text,
    );
  }
}

class PasswordTextField extends StatelessWidget {
  final TextEditingController controller;
  PasswordTextField({this.controller});

  @override
  Widget build(BuildContext context) {
    return   CTextField(
      controller: controller,
      hint: MyStrings.passwordText,
      //validator: (x) {},
      isPass: true,
    );
  }
}

