import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:smart_attendance_system/screens/add_dashboard.dart';
import 'package:smart_attendance_system/screens/add_subject.dart';
import 'package:smart_attendance_system/screens/admin_dashboard.dart';
import 'package:smart_attendance_system/screens/class_list.dart';
import 'package:smart_attendance_system/screens/create_class.dart';
import 'package:smart_attendance_system/screens/create_student.dart';
import 'package:smart_attendance_system/screens/generate_qr.dart';
import 'package:smart_attendance_system/screens/share_qr.dart';
import 'package:smart_attendance_system/screens/sign_up.dart';
import 'package:smart_attendance_system/screens/subject_list.dart';
import 'package:smart_attendance_system/screens/view_attendance_1.dart';
import 'package:smart_attendance_system/screens/view_attendance_2.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Apani Attendance',
        routes: {
          Dashboard.route: (context) => Dashboard(),
          AddDashboard.route: (context) => AddDashboard(),
          ClassList.route: (context) => ClassList(),
          CreateClass.route: (context) => CreateClass(),
          SubjectList.route: (context) => SubjectList(),
          AddSubject.route: (context) => AddSubject(),
          CreateStudent.route:(context)=>CreateStudent(),
          GenerateQr.route:(context)=>GenerateQr(),
          ShareQr.route:(context)=>ShareQr(),
          ViewAttendance1.route:(context)=>ViewAttendance1(),
          ViewAttendance2.route:(context)=>ViewAttendance2(),

        },
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SignUp());
  }
}

// Change subject name in addSubject
//getAllSubject
//QuerySnapshot collectionRef =await  FirebaseFirestore.instance.collection("college").doc(MyStrings.userInfo['cid']).collection(MyStrings.userInfo['dept']).doc(MyStrings.userInfo['dept'].replaceAll(" ", "")).collection("Classes").doc("Sem5CPD").collection('Subjects').get();