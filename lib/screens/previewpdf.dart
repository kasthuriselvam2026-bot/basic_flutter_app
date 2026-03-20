/*


import 'package:flutter/material.dart';
import 'package:printing/printing.dart';
import 'dart:typed_data';


class PreViewPdf extends StatelessWidget {

  final String userName;
  final String phoneNo;
  final String houseNo;
  final String userStreet;
  final String userCity;
  final String userReview;

  PreViewPdf({super.key,
  required this.userName,
  required this.phoneNo,
  required this.houseNo,
  required this.userStreet,
  required this.userCity,
  required this.userReview,
  });



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("PDF PREVIEW",)),
        /// GENERATE PDF START
      body:
        PdfPreview(build: (format){

             return FormAuth().generatePDFBytes(userName, phoneNo, houseNo, userStreet, userCity, userReview);

},
          onPrinted: (Context) async
          {
await FormAuth().SaveForm(userName, phoneNo, houseNo, userStreet, userCity, userReview);
ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Downloaded successfully"))
);
          },

            onShared: (Context) async
        {
        await FormAuth().SaveForm(userName, phoneNo, houseNo, userStreet, userCity, userReview);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Downloaded successfully"))
        );
        }
),



    );
  }
}
*/