import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:noseri_app/models/bar_chart_series.dart';

class BarChart extends StatelessWidget {
  final List<BarChartSeries> data;

  BarChart({required this.data});

  @override
  Widget build(BuildContext context) {
    List<charts.Series<BarChartSeries, String>> series = [
      charts.Series(
        id: "kWh",
        data: data,
        domainFn: (BarChartSeries series, _) => series.day,
        measureFn: (BarChartSeries series, _) => series.kwh,
        //colorFn: (KwhSeries series, _) => series.barColor,
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
