import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:noseri_app/services/bar_chart_series.dart';

class BarChart extends StatelessWidget {
  final List<KwhSeries> data;
  BarChart({required this.data});

  @override
  Widget build(BuildContext context) {
    List<charts.Series<KwhSeries, String>> series = [
      charts.Series(
        id: "kWh",
        data: data,
        domainFn: (KwhSeries series, _) => series.day,
        measureFn: (KwhSeries series, _) => series.kwh,
        colorFn: (KwhSeries series, _) => series.barColor,
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
