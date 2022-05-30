import 'package:flutter/material.dart';
import 'package:noseri_app/screens/OptionsScreen.dart';
import 'package:noseri_app/screens/charts/custom_chart_screen.dart';
import 'package:noseri_app/screens/charts/summaryChartScreen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int pageIndex = 0;
  int _currentIndex = 0;

  List<Widget> pageList = <Widget>[
    SummaryChartScreen(),
    CustomChartScreen(),
    OptionsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageList[pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: pageIndex,
        onTap: (value) {
          setState(() {
            pageIndex = value;
          });
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "",
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.addchart),
            label: "",
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "",
            backgroundColor: Colors.red,
          ),
        ],
      ),
    );
  }
}
