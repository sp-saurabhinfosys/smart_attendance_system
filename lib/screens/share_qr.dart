import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:smart_attendance_system/utils/utils.dart';

class ShareQr extends StatefulWidget {
  static String route = "ShareQr";
  @override
  _ShareQrState createState() => _ShareQrState();
}

class _ShareQrState extends State<ShareQr> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: QrImage(
          data: MyStrings.qrInfo,
          version: QrVersions.auto,
          size: 200.0,
        ),
      ),
    );
  }
}
