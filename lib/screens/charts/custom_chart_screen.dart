import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:noseri_app/custom_widgets/charts/chart_card.dart';
import 'package:noseri_app/custom_widgets/charts/future_bar_chart_buider.dart';
import 'package:noseri_app/custom_widgets/date_range_picker.dart';
import 'package:noseri_app/custom_widgets/load_dropdown_button.dart';
import 'package:noseri_app/models/bar_chart_series.dart';
import 'package:noseri_app/services/networking.dart';
import 'package:noseri_app/utilities/constants.dart';

class CustomChartScreen extends StatefulWidget {
  @override
  _CustomChartScreenState createState() => _CustomChartScreenState();
}

class _CustomChartScreenState extends State<CustomChartScreen> {
  NetworkHelper? networkHelper = NetworkHelper();

  Future<String> getData() async {
    // Aceita String url como entrada
    // Retorna o corpo da resposta
    String url =
        'http://noseri-api.herokuapp.com/api/flutter/kwh?load=ar-condicionado';

    final response = await http.get(
      Uri.parse(url),
    );

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<List<BarChartSeries>> fetchData() async {
    String url =
        'http://noseri-api.herokuapp.com/api/flutter/kwh?load=ar-condicionado';

    final response = await http.get(
      Uri.parse(url),
    );

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      List<BarChartSeries> dataList = [];
      for (var d in jsonData) {
        BarChartSeries data =
            BarChartSeries(date: d["timestamp"], kwh: d["kwh"]);
        dataList.add(data);
        print("data: ${data.date}");
      }
      return dataList;
    } else {
      throw Exception('Failed to load album');
    }
  }

  parseToJson(data) {
    return jsonDecode(data);
  }

  fromJsonToBarChartSeries(jsonData) {
    return BarChartSeries.fromJson(jsonData);
  }

  List<BarChartSeries> chartData = [
    BarChartSeries(date: "", kwh: 0.0),
    BarChartSeries(date: "", kwh: 0.0),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(title: Text("NOSERI - UFMT")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text('Carga: ', style: kLabelTextStyle),
                Expanded(child: loadDropdownButton(networkHelper)),
              ],
            ),
            SizedBox(height: kSpaceBetweenCols),
            Text('Intervalo de Tempo:', style: kLabelTextStyle),
            SizedBox(height: 5.0),
            DateRangePicker(networkHelper),
            SizedBox(height: 15.0),
            ElevatedButton(
              child: Text('Atualizar gráfico'),
              onPressed: () {
                NetworkHelper().fetchBarData(
                    'http://noseri-api.herokuapp.com/api/flutter/kwh');
                setState(() {});
              },
            ),
            SizedBox(height: kSpaceBetweenCols),
            Container(
              child: ChartCard(
                title: "Titulo",
                child: FutureBarChartBuilder(
                  url: 'http://noseri-api.herokuapp.com/api/flutter/kwh',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
