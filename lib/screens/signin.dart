import 'package:flutter/material.dart';
import 'signup.dart';

class AppSignInScreen extends StatefulWidget {
  const AppSignInScreen({super.key});

  @override
  State<AppSignInScreen> createState() => _AppSignInScreenState();
}

class _AppSignInScreenState extends State<AppSignInScreen> {
  bool textvisible = true;

  final GlobalKey<FormState> _signInFormKey =
  GlobalKey<FormState>();

  TextEditingController username = TextEditingController();
  TextEditingController passwd = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _signInFormKey,
          child: ListView(
            children: [
              SizedBox(height: 40),

              SizedBox(
                height: 130,
                child: Image.asset("assets/jpg_images/deallogo.jpg"),
              ),

              Text(
                "Deal converter",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1.2,
                ),
              ),

               Text(
                "Revenue Booster",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w200,
                  letterSpacing: 1,
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
                  "Password",
                  style: TextStyle(
                    color: Colors.indigo[900],
                    fontSize: 17,
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.all(20),
                child: TextFormField(
                  controller: passwd,
                  obscureText: textvisible,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter your password";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: "Password",
                    hintText: "Enter your password",
                    prefixIcon:
                    Icon(Icons.password, color: Colors.black),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          textvisible = !textvisible;
                        });
                      },
                      icon: Icon(
                        textvisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                    ),
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
                    if (_signInFormKey.currentState!
                        .validate()) {
                      print("Login Successful");
                    }
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

              Row(
                mainAxisAlignment:
                MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return AppSignup();
                      }
                      )
                      );
                    },
                    child: Text(
                      "Forget Password?",
                      style:
                      TextStyle(color: Colors.red),
                    ),
                  ),
                ],
              ),

              Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("New User?"),

                    TextButton(onPressed:(
                        ){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return AppSignup();
                      }
                      )
                      );
                    },
                      child: Text("Signup Now"),

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