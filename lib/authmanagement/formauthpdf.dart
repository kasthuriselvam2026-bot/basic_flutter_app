import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:open_file/open_file.dart';
import 'dart:io';
import 'dart:ui';
import 'package:printing/printing.dart';
import 'dart:typed_data';

class FormAuth {
  Future<void> SaveForm(String userName, String phoneNo, String houseNo,
      String userStreet, String userCity, String userReview) async {
    try {
      await FirebaseFirestore.instance
          .collection("registration_form")
          .doc(phoneNo)
          .set({
        "Name": userName,
        "Phone Number": phoneNo,
        "House Number": houseNo,
        "Street": userStreet,
        "City": userCity,
        "Review": userReview,
        "created at": FieldValue.serverTimestamp()
      });

      print("Form saved successfully");
    }
    catch (e) {
      print("error: $e");
    }
  }


  /// GENERATE PDF

  Future<Uint8List> generatePDFBytes(String userName, String phoneNo,
      String houseNo,
      String userStreet, String userCity, String userReview) async {
    final PdfDocument document = PdfDocument();

    // Add page

    final page = document.pages.add();

    // Title

    page.graphics.drawRectangle(
      pen: PdfPen(PdfColor(255, 102, 102), width: 3),
      bounds: Rect.fromLTWH(10, 10, 500, 700),
    ); //outer border

    page.graphics.drawString(
      "Registration Form",
      brush: PdfSolidBrush(PdfColor(255, 0, 0),),
      PdfStandardFont(PdfFontFamily.helvetica, 24, style: PdfFontStyle.bold),
      bounds: Rect.fromLTWH(20, 30, 520, 30),
      format: PdfStringFormat(alignment: PdfTextAlignment.center),
    );

    page.graphics.drawRectangle(
        pen: PdfPen(PdfColor(0, 0, 255), width: 2), // blue border
        bounds: Rect.fromLTWH(40, 100, 440, 300),
        brush: PdfSolidBrush(PdfColor(173, 216, 230),
        )
    );

    double y = 130;


    // Name


    page.graphics.drawString("Name",
        PdfStandardFont(PdfFontFamily.helvetica, 16),
        bounds: Rect.fromLTWH(60, y, 500, 30)
    );

    page.graphics.drawString(":",
      PdfStandardFont(PdfFontFamily.helvetica, 16),
      bounds: Rect.fromLTWH(220, y, 10, 30),
    );

    page.graphics.drawString(userName,
        PdfStandardFont(PdfFontFamily.helvetica, 16),
        bounds: Rect.fromLTWH(240, y, 500, 30)
    );

    y += 40;

    // phoneNO

    page.graphics.drawString("Phone Number",
        PdfStandardFont(PdfFontFamily.helvetica, 16),
        bounds: Rect.fromLTWH(60, y, 500, 30)
    );

    page.graphics.drawString(":",
      PdfStandardFont(PdfFontFamily.helvetica, 16),
      bounds: Rect.fromLTWH(220, y, 10, 30),
    );

    page.graphics.drawString(phoneNo,
        PdfStandardFont(PdfFontFamily.helvetica, 16),
        bounds: Rect.fromLTWH(240, y, 500, 30)
    );
    y += 40;
    //house start

    page.graphics.drawString("House/Flat No",
        PdfStandardFont(PdfFontFamily.helvetica, 16),
        bounds: Rect.fromLTWH(60, y, 500, 30)
    );

    page.graphics.drawString(":",
      PdfStandardFont(PdfFontFamily.helvetica, 16),
      bounds: Rect.fromLTWH(220, y, 10, 30),
    );

    page.graphics.drawString(houseNo,
        PdfStandardFont(PdfFontFamily.helvetica, 16),
        bounds: Rect.fromLTWH(240, y, 500, 30)
    );
    y += 40;
    //street

    page.graphics.drawString("Street",
        PdfStandardFont(PdfFontFamily.helvetica, 16),
        bounds: Rect.fromLTWH(60, y, 500, 30)
    );

    page.graphics.drawString(":",
      PdfStandardFont(PdfFontFamily.helvetica, 16),
      bounds: Rect.fromLTWH(220, y, 10, 30),
    );

    page.graphics.drawString(userStreet,
        PdfStandardFont(PdfFontFamily.helvetica, 16),
        bounds: Rect.fromLTWH(240, y, 500, 30));
    y += 40;

//city start
    page.graphics.drawString("City",
        PdfStandardFont(PdfFontFamily.helvetica, 16),
        bounds: Rect.fromLTWH(60, y, 500, 30)
    );

    page.graphics.drawString(":",
      PdfStandardFont(PdfFontFamily.helvetica, 16),
      bounds: Rect.fromLTWH(220, y, 10, 30),
    );

    page.graphics.drawString(userCity,
        PdfStandardFont(PdfFontFamily.helvetica, 16),
        bounds: Rect.fromLTWH(240, y, 500, 30));
    y += 40;

    page.graphics.drawString("Review about this app",
        PdfStandardFont(PdfFontFamily.helvetica, 16),
        bounds: Rect.fromLTWH(60, y, 500, 30)
    );

    page.graphics.drawString(":",
      PdfStandardFont(PdfFontFamily.helvetica, 16),
      bounds: Rect.fromLTWH(220, y, 10, 30),
    );

    page.graphics.drawString(userReview,
        PdfStandardFont(PdfFontFamily.helvetica, 16),
        bounds: Rect.fromLTWH(240, y, 500, 30));
    y += 40;

    // Six text ends here


    /// FORM FIELDS START



    // Save PDF to bytes start


    List<int>bytes = await document.save();

    document.dispose();

    // Save in phone Download folder start

    String path = "/storage/emulated/0/Download/registration_form.pdf";


    return Uint8List.fromList(bytes);

    // Open PDF

    await OpenFile.open(path);

    print("PDF Saved successfully");
  }

}