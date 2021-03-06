import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:noseri_app/custom_widgets/lixeira/CircularChartSeries.dart';

class CircularChart extends StatelessWidget {
  final data;

  CircularChart({required this.data});

  _getSeriesData() {
    List<charts.Series<CircularChartSeries, String>> series = [
      charts.Series(
          id: "Grades",
          data: data,
          labelAccessorFn: (CircularChartSeries row, _) =>
              '${row.load}: ${row.kwh}',
          domainFn: (CircularChartSeries grades, _) => grades.load,
          measureFn: (CircularChartSeries grades, _) => grades.kwh)
    ];
    return series;
  }

  @override
  Widget build(BuildContext context) {
    return charts.PieChart(
      _getSeriesData(),
      animate: true,
      behaviors: [new charts.DatumLegend()],
      defaultRenderer: new charts.ArcRendererConfig(),
    );
  }
}
