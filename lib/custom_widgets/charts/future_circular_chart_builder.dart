import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:noseri_app/custom_widgets/charts/circular_chart.dart';
import 'package:noseri_app/models/circular_chart_series.dart';
import 'package:noseri_app/services/networking.dart';

class FutureCircularChartBuilder extends StatelessWidget {
  const FutureCircularChartBuilder({
    required this.url,
  });

  final String url;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CircularChartSeries>>(
      //initialData: chartData,
      future: NetworkHelper().fetchCircularData(url),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            return CircularChart(data: snapshot.requireData);
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
