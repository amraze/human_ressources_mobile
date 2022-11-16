import 'package:flutter/material.dart';


import 'package:flutter/material.dart';
import 'LoginScreen.dart';
import 'projects.dart';

void main() {
  runApp( MyApp(
  // initialRoute: '/login',
  // routes:{
  //   '/':(context) => LoginScreen(),
  //   '/login':(context) => LoginScreen(),
  //   '/projects':(context)=>projects(),

  // }

  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({ Key? key}) : super(key:key);

  @override 
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State <HomePage> {
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: projects(),
    );
  }
}

