import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final Widget body;

  Header({required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text("NOSERI - UFMT"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        child: body,
      ),
    );
  }
}
