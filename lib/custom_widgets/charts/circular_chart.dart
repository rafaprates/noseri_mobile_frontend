import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:noseri_app/services/circular_chart_series.dart';

class CircularChart extends StatelessWidget {
  final data;

  CircularChart({required this.data});

  _getSeriesData() {
    List<charts.Series<kWhPerLoadData, String>> series = [
      charts.Series(
          id: "Grades",
          data: data,
          labelAccessorFn: (kWhPerLoadData row, _) => '${row.load}: ${row.kWh}',
          domainFn: (kWhPerLoadData grades, _) => grades.load,
          measureFn: (kWhPerLoadData grades, _) => grades.kWh)
    ];
    return series;
  }

  @override
  Widget build(BuildContext context) {
    return charts.PieChart(
      _getSeriesData(),
      animate: true,
      defaultRenderer: new charts.ArcRendererConfig(
          arcWidth: 200,
          arcRendererDecorators: [new charts.ArcLabelDecorator()]),
    );
  }
}
