// ignore: import_of_legacy_library_into_null_safe
import 'package:charts_flutter/flutter.dart' as charts;


class KwhSeries {
  final String day;
  final double kwh;
  final charts.Color color;

  KwhSeries({
    required this.day,
    required this.kwh,
    required this.color
  });
}