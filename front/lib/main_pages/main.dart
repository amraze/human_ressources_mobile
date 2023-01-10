import 'package:flutter/material.dart';
import 'package:mobile_project/body_containers/tasks.dart';
import 'home_page.dart';
import 'login_screen.dart';
import '../performance_utils/Performance.dart';

void main() {
  runApp(MaterialApp(initialRoute: '/login_screen', routes: {
    '/home_page': (context) => const HomePage(),
    '/login_screen': (context) => const LoginScreen(),
    '/performance': (context) => const PerPage(),
    '/tasks': (context) => const Tasks(tasksInfo: []),
  }));
}
