import 'package:flutter/material.dart';
import 'home_page.dart';
import 'login_screen.dart';
import '../performance_utils/performance.dart';

void main() {
  runApp(MaterialApp(initialRoute: '/login_screen', routes: {
    '/home_page': (context) => const HomePage(),
    '/login_screen': (context) => const LoginScreen(),
    '/performance': (context) => const Performance(),
  }));
}
