import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:noseri_app/models/BarChartSeries.dart';

// Define o grafico de barras horizontal.
class HorizontalBarChart extends StatelessWidget {
  final List<BarChartSeries> data;

  HorizontalBarChart({required this.data});

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
      vertical: true,
      domainAxis: charts.OrdinalAxisSpec(
        renderSpec: charts.SmallTickRendererSpec(labelRotation: 60),
      ),
    );
  }
}
