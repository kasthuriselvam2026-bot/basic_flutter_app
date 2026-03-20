import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_basic/screens/newapptrain.dart';
import 'firebase_options.dart';
import 'package:open_file/open_file.dart';
import 'package:flutter/material.dart';
import 'screens/signin.dart';
import 'package:flutter_basic/screens/shophome.dart';
import 'package:flutter_basic/screens/formpdf.dart';
import 'package:flutter_basic/screens/createformlogin.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    debugShowCheckedModeBanner: false;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Deal converter',
        theme: ThemeData(primarySwatch:Colors.indigo),
        home: NewAppTrain()
    );
  }
}
