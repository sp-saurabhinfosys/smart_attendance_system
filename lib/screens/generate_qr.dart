import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_attendance_system/custom_widgets/buttons.dart';
import 'package:smart_attendance_system/custom_widgets/custom_dropdown.dart';
import 'package:smart_attendance_system/screens/share_qr.dart';
import 'package:smart_attendance_system/utils/database_helper.dart';
import 'package:smart_attendance_system/utils/utils.dart';

class GenerateQr extends StatefulWidget {
  static String route = "GenerateQr";

  @override
  _GenerateQrState createState() => _GenerateQrState();
}

class _GenerateQrState extends State<GenerateQr> {
  String selectedClass;
  String selectedDepartment;
  String selectedSubject;
  List<String> subjectList = [];
  String startingTime = DateTime.now().toIso8601String();
  String endingTime = DateTime.now().toIso8601String();
  List<String> classList = [];

  Future<List<Map<dynamic, dynamic>>> getClasses() async {
    List<Map<dynamic, dynamic>> list = [];
    QuerySnapshot collectionRef = await FirebaseFirestore.instance
        .collection("college")
        .doc(MyStrings.userInfo['cid'])
        .collection(selectedDepartment == null ? MyStrings.userInfo['dept'] : selectedDepartment)
        .doc(selectedDepartment == null ? MyStrings.userInfo['dept'].replaceAll(" ", "") : selectedDepartment.replaceAll(" ", ""))
        .collection("Classes")
        .get();

    setState(() {});
    print("Length ");
    print(collectionRef.docs.length);
    int length = collectionRef.docs.length;
    for (int i = 0; i < length; i++) {
      classList.add(collectionRef.docs[i]['className']);
      //print(collectionRef.docs[i]['subject']);
    }
    print(classList);
    return list;
  }

  Future<List<Map<dynamic, dynamic>>> getSubjects() async {
    List<Map<dynamic, dynamic>> list = [];
    QuerySnapshot collectionRef = await FirebaseFirestore.instance
        .collection("college")
        .doc(MyStrings.userInfo['cid'])
        .collection(selectedDepartment == null ? MyStrings.userInfo['dept'] : selectedDepartment)
        .doc(selectedDepartment == null ? MyStrings.userInfo['dept'].replaceAll(" ", "") : selectedDepartment.replaceAll(" ", ""))
        .collection("Classes")
        .doc(selectedClass.replaceAll(" ", ""))
        .collection("Subjects")
        .get();

    setState(() {});
    print("Length ");
    print(collectionRef.docs.length);
    int length = collectionRef.docs.length;
    for (int i = 0; i < length; i++) {
      subjectList.add(collectionRef.docs[i]['subject']);
      //print(collectionRef.docs[i]['subject']);
    }
    print(subjectList);
    return list;
  }

  Future<List<Map<dynamic, dynamic>>> getStudents() async {
    List<Map<dynamic, dynamic>> list = [];
    QuerySnapshot getStu = await FirebaseFirestore.instance
        .collection("college")
        .doc(MyStrings.userInfo['cid'])
        .collection(selectedDepartment == null ? MyStrings.userInfo['dept'] : selectedDepartment)
        .doc(selectedDepartment == null ? MyStrings.userInfo['dept'].replaceAll(" ", "") : selectedDepartment.replaceAll(" ", ""))
        .collection("Classes")
        .doc(selectedClass.replaceAll(" ", ""))
        .collection("Students")
        .get();

    setState(() {});
    print("Length ");
    print(getStu.docs.length);
    int length = getStu.docs.length;
    for (int i = 0; i < length; i++) {
      await FirebaseFirestore.instance
          .collection("college")
          .doc(MyStrings.userInfo["cid"])
          .collection(selectedDepartment)
          .doc(selectedDepartment.replaceAll(" ", ""))
          .collection("Classes")
          .doc(selectedClass.replaceAll(" ", ""))
          .collection("Students")
          .doc(getStu.docs[i]['enrollment'].replaceAll(" ", ""))
          .collection(selectedSubject)
          .doc("${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}$startingTime$endingTime")
          .set( {
        'subject': selectedSubject,
        "present": false,
        "createdAt": DateTime.now(),
        "createdBy": MyStrings.userInfo['name'],
      },);
      await DatabaseHelper().takeAttendance(
          className: selectedClass,
          collegeId: MyStrings.userInfo["cid"],
          departmentName: selectedDepartment,
          enrollment: getStu.docs[i]['enrollment'],
          date: "${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}$startingTime$endingTime",
          subject: selectedSubject,
          particularStudentInfo: {
            'subject': selectedSubject,
            "present": false,
            "createdAt": DateTime.now(),
            "createdBy": MyStrings.userInfo['name'],
          },
          attendanceInfo: {
            "createdAt": DateTime.now(),
            "createdBy": MyStrings.userInfo['name'],
          });

      //print(collectionRef.docs[i]['subject']);
    }
    print(MyStrings.studentList);
    return list;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getClasses();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SafeArea(
            child: Column(
          children: [
            CustomDropDown(
              validator: (x) {
                return x == null ? "Select Value" : null;
              },
              isAlign: true,
              hint: Text("Select Department"),
              value: selectedDepartment,
              onChanged: (x) {
                selectedDepartment = x;
                classList.clear();
                selectedClass = null;
                getClasses();
                print(selectedDepartment);
                setState(() {});
              },
              list: MyStrings.department
                  .map((e) => DropdownMenuItem(
                        child: Container(
                            //width: ,
                            child: Text(
                          e,
                          overflow: TextOverflow.clip,
                        )),
                        value: e,
                      ))
                  .toList(),
            ),
            classList.length == 0
                ? Container()
                : CustomDropDown(
                    validator: (x) {
                      return x == null ? "Select Value" : null;
                    },
                    isAlign: true,
                    hint: Text("Select Class"),
                    value: selectedClass,
                    onChanged: (x) {
                      selectedClass = x;
                      print(selectedClass);
                      selectedSubject = null;
                      subjectList.clear();
                      getSubjects();
                      setState(() {});
                    },
                    list: classList
                        .map((e) => DropdownMenuItem(
                              child: Container(
                                  //width: ,
                                  child: Text(
                                e,
                                overflow: TextOverflow.clip,
                              )),
                              value: e,
                            ))
                        .toList(),
                  ),
            subjectList.length == 0
                ? Container()
                : CustomDropDown(
                    validator: (x) {
                      return x == null ? "Select Value" : null;
                    },
                    isAlign: true,
                    hint: Text("Select Subject"),
                    value: selectedSubject,
                    onChanged: (x) {
                      selectedSubject = x;
                      print(selectedSubject);

                      setState(() {});
                    },
                    list: subjectList
                        .map((e) => DropdownMenuItem(
                              child: Container(
                                  //width: ,
                                  child: Text(
                                e,
                                overflow: TextOverflow.clip,
                              )),
                              value: e,
                            ))
                        .toList(),
                  ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Starting Time",
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  "Ending Time",
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            Container(
                height: 100,
                child: Row(
                  children: [
                    Expanded(
                        child: CupertinoDatePicker(
                      onDateTimeChanged: (x) {
                        startingTime = x.toIso8601String();
                        print(startingTime);

                        setState(() {});
                      },
                      mode: CupertinoDatePickerMode.time,
                    )),
                    Expanded(
                        child: CupertinoDatePicker(
                      onDateTimeChanged: (x) {
                        endingTime = x.toIso8601String();
                        print(endingTime);
                      },
                      mode: CupertinoDatePickerMode.time,
                    )),
                  ],
                )),
            GenerateQRButton(
              onClick: () async {
                //MyStrings.qrInfo = selectedDepartment + selectedClass + startingTime + endingTime;
                print("Student Comming");
                print("this is class $selectedClass");
                await getStudents();
                print("Student Done");
                await DatabaseHelper().addQrData(qrInfo: {
                  "className": selectedClass,
                  "collegeId": MyStrings.userInfo["cid"],
                  "departmentName": selectedDepartment,
                  "startingTime": startingTime,
                  "endingTime": endingTime,
                  "date": "${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}",
                  "subject": selectedSubject,
                  "createdAt": DateTime.now(),
                  "createdBy": MyStrings.userInfo['name'],
                });
                // "collegeId": MyStrings.userInfo["cid"],
                // "departmentName": selectedDepartment,
                // "startingTime": startingTime,
                // "endingTime": endingTime,
                // "date": "${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}",
                // "subject": selectedSubject,
                QuerySnapshot collectionRef = await FirebaseFirestore.instance
                    .collection("qr")
                    .where("className", isEqualTo: selectedClass)
                    .where("collegeId", isEqualTo: MyStrings.userInfo["cid"])
                    .where("departmentName", isEqualTo: selectedDepartment)
                    .where("startingTime", isEqualTo: startingTime)
                    .where("endingTime", isEqualTo: endingTime)
                    //.where("date", isEqualTo: "${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}",)
                    .where("subject", isEqualTo: selectedSubject)
                    .get();
                print("${collectionRef.docs[0].id}");
                MyStrings.qrInfo = collectionRef.docs[0].id;

                Navigator.of(context).pushNamed(ShareQr.route);
                print("QR");
              },
            )
          ],
        )));
  }
}
