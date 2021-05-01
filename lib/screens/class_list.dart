import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:smart_attendance_system/custom_widgets/class_list_tile.dart';
import 'package:smart_attendance_system/screens/create_class.dart';
import 'package:smart_attendance_system/utils/utils.dart';

class ClassList extends StatefulWidget {
  static String route = "ClassList";

  @override
  _ClassListState createState() => _ClassListState();
}

class _ClassListState extends State<ClassList> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("User Info ${MyStrings.userInfo}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.of(context).pushNamed(CreateClass.route);
          },
        ),
        drawer: Drawer(),
        appBar: AppBar(
          title: Text("Class"),
          centerTitle: true,
        ),
        body: SafeArea(
            child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("college")
              .doc(MyStrings.userInfo['cid'])
              .collection(MyStrings.userInfo['dept'])
              .doc(MyStrings.userInfo['dept'].replaceAll(" ", ""))
              .collection("Classes")
              .snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Text("Loading...");
            }

            if (snapshot.connectionState == ConnectionState.done) {
              return Text("");
            }
            var document = snapshot.data.docs;
            print(document);
            return ListView.builder(
                itemCount: document.length,
                itemBuilder: (c, i) => ClassListTile(
                      title: "${document[i]['className']}",
                      onClick: () {},
                    ));
          },
        )));
  }
}
