import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:noseri_app/models/bar_chart_series.dart';
import 'package:noseri_app/models/circular_chart_series.dart';

class NetworkHelper {
  String? load = 'geladeira';
  String? from;
  String? until;
  String? url;

  NetworkHelper({this.load, this.from, this.until, this.url});

  String getFrom() {
    return '$from';
  }

  String getUntil() {
    return '$until';
  }

  setFrom(String from) {
    this.from = from;
  }

  setUntil(String until) {
    this.from = until;
  }

  Future<List<BarChartSeries>> fetchBarData(url) async {
    final response = await http.get(
      Uri.parse(url),
    );

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      List<BarChartSeries> dataList = [];
      for (var d in jsonData) {
        BarChartSeries data =
            BarChartSeries(date: d["data"], kwh: d["kwh_sum"]);
        dataList.add(data);
        //print("data: ${data.date}");
      }
      return dataList;
    } else {
      throw Exception('Failed to load..');
    }
  }

  Future<List<CircularChartSeries>> fetchCircularData(url) async {
    final response = await http.get(
      Uri.parse(url),
    );

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      List<CircularChartSeries> dataList = [];
      for (var d in jsonData) {
        CircularChartSeries data =
            CircularChartSeries(load: d["load_name"], kwh: d["kwh_sum"]);
        dataList.add(data);
        print("data: ${data.load}, ${data.kwh}");
      }
      return dataList;
    } else {
      throw Exception('Failed to load..');
    }
  }
}
