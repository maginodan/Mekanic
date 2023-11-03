// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:layouts/splashscreen.dart';

Future main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // if (kIsWeb) {
  //   await Firebase.initializeApp(
  //       options: FirebaseOptions(
  //           apiKey: "AIzaSyA8phQrtR8IWl1epgUo6z4Dra5vW_L2hlM",
  //           appId: "1:327955333423:web:7c745b55c84a1f3d66e1da",
  //           messagingSenderId: "327955333423",
  //           projectId: "mydb-23d9b"));
  // }
  // await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Page',
      theme: ThemeData(
        primaryColor:
            Colors.greenAccent, // You can change the primary color here
      ),
      home: const Splashscreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
