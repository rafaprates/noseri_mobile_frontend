class BarChartSeries {
  final String date;
  final double kwh;

  BarChartSeries({
    required this.date,
    required this.kwh,
  });

  factory BarChartSeries.fromJson(Map<String, dynamic> json) {
    return BarChartSeries(
      date: json["ts"],
      kwh: json["kwh"],
    );
  }
}
