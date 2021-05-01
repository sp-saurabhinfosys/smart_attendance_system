import 'package:flutter/material.dart';

class MyColors {
  static Color blueColor = Color(0xff3A7EE8);
  static Color greenColor = Color(0xff3DD2A8);
  static Color yellowColor = Color(0xffF6B565);
  static Color pinkColor = Color(0xffF45686);
  static Color greyColor = Color(0xffD2D3D5);
  static Color g1Color = Color(0xff3A7EE8);
  static Color g2Color = Color(0xff1D61CF);
  static Color whiteColor = Colors.white;
  static Color blackColor = Colors.black;
}

class MyImages {
  static String addImage = "assets/images/add.png";
  static String addBatchImage = "assets/images/add_batch.png";
  static String addClassImage = "assets/images/add_class.png";
  static String addStudentImage = "assets/images/add_student.png";
  static String attendanceImage = "assets/images/attendance.png";
  static String drawerImage = "assets/images/drawer.png";
  static String generateQrImage = "assets/images/generate_qr.png";
  static String logoImage = "assets/images/logo.png";
  static String splashBgImage = "assets/images/splash_bg.png";
  static String timeTableImage = "assets/images/time_table.png";
  static String viewAttendanceImage = "assets/images/view_attendance.png";
}

class MyStrings {
  static String addStudentText = "Add Student";
  static String takeAttendanceText = "Take Attendance";
  static String generateQRText = "Generate QR";
  static String viewAttendanceText = "View Attendance";
  static String adminText = "Admin";
  static String addClassText = "Add Class";
  static String addTimeTableText = "Add Time Table";
  static String addBatchText = "Add Batch";
  static String createYourClassText = "Create Your Class";
  static String classNameText = "Class Name";
  static String doneText = "Done";
  static String firstNameText = "First Name";
  static String lastNameText = "Last Name";
  static String enrollmentNoText = "Enrollment No";
  static String phoneNumberText = "Phone Number";
  static String passwordText = "Password";

  static String selectClassText = "Select Class";
  static String createStudentText = "Create Student";
  static String createTimetableText = "Create Timetable";
  static String subjectNameText = "Subject Name";
  static String startingTimeText = "Starting Time";
  static String endingTimeText = "Ending Time";
  static String mondayText = "Monday";
  static String tuesdayText = "Tuesday";
  static String wednesdayText = "Wednesday";
  static String thursdayText = "Thursday";
  static String fridayText = "Friday";
  static String saturdayText = "Saturday";
  static String editText = "Edit";
  static String createBatchText = "Create Batch";
  static String statingEnrollmentText = "Stating Enrollment";
  static String endingEnrollmentText = "Ending Enrollment";
  static String selectBatchOptionalText = "Select Batch (Optional)";
  static String shareText = "Share";
  static String classWiseText = "Class Wise";
  static String subjectWiseText = "Subject Wise";
  static String dateWiseText = "Date Wise";
  static String studentWiseText = "Student Wise";
  static String startingDateText = "Starting Date";
  static String endingDateText = "Ending Date";
  static String enrollmentText = "Enrollment";
  static String qrInfo;
  static Map<String,String> userInfo;
  static List<String> department = [
    "Aeronautical Engineering",
    "Industrial Engineering",
    "Aerospace Engineering",
    "Marine Engineering",
    "Automobile Engineering",
    "Mechanical Engineerin",
    "Biomedical Engineering",
    "Mechatronics Engineering",
    "Biotechnology Engineering",
    "Metallurgical Engineering",
    "Ceramic Engineering",
    "Mining Engineering",
    "Chemical Engineering",
    "Petroleum Engineering",
    "Civil Engineering",
    "Power Engineering",
    "Communications Engineering",
    "Production Engineering",
    "Computer Engineering",
    "Computer Science Engineering",
    "Robotics Engineering",
    "Construction Engineering",
    "Structural Engineering",
    "Electrical Engineering",
    "Telecommunication Engineering",
    "Electronics & Communication Engineering",
    "Textile Engineering",
    "Electronics Engineering",
    "Tool Engineering",
    "Environmental Engineering",
    "Transportation Engineering",
  ];

  static List<Map<String,String>> collegeList = [
    {"code": "001", "college_name": "A.D.PATEL INSTITUTE OF TECH.,KARAMSAD"},
    {"code": "002", "college_name": "AHMEDABAD INSTITUTE OF TECH, AHMEDABAD"},
    {"code": "003", "college_name": "ATMIYA INSTITUTE OF TECH & SC., ,RAJKOT"},
    {"code": "004", "college_name": "B.H.GARDI COLLEGE OF ENGG. & TECHNOLOGY , RAJKOT"},
    {"code": "005", "college_name": "BABARIA INSTITUTE OF TECHNOLOGY,VARNAMA,VADODARA"},
    {"code": "006", "college_name": "BHAGWAN MAHAVIR COLLEGE OF ENGG. AND TECH., SURAT"},
    {"code": "007", "college_name": "BIRLA VISHVAKARMA MAHA VIDHYALAYA(GIA), V.V.NAGAR G.I.A."},
    {"code": "008", "college_name": "BIRLA VISHVAKARMA MAHA VIDHYLAYA, V.V.NAGAR"},
    {"code": "009", "college_name": "C. K. PITHAWALA COLLEGE OF ENGG. & TECH., SURAT"},
    {"code": "011", "college_name": "G.H.PATEL COLLEGE OF ENGG. & TECH. , V. V. NAGAR"},
    {"code": "012", "college_name": "GANDHINAGAR INSTITUTE OF TECHNOLOGY, GANDHINAGAR"},
    {"code": "013", "college_name": "GOVERNMENT ENGINEERING COLLEGE, SECTOR 28 GANDHINAGAR"},
    {"code": "014", "college_name": "GOVERNMENT ENGINEERING COLLEGE, BHARUCH"},
    {"code": "015", "college_name": "GOVERNMENT ENGINEERING COLLEGE, BHUJ"},
    {"code": "016", "college_name": "GOVERNMENT ENGINEERING COLLEGE, MODASA"},
    {"code": "017", "college_name": "VISHWAKARMA GOVERNMENT ENGINEERING COLLEGE, CHANDKHEDA,GANDHINAGAR"},
    {"code": "018", "college_name": "GOVERNMENT ENGINEERING COLLEGE, DAHOD"},
    {"code": "019", "college_name": "GOVERNMENT ENGINEERING COLLEGE, VALSAD"},
    {"code": "020", "college_name": "GOVERNMENT ENGINEERING COLLEGE, RAJKOT"},
    {"code": "021", "college_name": "GOVERNMENT ENGINEERING COLLEGE, BHAVNAGAR"},
    {"code": "022", "college_name": "GOVERNMENT ENGINEERING COLLEGE, PATAN"},
    {"code": "023", "college_name": "GOVERNMENT ENGINEERING COLLEGE, SURAT"},
    {"code": "024", "college_name": "HASMUKH GOSWAMI COLLEGE OF ENGG, VAHELAL"},
    {"code": "025", "college_name": "INDUS INSTITUTE OF TECH. & ENGG., RACHARDA, AHMEDABAD"},
    {"code": "026", "college_name": "KALOL INSTITUTE OF TECH. & RESEARCH CENTER ,KALOL"},
    {"code": "027", "college_name": "KANKESHWARIDEVI INST. OF TECH.,JAMNAGAR"},
    {"code": "028", "college_name": "L.D.COLLEGE OF ENGINEERING, AHMEDABAD"},
    {"code": "029", "college_name": "LALJIBHAI CHATURBHAI INSTITUTE OF TECH., BHANDU"},
    {"code": "030", "college_name": "L.D.R.P. INSTITUTE OF TECH. & RESEARCH., GANDHINAGAR"},
    {"code": "031", "college_name": "L.E.COLLEGE ,MORBI"},
    {"code": "032", "college_name": "L.J. INSTITUTE OF ENGG AND TECH., AHMEDABAD"},
    {"code": "033", "college_name": "MAHATMA GANDHI INST.OF TECHNICAL EDU. AND RESEARCH CENTER,NAVASARI"},
    {"code": "034", "college_name": "NARNARAYAN SHASTRI INSTITUTE OF TECH., JETALPUR"},
    {"code": "035", "college_name": "NOBLE ENGINEERING COLLEGE, JUNAGADH"},
    {"code": "036", "college_name": "OM SHANTI ENGG. COLLEGE, BEDI, RAJKOT"},
    {"code": "037", "college_name": "PARUL INSTITUTE OF ENGG. AND TECH., LIMDA, VAGHODIA"},
    {"code": "038", "college_name": "R. K. COLLEGE OF ENGG. & TECH., RAJKOT"},
    {"code": "039", "college_name": "S.P.B. PATEL ENGG. COLLEGE(SAFFRONY), LINCH, MAHESHANA"},
    {"code": "040", "college_name": "SAKALCHAND PATEL COLLEGE OF ENGG., VISNAGAR"},
    {"code": "041", "college_name": "SARDAR VALLABHBHAI PATEL INSTITUTE OF TECH.,VASAD"},
    {"code": "042", "college_name": "SARVAJANIK COLLEGE OF ENGG. & TECH. , SURAT"},
    {"code": "043", "college_name": "SHANTILAL SHAH ENGINEERING COLLEGE ,BHAVNAGAR"},
    {"code": "044", "college_name": "C.U.SHAH COLLEGE OF ENGG.& TECH.,WADHVAN"},
    {"code": "045", "college_name": "SHRI SADVIDHYA MANDAL INSTITUTE OF TECH., BHARUCH"},
    {"code": "046", "college_name": "UNIVERSAL COLLEGE OF ENGG. AND TECH., MOTI BHOYAN"},
    {"code": "047", "college_name": "V.V.P. ENGINEERING COLLEGE, RAJKOT"},
    {"code": "048", "college_name": "VALIA INSTITUTE OF TECH., VALIA, BHARUCH"},
    {"code": "049", "college_name": "VIDHYABHARTI TRUST INST. OF TECH. & RESEARCH CENTER, UMRAKH"},
    {"code": "050", "college_name": "SIGMA INSTITUTE OF ENGG., BAKROL"},
    {"code": "051", "college_name": "ALPHA COLLEGE OF ENGG. & TECH., KHATRAJ, KALOL"},
    {"code": "052", "college_name": "CENTRAL INSTITUE OF PLASTICS ENGG. & TECH., VATVA, AHMEDABAD"},
    {"code": "053", "college_name": "CHHOTUBHAI GOPALBHAI PATEL INSTITUTE OF TECH., TARSADI, BARDOLI"},
    {"code": "054", "college_name": "DARSHAN INSTITUTE OF ENGG. & TECH., RAJKOT-MORBI HIGHWAY, HADALA"},
    {"code": "055", "college_name": "ENGINEERING COLLEGE, TUWA, GODHARA"},
    {"code": "056", "college_name": "FACULTY OF ENGG., GROW MORE FOUNDATION GROUP OF INSTITUTIONS, BERNA, HIMMATNAGAR"},
    {"code": "057", "college_name": "FACULTY OF ENGG., MARWADI EDU. FOUNDATION GROUP OF INSTITUTIONS, RAJKOT"},
    {"code": "058", "college_name": "FACULTY OF ENGG., SHREE SARASWATI EDU. SANSTHAN GROUP OF INSTITUTIONS, RAJPUR, KADI"},
    {"code": "059", "college_name": "G.K. BHARAD INSTITUTE OF ENGG., KASTURBA DHAM, RAJKOT"},
    {"code": "060", "college_name": "GOVERNMENT ENGINEERING COLLEGE, GODHARA"},
    {"code": "061", "college_name": "GOVERNMENT ENGINEERING COLLEGE, PALANPUR"},
    {"code": "062", "college_name": "GUJARAT INSTITUTE OF TECHNICAL STUDIES, MOYAD, PRANTIJ"},
    {
      "code": "063",
      "college_name": "MADHUBEN AND BHANUBHAI PATEL WOMEN INSTITUTE OF ENGINEERING FOR STUDIES AND RESEARCH IN COMPUTER AND COMMUNICATION TECHNOLOGY"
    },
    {"code": "064", "college_name": "K.J. INSTITUTE OF ENGG. AND TECH., SAVALI"},
    {"code": "065", "college_name": "MERCHANT ENGG. COLLEGE, BASNA. VISNAGAR"},
    {"code": "066", "college_name": "SABAR INSTITUTE OF TECH. FOR GIRLS, TAJPUR, SABARKANTHA"},
    {"code": "067", "college_name": "SAL INSTITUTE OF TECH. & ENGG. RESEARCH, AHMEDABAD"},
    {"code": "068", "college_name": "SARDAR PATEL INSTITUTE OF TECH., PILUDARA, MEHSANA"},
    {"code": "069", "college_name": "SEMI FINANCED DEGREE ENGINEERING COLLEGE, AMRELI"},
    {"code": "070", "college_name": "SEMI FINANCED DEGREE ENGINEERING COLLEGE, JAMNAGAR"},
    {"code": "071", "college_name": "SEMI FINANCED DEGREE ENGINEERING COLLEGE, MEHSANA(VADNAGAR)"},
    {"code": "072", "college_name": "SEMI FINANCED DEGREE ENGINEERING COLLEGE, NAVSARI"},
    {"code": "073", "college_name": "SEMI FINANCED DEGREE ENGINEERING COLLEGE, PORBANDAR"},
    {"code": "074", "college_name": "SEMI FINANCED DEGREE ENGINEERING COLLEGE, SURENDRANAGAR"},
    {"code": "075", "college_name": "SHANKERSINH VAGHELA BAPU INSTITUTE OF TECH., UNAVA, GANDHINAGAR"},
    {"code": "076", "college_name": "Shri SWAMI ATMANAND SARASWATI INSTITUTE OF TECH., SURAT"},
    {"code": "077", "college_name": "SILVER OAK COLLEGE OF ENGG., & TECH., AHMEDABAD"},
    {"code": "078", "college_name": "Smt. S.R. PATEL ENGG. COLLEGE, DABHI, UNJHA"},
    {"code": "079", "college_name": "TAKSHSHILA COLLEGE OF ENGG. & TECH., VILLAGE ISHWARIYA, RAJKOT"},
    {"code": "080", "college_name": "VADODARA INSTITUTE OF ENGG., KOTAMBI, WAGHODIYA"},
    {"code": "081", "college_name": "VENUS INTERNATIONAL COLLEGE OF TECH., BHOYAN RATHOD, GANDHINAGAR"},
    {"code": "082", "college_name": "Dr. Jivraj Mehta Institute of Technology, Anand"},
    {"code": "083", "college_name": "Dr. Subhahsh Pethaljibhai Chavda Ahir Kelvani Mandal`s Group of Institutions-Engg, Junagadh"},
    {"code": "084", "college_name": "Faculty of Engg., Tech. & Research (FETR), ISROLI (AFWA), Bardoli"},
    {"code": "085", "college_name": "HJD INSTITUTE OF TECHNICAL EDUCATION AND RESERCH, Kera"},
    {"code": "086", "college_name": "Laxmi Institute of Technology, Valsad"},
    {"code": "087", "college_name": "PARUL INSTITUTE OF TECH., LIMDA, VAGHODIA"},
    {"code": "088", "college_name": "SAMARTH COLLEGE OF ENGINEERING & TECHNOLOGY, Himatnagar"},
    {"code": "089", "college_name": "Shri Labhubhai Trivedi Institute of Engineering And Technology, Rajkot"},
    {"code": "090", "college_name": "Tatva Institute of Technological Studies, Modasa"},
    {"code": "091", "college_name": "SHRI SATSANGI SAKETDHAM `RAM ASHRAM` GROUP OF INSTITUTIONS, Vadasma"},
    {"code": "092", "college_name": "VEERAYATAN GROUP OF INSTITUTIONS FACULTY OF ENGG."},
  ];













  //View AttendanceData
  static List<Map<String,dynamic>> studentList=[];
  static List subjectList=[];
  static List<Map<dynamic, dynamic>> stData = [];
  static List<Map<dynamic, dynamic>> stMainData = [];
}


