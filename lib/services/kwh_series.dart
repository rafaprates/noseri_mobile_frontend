import 'package:charts_flutter/flutter.dart' as charts;

class KwhSeries {
  final String day;
  final double kwh;
  final charts.Color barColor;

  KwhSeries({
    required this.day,
    required this.kwh,
    required this.barColor,
  });
}
