import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:noseri_app/models/BarChartSeries.dart';
import 'package:noseri_app/services/networking.dart';

import 'hotizontalBarChart.dart';

// Responsavel por buscar os dados no servidor e construir o UI quando
// os dados forem recebidos.
class FutureHorizontalBarChartBuilder extends StatelessWidget {
  const FutureHorizontalBarChartBuilder({
    required this.url,
  });

  final String url;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<BarChartSeries>>(
      //initialData: chartData,
      future: NetworkHelper().fetchBarData(url),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            return HorizontalBarChart(data: snapshot.requireData);
          }
          return Text("snapshot.data: ${snapshot.data}");
        } else if (snapshot.hasError) {
          return Text("Erro");
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
