import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseHelper {
  static String collectionCollege = "college";
  static String keyCollegeCode = "collegeCode";
  static String keyCollegeName = "collegeName";
  static String keyCollegeLocation = "collegeLocation";
  static String keyStudentName = "studentName";
  static String keyStudentEnrollment = "studentEnrollment";
  static String keyStudentPhoneNo = "studentPhoneNo";
  static String keyFacultyName = "facultyName";
  static String keyFacultyId = "facultyId";
  static String keyFacultyPhoneNo = "facultyPhoneNumber";
  static String keyPresent = "present";
  static String keyTimetable = "timetable";


  signUpMethod({String collegeId, String departmentName, Map<String, dynamic> map, String phoneNo}) {
    FirebaseFirestore.instance
        .collection("college")
        .doc(collegeId)
        .collection(departmentName)
        .doc(departmentName.replaceAll(" ", ""))
        .collection("Teachers")
        .doc(phoneNo)
        .set(map);
    FirebaseFirestore.instance.collection("Teachers").doc(phoneNo).set(map);
    print("Done");
  }

  addClass({String collegeId, String departmentName, Map<String, dynamic> map, String className}) {
    FirebaseFirestore.instance
        .collection("college")
        .doc(collegeId)
        .collection(departmentName)
        .doc(departmentName.replaceAll(" ", ""))
        .collection("Classes")
        .doc(className.replaceAll(" ", ""))
        .set(map);
    FirebaseFirestore.instance.collection("Classes").doc(className.replaceAll(" ", "")).set(map);
    print("Done");
  }

  addSubject({String collegeId, String departmentName, Map<String, dynamic> map, String subjectName, String className}) async {
    await FirebaseFirestore.instance
        .collection("college")
        .doc(collegeId)
        .collection(departmentName)
        .doc(departmentName.replaceAll(" ", ""))
        .collection("Classes")
        .doc(className.replaceAll(" ", ""))
        .collection("Subjects")
        .doc(subjectName.replaceAll(" ", ""))
        .set(map);
    print("Entry done in inside part");
    await FirebaseFirestore.instance.collection("Subjects").doc(subjectName.replaceAll(" ", "")).set(map);
    print("Done");
  }

  addStudent({String collegeId, String departmentName, Map<String, dynamic> map, String enrollment, String className}) {
    FirebaseFirestore.instance.collection("Students").doc(enrollment.replaceAll(" ", "")).set(map);
    FirebaseFirestore.instance
        .collection("college")
        .doc(collegeId)
        .collection(departmentName)
        .doc(departmentName.replaceAll(" ", ""))
        .collection("Classes")
        .doc(className.replaceAll(" ", ""))
        .collection("Students")
        .doc(enrollment)
        .set(map);
    print("Done");
  }

  takeAttendance({String collegeId,String departmentName,String subject,String date,Map<String, dynamic> particularStudentInfo,String className,String enrollment,Map<String,dynamic> attendanceInfo,}) async {
    FirebaseFirestore.instance
        .collection("college")
        .doc(collegeId)
        .collection(departmentName)
        .doc(departmentName.replaceAll(" ", ""))
        .collection("Classes")
        .doc(className.replaceAll(" ", ""))
        .collection("Subjects")
        .doc(subject.replaceAll(" ", ""))
        .collection("attendance")
        .doc("$date")
        .collection("student")
        .doc(enrollment)
        .set(particularStudentInfo);
    /*print("Saving data in student");
    await FirebaseFirestore.instance
        .collection("college")
        .doc(collegeId)
        .collection(departmentName)
        .doc(departmentName.replaceAll(" ", ""))
        .collection("Classes")
        .doc(className.replaceAll(" ", ""))
        .collection("Students")
        .doc(enrollment.replaceAll(" ", ""))
        .collection("$subject")
        .doc("$date")
        .set(particularStudentInfo);
    print("Saved data in student");*/
    FirebaseFirestore.instance
        .collection("college")
        .doc(collegeId)
        .collection(departmentName)
        .doc(departmentName.replaceAll(" ", ""))
        .collection("Classes")
        .doc(className.replaceAll(" ", ""))
        .collection("Subjects")
        .doc(subject.replaceAll(" ", ""))
        .collection("attendance")
        .doc(date)
        .set(attendanceInfo);

  }
  addQrData({Map<String, dynamic> qrInfo}){
    FirebaseFirestore.instance.collection('qr').add(qrInfo);

  }

  getViewStudentData()
  async {

  }

}
