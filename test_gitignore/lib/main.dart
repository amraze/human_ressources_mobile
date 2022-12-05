import 'package:flutter/material.dart';
import 'LoginScreen.dart';
import 'projects.dart';
import 'HomePage.dart';
import 'Tasks.dart';


void main() {
  runApp(MaterialApp(
      initialRoute: '/homePage',
      routes:{
      '/homePage':(context) => HomePage(),
      '/login':(context) => LoginScreen(),
      '/projects':(context)=>projects(),
      '/tasks':(context)=>Tasks(),

  }
    ));
}





