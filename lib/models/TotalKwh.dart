class TotalKwh {
  late final double kwh;

  TotalKwh({required this.kwh});

  factory TotalKwh.fromJson(Map<String, dynamic> json) {
    return TotalKwh(
      kwh: json["kwh_sum"],
    );
  }
}
