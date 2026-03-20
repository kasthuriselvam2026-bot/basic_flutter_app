import 'package:flutter/material.dart';
import 'package:flutter_basic/screens/createformhomescreen.dart';
import 'package:flutter_basic/screens/user_session.dart';


class FormLoginScreen extends StatefulWidget {
  const FormLoginScreen({super.key});

  @override
  State<FormLoginScreen> createState() => _FormLoginScreenState();
}

class _FormLoginScreenState extends State<FormLoginScreen> {


  final GlobalKey<FormState> _LoginFormkey =
  GlobalKey<FormState>();

  TextEditingController username = TextEditingController();
  TextEditingController mobileNo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _LoginFormkey,
          child: ListView(
            children: [
              SizedBox(height: 40),

              SizedBox(
                height: 130,

              ),

              Text(
                "FORM CREATION",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1.2,
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(
                    top: 20, bottom: 10, left: 20, right: 20),
                child: Text(
                  "Sign In",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.indigo[900],
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Username",
                  style: TextStyle(
                    color: Colors.indigo[900],
                    fontSize: 17,
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.all(20),
                child: TextFormField(
                  controller: username,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter a valid username";
                    }
                    return null;
                  },
                  cursorColor: Colors.indigo[900],
                  decoration: InputDecoration(
                    labelText: "Username",
                    hintText: "Enter your username",
                    prefixIcon:
                    Icon(Icons.person, color: Colors.black),
                    border: OutlineInputBorder(
                      borderRadius:
                      BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),

              Padding(
                padding:
                EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Mobile Number",
                  style: TextStyle(
                    color: Colors.indigo[900],
                    fontSize: 17,
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.all(20),
                child: TextFormField(
                  controller: mobileNo,

                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter your password";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: "Mobile number",
                    hintText: "Enter your mobile number",
                    border: OutlineInputBorder(
                      borderRadius:
                      BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.all(20),
                child: ElevatedButton(
                  onPressed: () {
                    if (_LoginFormkey.currentState!
                        .validate()) {

                      UserSession.mobileNumber = mobileNo.text;

                      print("Login Successful");
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return CreateFormHomeScreen();
                      },
                      ),
                      );
                  };
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                    Colors.indigo[900],
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.symmetric(
                        vertical: 15),
                  ),
                  child: Text(
                    "Login",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}