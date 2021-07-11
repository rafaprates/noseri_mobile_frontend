import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:noseri_app/custom_widgets/kwh_chart.dart';
import 'package:noseri_app/services/kwh_series.dart';
import 'package:noseri_app/utilities/constants.dart';

class ChartCard extends StatefulWidget {
  final String title;
  final data;
  ChartCard({required this.title, required this.data});

  final List<KwhSeries> Weekdata = [
    KwhSeries(
        day: "Dom",
        kwh: 2,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    KwhSeries(
        day: "Seg",
        kwh: 17,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    KwhSeries(
        day: "Ter",
        kwh: 13,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    KwhSeries(
        day: "Qua",
        kwh: 12,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    KwhSeries(
        day: "Qui",
        kwh: 20,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    KwhSeries(
        day: "Sex",
        kwh: 22,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    KwhSeries(
        day: "Sab",
        kwh: 8,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
  ];

  final List<KwhSeries> monthData = [
    KwhSeries(
        day: "01",
        kwh: 2,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    KwhSeries(
        day: "02",
        kwh: 17,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    KwhSeries(
        day: "03",
        kwh: 13,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    KwhSeries(
        day: "04",
        kwh: 12,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    KwhSeries(
        day: "05",
        kwh: 20,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    KwhSeries(
        day: "06",
        kwh: 22,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    KwhSeries(
        day: "07",
        kwh: 8,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    KwhSeries(
        day: "08",
        kwh: 15,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    KwhSeries(
        day: "09",
        kwh: 15,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    KwhSeries(
        day: "10",
        kwh: 19,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    KwhSeries(
        day: "11",
        kwh: 27,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    KwhSeries(
        day: "12",
        kwh: 17,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    KwhSeries(
        day: "13",
        kwh: 16,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    KwhSeries(
        day: "14",
        kwh: 18,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    KwhSeries(
        day: "15",
        kwh: 15,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    KwhSeries(
        day: "16",
        kwh: 12,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    KwhSeries(
        day: "17",
        kwh: 8,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    KwhSeries(
        day: "18",
        kwh: 10,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    KwhSeries(
        day: "19",
        kwh: 21,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    KwhSeries(
        day: "20",
        kwh: 13,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    KwhSeries(
        day: "21",
        kwh: 14,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    KwhSeries(
        day: "22",
        kwh: 9,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    KwhSeries(
        day: "23",
        kwh: 14,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    KwhSeries(
        day: "24",
        kwh: 17,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    KwhSeries(
        day: "25",
        kwh: 12,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    KwhSeries(
        day: "26",
        kwh: 11,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    KwhSeries(
        day: "27",
        kwh: 22,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    KwhSeries(
        day: "28",
        kwh: 12,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    KwhSeries(
        day: "29",
        kwh: 17,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    KwhSeries(
        day: "30",
        kwh: 18,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    KwhSeries(
        day: "31",
        kwh: 19,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
  ];

  @override
  _ChartCardState createState() => _ChartCardState();
}

class _ChartCardState extends State<ChartCard> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        child: Container(
          height: 300.0,
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: kSpaceBetweenCols),
              Text(
                widget.title,
                style: kChartLabelTextStyle,
              ),
              Expanded(child: KwhChart(data: widget.data))
            ],
          ),
        ),
      ),
    );
  }
}
