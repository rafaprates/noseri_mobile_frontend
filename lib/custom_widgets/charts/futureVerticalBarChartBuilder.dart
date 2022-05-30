import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:noseri_app/models/VerticalBarChartSeries.dart';
import 'package:noseri_app/services/networking.dart';

import 'verticalBarChart.dart';

// Responsavel por buscar os dados no servidor e construir o UI quando
// os dados forem recebidos.
class FutureVerticalBarChartBuilder extends StatelessWidget {
  const FutureVerticalBarChartBuilder({
    required this.url,
  });

  final String url;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<VerticalBarChartSeries>>(
      //initialData: chartData,
      future: NetworkHelper().fetchVerticalBarData(url),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            return VerticalBarChart(data: snapshot.requireData);
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
