import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Authmanage {
  Future<void> signUp(String username, String userpass, String usermobile) async{
  try {
    UserCredential userCredential = await FirebaseAuth.instance.
  createUserWithEmailAndPassword(email: username, password: userpass);
    String uid = userCredential.user!.uid; //Create user in Firebase Authentication

    await FirebaseFirestore.instance
  .collection("Users")
  .doc(uid)
  .set({
    "email": username,
  "mobile": usermobile,
  "uid": uid,
  "created at": FieldValue.serverTimestamp()
  });

    print("User saved successfully");
  }

  catch (e) {
    print("SignUp error: $e");
  }
}
}