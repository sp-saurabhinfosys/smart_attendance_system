import 'package:flutter/material.dart';
import 'package:smart_attendance_system/utils/utils.dart';

class StudentListTile extends StatelessWidget {
  final String studentName;
  final String enrollment;
  final VoidCallback onClick;

  StudentListTile({this.studentName, this.onClick, this.enrollment});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: MediaQuery.of(context).size.width,
      decoration:
          BoxDecoration(color: Colors.grey.withOpacity(.2), borderRadius: BorderRadius.circular(10.0), border: Border.all(color: MyColors.greyColor)),
      child: InkWell(
        splashColor: MyColors.blueColor,
        borderRadius: BorderRadius.circular(10.0),
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "IT - SEM 3 Maths",
                style: TextStyle(fontSize: 18),
              ),
              Text("IT - SEM 3 Maths"),
            ],
          ),
        ),
      ),
    );
  }
}
