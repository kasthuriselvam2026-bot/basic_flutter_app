import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:open_file/open_file.dart';
import 'dart:io';
import 'dart:ui';
import 'package:printing/printing.dart';
import 'dart:typed_data';
import 'package:flutter_basic/screens/user_session.dart';

class FormAuth {
  Future<void> SaveForm(String userName, String phoneNo, String houseNo,
      String userStreet, String userCity, String userReview) async {
    try {
      await FirebaseFirestore.instance
          .collection("List_of_forms").add({
        "loginMobile":UserSession.mobileNumber,
        "Name": userName,
        "Phone Number": phoneNo,
        "House Number": houseNo,
        "Street": userStreet,
        "City": userCity,
        "Review": userReview,
        "createdAt": FieldValue.serverTimestamp()
      });

      print("Form saved successfully");
    }
    catch (e) {
      print("error: $e");
    }
  }
}