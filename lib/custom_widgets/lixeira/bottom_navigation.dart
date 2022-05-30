/*
import 'package:flutter/material.dart';
import 'package:noseri_app/screens/charts/summaryChartScreen.dart';
import 'package:noseri_app/screens/home_screen.dart';

class BottomNavigation extends StatefulWidget {
  final int index;

  BottomNavigation({required this.index});

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _currentIndex = 0;

  List<Widget> pageList = <Widget>[
    SummaryChartScreen(),
    HomeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
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
      onTap: (index) {
        setState(() {
          _currentIndex = widget.index;
        });
      },
    );
  }
}
*/
