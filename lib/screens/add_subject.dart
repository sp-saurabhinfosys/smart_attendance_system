import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:smart_attendance_system/custom_widgets/buttons.dart';
import 'package:smart_attendance_system/custom_widgets/custom_dropdown.dart';
import 'package:smart_attendance_system/custom_widgets/text_field.dart';
import 'package:smart_attendance_system/utils/database_helper.dart';
import 'package:smart_attendance_system/utils/utils.dart';

class AddSubject extends StatefulWidget {
  static String route = "AddSubject";

  @override
  _AddSubjectState createState() => _AddSubjectState();
}

class _AddSubjectState extends State<AddSubject> {
  TextEditingController subjectController = TextEditingController();
  String selectedClass;
  List<String> classList = [];

  //FirebaseFirestore.instance.collection("college").doc(MyStrings.userInfo['cid']).collection(MyStrings.userInfo['dept']).doc(MyStrings.userInfo['dept'].replaceAll(" ", "")).collection("Classes").snapshots(),
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
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Subject"),
      ),
      body: SafeArea(
          child: Column(
        children: [
          AddSubjectTextField(
            controller: subjectController,
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
          /*DropdownButtonFormField<String>(
            value: selectedClass,
            hint: Text("Select Class"),
            onChanged: (String newValue) {
              setState(() {
                selectedClass = newValue;
              });
            },
            validator: (String value) {
              if (value?.isEmpty ?? true) {
                return 'Please enter a valid type of business';
              }
              return null;
            },
            items: classList
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onSaved: (val) => setState(() => _user.typeNeg = val),
          ),*/
          AddClassButton(
            onClick: () {
              print(subjectController.text);
              print(MyStrings.userInfo);
              DatabaseHelper().addSubject(
                  departmentName: MyStrings.userInfo['dept'],
                  collegeId: MyStrings.userInfo['cid'],
                  subjectName: subjectController.text,
                  className: selectedClass,
                  map: {
                    "subject": subjectController.text,
                    "createdBy": MyStrings.userInfo["phone"],
                    "createdAt": DateTime.now(),
                  });
              Navigator.of(context).pop();
            },
          )
        ],
      )),
    );
  }
}
