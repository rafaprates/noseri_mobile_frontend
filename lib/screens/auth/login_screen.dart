import 'package:flutter/material.dart';
import 'package:noseri_app/screens/main/main_screen.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AuthTextInput(label: "E-mail"),
          AuthTextInput(label: "Senha"),
          AuthButton(label: "Entrar"),
          AuthButton(label: "Registrar"),
        ],
      ),
    );
  }
}

class AuthButton extends StatelessWidget {
  final String label;
  const AuthButton({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 32.0),
      child: ElevatedButton(
        child: Text(label),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MainScreen(),
            ),
          );
        },
      ),
    );
  }
}

class AuthTextInput extends StatelessWidget {
  final String label;
  const AuthTextInput({required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(32.0, 32, 32.0, 8.0),
      child: TextField(
        decoration: InputDecoration(labelText: label),
      ),
    );
  }
}
