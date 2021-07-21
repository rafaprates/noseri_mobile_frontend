import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:noseri_app/models/bar_chart_series.dart';
import 'package:noseri_app/services/networking.dart';

import 'bar_chart.dart';

class FutureBarChartBuilder extends StatelessWidget {
  const FutureBarChartBuilder({
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
            return BarChart(data: snapshot.requireData);
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
