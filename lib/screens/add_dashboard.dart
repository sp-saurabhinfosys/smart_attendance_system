import 'package:flutter/material.dart';
import 'package:smart_attendance_system/custom_widgets/dashboard_tile.dart';
import 'package:smart_attendance_system/screens/add_subject.dart';
import 'package:smart_attendance_system/screens/class_list.dart';
import 'package:smart_attendance_system/screens/create_student.dart';
import 'package:smart_attendance_system/utils/utils.dart';

class AddDashboard extends StatefulWidget {
  static String route = "AddDashboard";

  @override
  _AddDashboardState createState() => _AddDashboardState();
}

class _AddDashboardState extends State<AddDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyColors.whiteColor,
        drawer: Drawer(),
        appBar: AppBar(
          centerTitle: true,
          title: Text(MyStrings.adminText),
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  DashboardTile(
                    borderColor: MyColors.yellowColor,
                    title: "${MyStrings.addClassText}",
                    image: MyImages.addClassImage,
                    onClick: () {
                      Navigator.of(context).pushNamed(ClassList.route);
                    },
                  ),
                  DashboardTile(
                    borderColor: MyColors.greenColor,
                    title: "${MyStrings.addStudentText}",
                    image: MyImages.addStudentImage,
                    onClick: (){
                      Navigator.of(context).pushNamed(CreateStudent.route);
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  DashboardTile(
                    borderColor: MyColors.pinkColor,
                    title: "Add Subjects",
                    image: MyImages.timeTableImage,
                    onClick: () {
                      Navigator.of(context).pushNamed(AddSubject.route);
                    },
                  ),
                  /*DashboardTile(borderColor:MyColors.blueColor,title: MyStrings.addBatchText,image: MyImages.addBatchImage,),*/
                ],
              )
            ],
          ),
        ));
  }
}
