import 'package:flutter/material.dart';
import 'package:smart_attendance_system/custom_widgets/dashboard_tile.dart';
import 'package:smart_attendance_system/screens/add_dashboard.dart';
import 'package:smart_attendance_system/screens/generate_qr.dart';
import 'package:smart_attendance_system/screens/view_attendance_1.dart';
import 'package:smart_attendance_system/utils/utils.dart';


class Dashboard extends StatefulWidget {
  static String route = "Dashboard";
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
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
                  DashboardTile(borderColor:MyColors.greenColor,title: "Add",image: MyImages.addImage,onClick: (){
                    Navigator.of(context).pushNamed(AddDashboard.route);

                  },),
                  DashboardTile(borderColor:MyColors.pinkColor,title: "${MyStrings.takeAttendanceText}",image: MyImages.attendanceImage,onClick: (){
                    Navigator.of(context).pushNamed(GenerateQr.route);


                  },),
                ],
              ),
              SizedBox(height: 15,),
              Row(

                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  DashboardTile(borderColor:MyColors.blueColor,title: MyStrings.viewAttendanceText,image: MyImages.viewAttendanceImage,onClick: (){
                    Navigator.of(context).pushNamed(ViewAttendance1.route);
                  },),
                ],
              )

            ],
          ),
        ));
  }
}
