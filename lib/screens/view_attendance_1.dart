import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_attendance_system/custom_widgets/buttons.dart';
import 'package:smart_attendance_system/custom_widgets/custom_dropdown.dart';
import 'package:smart_attendance_system/screens/view_attendance_2.dart';
import 'package:smart_attendance_system/utils/database_helper.dart';
import 'package:smart_attendance_system/utils/utils.dart';

class ViewAttendance1 extends StatefulWidget {
  static String route = "ViewAttendance1";

  @override
  _ViewAttendance1State createState() => _ViewAttendance1State();
}

class _ViewAttendance1State extends State<ViewAttendance1> {
  String selectedClass;
  String selectedDepartment;

  List<String> classList = [];
  List<String> subjectList = [];

 int getPresent(QuerySnapshot q){
   int pre = 0;
   for(int i=0;i<q.docs.length;i++)
     {
       if(q.docs[i]['present'])
         pre++;
     }
   return pre;
 }
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
    subjectList.clear();
    MyStrings.subjectList.clear();
    for (int i = 0; i < length; i++) {
      subjectList.add(collectionRef.docs[i]['subject']);
      //print(collectionRef.docs[i]['subject']);
    }
    MyStrings.subjectList = subjectList;

    print(MyStrings.subjectList);
    return list;
  }

  Future<List<Map<dynamic, dynamic>>> getStudents() async {
    List<Map<dynamic, dynamic>> list = [];
    QuerySnapshot collectionRef = await FirebaseFirestore.instance
        .collection("college")
        .doc(MyStrings.userInfo['cid'])
        .collection(selectedDepartment == null ? MyStrings.userInfo['dept'] : selectedDepartment)
        .doc(selectedDepartment == null ? MyStrings.userInfo['dept'].replaceAll(" ", "") : selectedDepartment.replaceAll(" ", ""))
        .collection("Classes")
        .doc(selectedClass.replaceAll(" ", ""))
        .collection("Students")
        .get();

    setState(() {});
    print(collectionRef.docs[0]['enrollment'].runtimeType);
    print("Length ");
    print(collectionRef.docs.length);
    int length = collectionRef.docs.length;
    MyStrings.studentList.clear();
    for (int i = 0; i < length; i++) {
      MyStrings.studentList.add({"enrollment": collectionRef.docs[i]['enrollment'], "name": collectionRef.docs[i]['name']});
      //print(collectionRef.docs[i]['subject']);
    }

    print(MyStrings.studentList);
    print(MyStrings.subjectList);
    return list;
  }

  getSt1Data() async {
    /* QuerySnapshot q = await FirebaseFirestore.instance
        .collection("college")
        .doc(MyStrings.userInfo["cid"])
        .collection(selectedDepartment)
        .doc(selectedDepartment.replaceAll(" ", ""))
        .collection("Classes")
        .doc(selectedClass.replaceAll(" ", ""))
        .collection("Students")
        .doc("1".replaceAll(" ", ""))
        .collection("computer")
        .get();
    print(q.docs.first.id);*/
    MyStrings.stData.clear();
    for (int stu = 0; stu < MyStrings.studentList.length; stu++) {
      for (int sub = 0; sub < subjectList.length; sub++) {
        QuerySnapshot q = await FirebaseFirestore.instance
            .collection("college")
            .doc(MyStrings.userInfo["cid"])
            .collection(selectedDepartment)
            .doc(selectedDepartment.replaceAll(" ", ""))
            .collection("Classes")
            .doc(selectedClass.replaceAll(" ", ""))
            .collection("Students")
            .doc("${MyStrings.studentList[stu]['enrollment']}".replaceAll(" ", ""))
            .collection(subjectList[sub])
            .get();
        //stData[] ={"${subjectList[stu]}": q.docs.length};

        MyStrings.stData.add({
          "${MyStrings.studentList[stu]['enrollment']}": {
            "${subjectList[sub]}": {
              "total":q.docs.length,
              'attendance':getPresent(q)
            },
          }
        });
        print("${MyStrings.studentList[stu]['enrollment']}  ${subjectList[sub]} ${q.docs.length}");
      }
    }
    print(MyStrings.stData);
  }

  /*getFinalData(){
   for(int sd = 0;sd<MyStrings.stData.length;sd++) {
     for (int sub = 0; sub < subjectList.length; sub++)
       {
         MyStrings.stMainData.add(MyStrings.stData[sub]);
         sd = sub;
       }

   }
   print(MyStrings.stMainData);
  }*/

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
            ViewButton(
              onClick: () async {
                //MyStrings.qrInfo = selectedDepartment + selectedClass + startingTime + endingTime;
                print(MyStrings.userInfo);
                await getSubjects();

                await getStudents();
                await getSt1Data();
                await DatabaseHelper().getViewStudentData();
                Navigator.of(context).pushNamed(ViewAttendance2.route);
                print("View Pressed");
              },
            )
          ],
        )));
  }
}
