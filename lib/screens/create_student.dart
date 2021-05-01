import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:smart_attendance_system/custom_widgets/buttons.dart';
import 'package:smart_attendance_system/custom_widgets/custom_dropdown.dart';
import 'package:smart_attendance_system/custom_widgets/text_field.dart';
import 'package:smart_attendance_system/utils/database_helper.dart';
import 'package:smart_attendance_system/utils/utils.dart';

class CreateStudent extends StatefulWidget {
  static String route = "CreateStudent";

  @override
  _CreateStudentState createState() => _CreateStudentState();
}

class _CreateStudentState extends State<CreateStudent> {
  TextEditingController enrollController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  String selectedClass;
  List<String> classList = [];

  Future<List<Map<dynamic, dynamic>>> getData() async {
    List<Map<dynamic, dynamic>> list = [];
    QuerySnapshot collectionRef = await FirebaseFirestore.instance
        .collection("college")
        .doc(MyStrings.userInfo['cid'])
        .collection(MyStrings.userInfo['dept'])
        .doc(MyStrings.userInfo['dept'].replaceAll(" ", ""))
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(MyStrings.userInfo);
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Add Student"),
      ),
      body: Column(
        children: [
          NameTextField(controller: nameController,),
          EnrollmentNoTextField(controller: enrollController,),
          PhoneNoTextField(controller: phoneController,),
          //Class Dropdown
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
          AddStudentButton(
            onClick: () async {
              print(MyStrings.userInfo);
              await DatabaseHelper().addStudent(
                  departmentName: MyStrings.userInfo['dept'],
                  collegeId: MyStrings.userInfo['cid'],
                  enrollment: enrollController.text,
                  className: selectedClass,
                  map: {
                    "departmentName": MyStrings.userInfo['dept'],
                    "collegeId": MyStrings.userInfo['cid'],
                    "className": selectedClass,
                    "enrollment": enrollController.text,
                    "name": nameController.text,
                    "phone": phoneController.text,
                    "pass": phoneController.text,
                    "createdBy": MyStrings.userInfo["phone"],
                    "createdAt": DateTime.now(),
                  });
              print("Done");
            },
          )
        ],
      ),
    );
  }
}
