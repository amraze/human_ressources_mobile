import 'package:flutter/material.dart';
import 'LoginScreen.dart';
import 'projects.dart';
import 'HomePage.dart';

void main() {
  runApp(MaterialApp(
      initialRoute: '/homePage',
      routes:{
      '/homePage':(context) => HomePage(),
      '/login':(context) => LoginScreen(),
      '/projects':(context)=>projects(),
  }
    ));
}

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return 
//   }
// }



