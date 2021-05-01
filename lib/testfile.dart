import 'package:flutter/material.dart';
import 'package:smart_attendance_system/custom_widgets/dashboard_tile.dart';
import 'package:smart_attendance_system/utils/utils.dart';


class TestFile extends StatefulWidget {
  @override
  _TestFileState createState() => _TestFileState();
}

class _TestFileState extends State<TestFile> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.whiteColor,
        appBar: AppBar(
          title: Text(MyStrings.adminText),
        ),
        body: SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         Row(

           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           children: [
             DashboardTile(borderColor:MyColors.greenColor,title: "${MyStrings.addStudentText},${MyStrings.addBatchText},${MyStrings.addClassText}",image: MyImages.addImage,),
             DashboardTile(borderColor:MyColors.pinkColor,title: "${MyStrings.takeAttendanceText}",image: MyImages.attendanceImage,),
           ],
         ),
          SizedBox(height: 15,),
          Row(

            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              DashboardTile(borderColor:MyColors.blueColor,title: MyStrings.viewAttendanceText,image: MyImages.viewAttendanceImage,),
            ],
          )

        ],
      ),
    ));
  }
}
