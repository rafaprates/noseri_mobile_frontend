import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:noseri_app/custom_widgets/lixeira/CircularChartSeries.dart';
import 'package:noseri_app/models/BarChartSeries.dart';
import 'package:noseri_app/models/Load.dart';
import 'package:noseri_app/models/TotalKwh.dart';
import 'package:noseri_app/models/VerticalBarChartSeries.dart';

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

  Future<double> fetchKwhMonthTotalData(url) async {
    final response = await http.get(
      Uri.parse(url),
    );
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);

      TotalKwh data = TotalKwh(kwh: jsonData["kwh_sum"]);
      return data.kwh;
    } else {
      throw Exception('Failed to load...');
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

  /*
    Resgata
   */

  Future<List<VerticalBarChartSeries>> fetchVerticalBarData(url) async {
    final response = await http.get(
      Uri.parse(url),
    );

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      List<VerticalBarChartSeries> dataList = [];
      for (var d in jsonData) {
        VerticalBarChartSeries data =
            VerticalBarChartSeries(load: d["load_name"], kwh: d["kwh_sum"]);
        dataList.add(data);
        print("data: ${data.load}, ${data.kwh}");
      }
      return dataList;
    } else {
      throw Exception('Failed to load..');
    }
  }

  // Resgata a lista de Loads (cargas) registradas no banco de dados junto com
  // o status para o usuario (se ativo, ou inativo).
  // Se ativa, o usuario deseja ver dados de kWh para esta carga.
  Future<List<Load>> fetchLoadList() async {
    final response = await http.get(
      Uri.parse("http://noseri-api.herokuapp.com/api/load/flutter"),
    );

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      List<Load> Loads = [];
      for (var d in jsonData) {
        Load data = Load(
          loadName: d["load"],
          isTracked: d["isTracked"],
        );
        Loads.add(data);
      }
      return Loads;
    } else {
      throw Exception("Failed to load..");
    }
  }

  Future<http.Response> addTrackedLoad(String loadName, String isTracked) {
    return http.post(
      Uri.parse('https://noseri-api.herokuapp.com/api/load/flutter'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=utf-8',
      },
      body: jsonEncode(<String, String>{
        'load': loadName,
        'isTracked': isTracked,
      }),
    );
  }
}
