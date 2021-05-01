import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:smart_attendance_system/custom_widgets/class_list_tile.dart';
import 'package:smart_attendance_system/screens/add_subject.dart';
import 'package:smart_attendance_system/utils/utils.dart';

class SubjectList extends StatefulWidget {
  static String route = "SubjectList";

  @override
  _SubjectListState createState() => _SubjectListState();
}

class _SubjectListState extends State<SubjectList> {
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
            Navigator.of(context).pushNamed(AddSubject.route);
          },
        ),
        drawer: Drawer(),
        appBar: AppBar(
          title: Text("Subjects"),
          centerTitle: true,
        ),
        body: SafeArea(
            child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("college")
              .doc(MyStrings.userInfo["cid"])
              .collection(MyStrings.userInfo["dept"])
              .doc(MyStrings.userInfo["dept"].replaceAll(" ", ""))
              .collection("Classes")
              .doc(MyStrings.userInfo["dept"].replaceAll(" ", ""))
              .collection("Subjects")
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
                      title: "${document[i]['subject']}",
                      onClick: () {},
                    ));
          },
        )));
  }
}
