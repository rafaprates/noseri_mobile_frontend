class VerticalBarChartSeries {
  final String load;
  final double kwh;

  VerticalBarChartSeries({
    required this.load,
    required this.kwh,
  });

  factory VerticalBarChartSeries.fromJson(Map<String, dynamic> json) {
    return VerticalBarChartSeries(
      load: json["load_name"],
      kwh: json["kwh_sum"],
    );
  }
}
