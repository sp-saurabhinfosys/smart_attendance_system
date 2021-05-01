import 'package:flutter/material.dart';
import 'package:smart_attendance_system/utils/utils.dart';

class ClassListTile extends StatelessWidget {
  final String title;
  final VoidCallback onClick;

  ClassListTile({this.title, this.onClick});

  @override
  Widget build(BuildContext context) {
    return Container(

      height: 50,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(.2),
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: MyColors.greyColor)
      ),
      child: InkWell(
        splashColor: MyColors.blueColor,
        borderRadius: BorderRadius.circular(10.0),
        onTap: onClick,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text("$title"),
            ),
          ],
        ),
      ),
    );
  }
}
