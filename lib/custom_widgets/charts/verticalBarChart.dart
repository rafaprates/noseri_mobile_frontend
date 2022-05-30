import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:noseri_app/models/VerticalBarChartSeries.dart';

// Define o grafico de barras vertical.
class VerticalBarChart extends StatelessWidget {
  final List<VerticalBarChartSeries> data;
  //final String period;

  VerticalBarChart({required this.data});

  @override
  Widget build(BuildContext context) {
    List<charts.Series<VerticalBarChartSeries, String>> series = [
      charts.Series(
        id: "kWh",
        data: data,
        domainFn: (VerticalBarChartSeries series, _) => series.load,
        measureFn: (VerticalBarChartSeries series, _) => series.kwh,
        colorFn: (VerticalBarChartSeries series, _) =>
            charts.ColorUtil.fromDartColor(Colors.blue),
      )
    ];

    return charts.BarChart(
      series,
      animate: true,
      vertical: false,
    );
  }
}
