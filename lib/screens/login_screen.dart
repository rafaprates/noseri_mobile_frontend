import 'package:flutter/material.dart';
import 'package:noseri_app/screens/home_screen.dart';
import 'package:noseri_app/screens/loading_screen.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text('Entrar'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LoadingScreen(),
              ),
            );
          },
        ),
      ),
    );
  }
}
