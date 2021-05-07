import 'package:flutter/material.dart';
import 'package:noseri_app/screens/home_screen.dart';
import 'package:noseri_app/screens/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
      );
  }
}
