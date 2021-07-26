import 'package:flutter/material.dart';
import 'package:noseri_app/utilities/constants.dart';

class ChartCard extends StatefulWidget {
  final String title;
  final child;
  ChartCard({required this.title, required this.child});

  @override
  _ChartCardState createState() => _ChartCardState();
}

class _ChartCardState extends State<ChartCard> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        child: Container(
          height: 500.0,
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: kSpaceBetweenCols),
              Text(widget.title, style: kChartLabelTextStyle),
              Expanded(
                  child: Padding(
                padding: EdgeInsets.all(8.0),
                child: widget.child,
              )),
            ],
          ),
        ),
      ),
    );
  }
}
