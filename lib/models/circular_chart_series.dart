class CircularChartSeries {
  final String load;
  final double kwh;

  CircularChartSeries({
    required this.load,
    required this.kwh,
  });

  factory CircularChartSeries.fromJson(Map<String, dynamic> json) {
    return CircularChartSeries(
      load: json["load_name"],
      kwh: json["kwh_sum"],
    );
  }
}
