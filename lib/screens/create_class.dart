import 'package:flutter/material.dart';
import 'package:smart_attendance_system/custom_widgets/buttons.dart';
import 'package:smart_attendance_system/custom_widgets/text_field.dart';
import 'package:smart_attendance_system/utils/database_helper.dart';
import 'package:smart_attendance_system/utils/utils.dart';

class CreateClass extends StatefulWidget {
  static String route = "CreateClass";

  @override
  _CreateClassState createState() => _CreateClassState();
}

class _CreateClassState extends State<CreateClass> {
  TextEditingController classController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Create Class"),),
      body: SafeArea(
          child: Column(
            children: [
              AddClassNameTextField(
        controller: classController,
      ),
              AddClassButton(onClick: (){
                print(classController.text);
                print(MyStrings.userInfo);
                DatabaseHelper().addClass(departmentName: MyStrings.userInfo['dept'],collegeId: MyStrings.userInfo['cid'],className: classController.text, map: {
                  "className":classController.text,
                  "createdBy":MyStrings.userInfo["phone"],
                  "createdAt":DateTime.now(),
                });
                //Navigator.of(context).pop();
              },)
            ],
          )),
    );
  }
}
