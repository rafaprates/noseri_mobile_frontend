class HorizontalBarSeries {
  final String load;
  final double kwh;

  HorizontalBarSeries({
    required this.load,
    required this.kwh,
  });

  factory HorizontalBarSeries.fromJson(Map<String, dynamic> json) {
    return HorizontalBarSeries(
      load: json["load_name"],
      kwh: json["kwh_sum"],
    );
  }
}
