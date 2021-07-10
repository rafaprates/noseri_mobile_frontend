import 'package:flutter/material.dart';
import 'package:noseri_app/screens/charts/summary_chart_screen.dart';
import 'package:noseri_app/screens/main/main_screen.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(32.0, 32, 32.0, 8.0),
            child: TextField(
              decoration: InputDecoration(labelText: "E-mail"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(32.0, 8.0, 32.0, 32.0),
            child: TextField(
              decoration: InputDecoration(labelText: "Senha"),
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 32.0),
            child: ElevatedButton(
              child: Text('Entrar'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MainScreen(),
                  ),
                );
              },
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 32.0),
            child: ElevatedButton(
              child: Text('Registrar'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SummaryChartScreen(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
