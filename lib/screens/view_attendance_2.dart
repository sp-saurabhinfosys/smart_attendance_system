import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_attendance_system/utils/utils.dart';

class ViewAttendance2 extends StatefulWidget {
  static String route = "ViewAttendance2";

  @override
  _ViewAttendance2State createState() => _ViewAttendance2State();
}

class _ViewAttendance2State extends State<ViewAttendance2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SafeArea(
            child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columns: List.generate(
                MyStrings.subjectList.length + 1,
                (index) => DataColumn(
                    label: index == 0
                        ? Text("Students")
                        : Text(
                            MyStrings.subjectList[index - 1],
                          ))),
            rows: List.generate(
                MyStrings.studentList.length,
                (st) => DataRow(
                      cells: List.generate(
                        MyStrings.subjectList.length + 1,
                        (index) => DataCell(
                          index == 0 ? Text(MyStrings.studentList[st]['name']) : GestureDetector(onTap: (){
                            print(jsonEncode(MyStrings.stData));



                            print(((index)+(st*MyStrings.subjectList.length))-1);
                          },child: Text(getAtt(
                            index: ((index)+(st*MyStrings.subjectList.length))-1,
                            studentEnroll: int.parse(MyStrings.studentList[st]['enrollment']),
                            subject: MyStrings.subjectList[index-1]
                          )),
                        ),
                      ),
                    )),
          ),
        ))));
  }


  getAtt({int index,int studentEnroll,String subject}){

    print("index $index ENR $studentEnroll  subje  $subject");


    //var a = MyStrings.stData[(((index)+(st*MyStrings.subjectList.length))-1)];

    return MyStrings.stData[index][studentEnroll.toString()][subject]['attendance'].toString()+"/"+MyStrings.stData[index][studentEnroll.toString()][subject]['total'].toString()??"NA";

  }

}
/*Column(
          children: [
            Row(
              children: [

                Expanded(
                  child: Container(
                    height: 50,
                    color: Colors.red,
                    child: ListView.builder(
                      itemCount: MyStrings.subjectList.length+1,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (c, i) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 50,
                              width: i==0?160:100,
                              color: i==0?Colors.yellowAccent:Colors.white,
                              child: Center(child: i==0?Text("Student"):Text(MyStrings.subjectList[i-1]))),
                        );
                      },

                    ),
                  ),
                ),
              ],
            )
          ],
        )*/
