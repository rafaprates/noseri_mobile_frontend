import 'package:flutter/material.dart';
import 'package:noseri_app/screens/charts/summary_chart_screen.dart';
import 'package:noseri_app/utilities/constants.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        leading: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Image.network(kUfmtLogoUrl)),
        title: Text('NOSERI - UFMT'),
      ),
      body: SummaryChartScreen(),
    );
  }
}
