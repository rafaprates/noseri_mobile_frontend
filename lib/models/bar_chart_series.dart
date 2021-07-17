class BarChartSeries {
  final String day;
  final double kwh;

  BarChartSeries({
    required this.day,
    required this.kwh,
  });

  factory BarChartSeries.fromJson(Map<String, dynamic> json) {
    return BarChartSeries(
      day: json["ts"],
      kwh: json["kwh"],
    );
  }
}
