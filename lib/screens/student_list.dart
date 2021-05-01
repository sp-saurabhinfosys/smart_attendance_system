import 'package:flutter/material.dart';
import 'package:smart_attendance_system/custom_widgets/student_list_tile.dart';

class StudentList extends StatefulWidget {
  static String route = "StudentList";
  @override
  _StudentListState createState() => _StudentListState();
}

class _StudentListState extends State<StudentList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: StudentListTile()),
    );
  }
}
