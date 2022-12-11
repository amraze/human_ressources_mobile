import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'home_page.dart';

void main() {
  runApp(MaterialApp(initialRoute: '/login_screen', routes: {
    '/home_page': (context) => const HomePage(),
    '/login_screen': (context) => const LoginScreen(),
  }));
}
