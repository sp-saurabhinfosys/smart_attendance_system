import 'package:flutter/material.dart';
import 'package:smart_attendance_system/utils/utils.dart';

class DashboardTile extends StatelessWidget {
  final String title;
  final String image;
  final VoidCallback onClick;
  final Color borderColor;
  DashboardTile({this.title, this.image, this.onClick, this.borderColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*.25,
      width: MediaQuery.of(context).size.width*.4,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(
          color: borderColor==null?MyColors.whiteColor:borderColor.withOpacity(.2),
          spreadRadius: .1,
          offset: Offset(
            0,0
          ),
          blurRadius: 20

        )],
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: borderColor==null?MyColors.whiteColor:borderColor)
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(15),

        child: InkWell(
          borderRadius: BorderRadius.circular(15),

          splashColor: borderColor.withOpacity(.5),
          onTap: onClick,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: MediaQuery.of(context).size.width*.2,
                    width: MediaQuery.of(context).size.width*.2,
                    child: Image.asset(image)),
                SizedBox(height: 15,),
                Text("$title",textAlign: TextAlign.center,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
