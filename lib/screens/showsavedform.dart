import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:flutter_basic/screens/user_session.dart';

class SavePDFShowScreen extends StatelessWidget {
  const SavePDFShowScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Saved Form Lists"),backgroundColor: Colors.blue,),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("List_of_forms")
              .where("loginMobile",isEqualTo: UserSession.mobileNumber)
              .orderBy("createdAt", descending: true)
              .snapshots(),

          builder: (context,snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } //waiting for data

            if (
            !snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return Center(
                child: Text("No Form found"),
              );
            } // no data

            //show data start


            var forms = snapshot.data!.docs;


            return ListView.builder(

                itemCount: forms.length,

                itemBuilder: (context, index) {
                  var data = forms[index];
                  Timestamp? time = data["createdAt"];
                  String formattedDate = "Loading...";

                  if (time != null){
                    DateTime date = time.toDate();
                    formattedDate = DateFormat('dd MM yyyy, hh mm a').format(date);
                  }


                  return Card(
                    elevation: 3,
                    margin: EdgeInsets.all(12),
                    child: ListTile(

                      title: Text(data["Name"],
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),),

                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          SizedBox(height: 5,),

                          Text(data["Phone Number"],
                            style: TextStyle(fontSize: 16),
                          ),

                          SizedBox(height: 8,),

                          Text("Created : $formattedDate",
                          style: TextStyle(fontSize: 14,color: Colors.grey),),


                        ],
                      ),
                      trailing: Icon(Icons.arrow_forward_ios),

                      onTap: (){

                      },
                    ),

                  );
                }
            );
          }
          )

            );
          }
  }

