import 'package:flutter/material.dart';
import 'package:flutter_basic/screens/showsavedform.dart';
import 'package:flutter_basic/screens/formpdf.dart';

class CreateFormHomeScreen extends StatelessWidget {
  const CreateFormHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("GOOGLE FORM CREATION"),backgroundColor: Colors.blue[400],),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
      child:

      Column(

        children: [
          SizedBox(height: 80,width: 300,child:
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor:
                Colors.blue,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                ),
                padding: EdgeInsets.symmetric(
                    vertical: 15),
              ),
              onPressed:(){
               Navigator.push(context, MaterialPageRoute(builder: (context){
                 return AppRegForm();
               })
               );
              },
              child:
              Row(
mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add),
                  SizedBox(width: 15,),
                  Text("New Form Create")
                ],
              )
          ),),

          SizedBox(height: 50,),

          SizedBox(height: 80,width: 300,child:
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor:
                Colors.blue,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                ),
                padding: EdgeInsets.symmetric(
                    vertical: 15),
              ),
              onPressed:(){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return SavePDFShowScreen();
                }
                )
                );

              },
              child:
              Row(
mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add),
                  SizedBox(width: 8,),
                  Text("Show saved form")
                ],
              )
          ),),



        ],
      ),),
    );
  }
}
