import 'package:flutter/material.dart';
import 'signin.dart';
import 'package:flutter_basic/authmanagement/authmanage.dart';

class AppSignup extends StatelessWidget {
   AppSignup({super.key});

  TextEditingController username = TextEditingController();
  TextEditingController usermobile = TextEditingController();
  TextEditingController userpass = TextEditingController();
  TextEditingController userConfirm = TextEditingController();
  final _AppSignUp = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Form(
          key: _AppSignUp,
          child: ListView(children: [
          SizedBox(
            height: 250,
            child: Image.asset("assets/png_images/signin.png"),
          ),

            Padding(padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
              child:
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Username",style: TextStyle(fontSize: 15,color: Colors.indigo[900]),),
                  TextFormField(
                    controller: username,
                    validator: (username){
                      if(username != null && username.isEmpty){
                        return "Enter your mail id";
                      }
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)
                      ),
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Padding(padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
              child:
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Mobile number",style: TextStyle(fontSize: 15,color: Colors.indigo[900]),),
                  TextFormField(
                    controller: usermobile,
                    validator: (usermobile){
                      if (usermobile != null && usermobile.isEmpty){
                        return "Enter mobile number";
                      };
                    },
                    keyboardType: TextInputType.number,
                    maxLength: 10,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.phone_android),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)
                      ),
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)
                      ),
                    ),
                  ),
                ],
              ),
            ),


            Padding(padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
              child:
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("New password",style: TextStyle(fontSize: 15,color: Colors.indigo[900]),),
                  TextFormField(
                    controller: userpass,
                    validator: (userpass){
                      if (userpass != null && userpass.isEmpty){
                        return "Enter new password";
                      };
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.password_outlined),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)
                      ),
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)
                      ),
                    ),
                  ),
                ],
              ),
            ),


            Padding(padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
              child:
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Confirm password",style: TextStyle(fontSize: 15,color: Colors.indigo[900]),),
                  TextFormField(
                    controller: userConfirm,
                    validator: (userConfirm){
                      if (userConfirm != null && userConfirm.isEmpty){
                        return "Enter password to confirm";
                      };
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.password_outlined),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)
                      ),
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)
                      ),
                    ),
                  ),
                ],
              ),
            ),



            Padding(padding: EdgeInsets.all(20),
               child: ElevatedButton(onPressed: () async {
                 if (_AppSignUp.currentState!.validate()){
                   await Authmanage().signUp(username.text.trim(), userpass.text.trim(), usermobile.text.trimLeft());
                   print("Signup Successfully");
                 }
               },
child: Text("Sign up"),
                 style: ElevatedButton.styleFrom(
                   backgroundColor: Colors.indigo[900],
                   foregroundColor: Colors.white,
                   shape: RoundedRectangleBorder(
                     borderRadius: BorderRadiusGeometry.circular(20.0),
                   )
                 )
            ),
            ),


            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Already have an account?"),

                  TextButton(onPressed:(
                      ){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return AppSignInScreen();
                    }
                    )
                    );
                  },
                      child: Text("Sign in"),

                  ),
                ],
              ),
            ),



        ],
      ),
      ),
      ),

    );
  }
}
