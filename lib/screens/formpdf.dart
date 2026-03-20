import 'package:flutter/material.dart';
import 'package:flutter_basic/authmanagement/createformauth.dart';

class AppRegForm extends StatelessWidget {
  AppRegForm({super.key});
  
      TextEditingController userName = TextEditingController();
      TextEditingController phoneNo = TextEditingController();
      TextEditingController houseNo= TextEditingController();
          TextEditingController userStreet = TextEditingController();
           TextEditingController userCity = TextEditingController();
               TextEditingController userReview = TextEditingController();

  final _AppRegForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registration Form"),
        backgroundColor: Colors.blue[400],
      ),
      body: SafeArea(
        child:Form(
          key: _AppRegForm,
          child:
          Padding(padding: EdgeInsets.symmetric(horizontal: 12,vertical: 12),
            child:ListView(
            children: [


              Text("Name",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700,color: Colors.blue[400])),
              TextFormField(
                controller: userName,
                validator: (userName){
                  if (userName != null && userName.isEmpty){
                    return "Enter name";
                  }
                },
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black
                    )
                  ),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black
                    )
                  ),
                )
              ),


              Text("Phone Number",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700,color: Colors.blue[400])),
              TextFormField(
                maxLength: 10,
                  controller: phoneNo,
                  validator: (phoneNo){
                    if (phoneNo != null && phoneNo.isEmpty){
                      return "Enter name";
                    }
                  },
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.black
                        )
                    ),
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.black
                        )
                    ),
                  )
              ),

              Text("House/Flat No",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700,color: Colors.blue[400])),
              TextFormField(
                  controller: houseNo,
                  validator: (houseNo){
                    if (houseNo != null && houseNo.isEmpty){
                      return "Enter name";
                    }
                  },
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.black
                        )
                    ),
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.black
                        )
                    ),
                  )
              ),

              Text("Street",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700,color: Colors.blue[400])),
              TextFormField(
                  controller: userStreet,
                  validator: (userStreet){
                    if (userStreet != null && userStreet.isEmpty){
                      return "Enter name";
                    }
                  },
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.black
                        )
                    ),
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.black
                        )
                    ),
                  )
              ),

              Text("City",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700,color: Colors.blue[400])),
              TextFormField(
                  controller: userCity,
                  validator: (userCity){
                    if (userCity != null && userCity.isEmpty){
                      return "Enter name";
                    }
                  },
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.black
                        )
                    ),
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.black
                        )
                    ),
                  )
              ),

              Text("Review about this app",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700,color: Colors.blue[400])),
              TextFormField(
                  controller: userReview,
                  validator: (userReview){
                    if (userReview != null && userReview.isEmpty){
                      return "Enter name";
                    }
                  },
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.black
                        )
                    ),
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.black
                        )
                    ),
                  )
              ),
              
              ElevatedButton(onPressed: () async {
                if (_AppRegForm.currentState!.validate()) {
                  await FormAuth().SaveForm(userName.text, phoneNo.text, houseNo.text, userStreet.text, userCity.text, userReview.text);

                  
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Form saved successfully"),
                  )
                  );

                }
                },
              child: Text("Submit"))
            ],
          )
      ,),
    ),)



    );
  }
}
