import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:noseri_app/models/bar_chart_series.dart';

class BarChart extends StatelessWidget {
  final List<BarChartSeries> data;
  //final String period;

  BarChart({required this.data});

  var baz;

  String getYear(date) {
    return date.toString().substring(0, 4);
  }

  String getMonth(date) {
    return date.toString().substring(5, 7);
  }

  String getDay(date) {
    return date.toString().substring(8, 10);
  }

  String getHour(date) {
    return date.toString().substring(11, 13);
  }

  String getYearMonthYear(String date) {
    return date.toString().substring(0, 10);
  }

  @override
  Widget build(BuildContext context) {
    List<charts.Series<BarChartSeries, String>> series = [
      charts.Series(
        id: "kWh",
        data: data,
        domainFn: (BarChartSeries series, _) => series.date,
        measureFn: (BarChartSeries series, _) => series.kwh,
        colorFn: (BarChartSeries series, _) =>
            charts.ColorUtil.fromDartColor(Colors.blue),
      )
    ];

    return charts.BarChart(
      series,
      animate: true,
      domainAxis: charts.OrdinalAxisSpec(
        renderSpec: charts.SmallTickRendererSpec(labelRotation: 60),
      ),
    );
  }
}
