import 'package:flutter/material.dart';

class CButton extends StatelessWidget {
  final String title;
  final VoidCallback onClick;

  CButton({this.title, this.onClick});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onClick, child: Text("$title"));
  }
}


class DoneButton extends StatelessWidget {
  final VoidCallback onClick;

  DoneButton({this.onClick});

  @override
  Widget build(BuildContext context) {
    return CButton(title: "Done",onClick: onClick,);
  }
}
class SignInButton extends StatelessWidget {
  final VoidCallback onClick;

  SignInButton({this.onClick});

  @override
  Widget build(BuildContext context) {
    return CButton(title: "Sign In",onClick: onClick,);
  }
}
class SignUpButton extends StatelessWidget {
  final VoidCallback onClick;

  SignUpButton({this.onClick});

  @override
  Widget build(BuildContext context) {
    return CButton(title: "Sign Up",onClick: onClick,);
  }
}
class AddStudentButton extends StatelessWidget {
  final VoidCallback onClick;

  AddStudentButton({this.onClick});

  @override
  Widget build(BuildContext context) {
    return CButton(title: "Add Student",onClick: onClick,);
  }
}
class EditButton extends StatelessWidget {
  final VoidCallback onClick;

  EditButton({this.onClick});

  @override
  Widget build(BuildContext context) {
    return CButton(title: "Edit",onClick: onClick,);
  }
}
class GenerateQRButton extends StatelessWidget {
  final VoidCallback onClick;

  GenerateQRButton({this.onClick});

  @override
  Widget build(BuildContext context) {
    return CButton(title: "Generate QR",onClick: onClick,);
  }
}

class ViewButton extends StatelessWidget {
  final VoidCallback onClick;
  ViewButton({this.onClick});
  @override
  Widget build(BuildContext context) {
    return CButton(title: "View",onClick: onClick,);
  }
}
class AddClassButton extends StatelessWidget {
  final VoidCallback onClick;

  AddClassButton({this.onClick});

  @override
  Widget build(BuildContext context) {
    return CButton(title: "Add Class",onClick: onClick,);
  }
}
class AddSubjectButton extends StatelessWidget {
  final VoidCallback onClick;

  AddSubjectButton({this.onClick});

  @override
  Widget build(BuildContext context) {
    return CButton(title: "Add Class",onClick: onClick,);
  }
}