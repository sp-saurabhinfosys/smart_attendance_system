import 'package:flutter/material.dart';
import 'package:smart_attendance_system/screens/admin_dashboard.dart';

class Pages extends StatefulWidget {
  @override
  _PagesState createState() => _PagesState();
}

class _PagesState extends State<Pages> {
  nav(String route) {
    Navigator.of(context).pushNamed(route);
  }

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
            itemCount: 10,
            itemBuilder: (c, i) {
              return TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(Dashboard.route);
                  },
                  child: Text("Page $i"));
            }),
      ),
    );
  }
}
