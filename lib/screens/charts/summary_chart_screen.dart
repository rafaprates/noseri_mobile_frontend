import 'package:flutter/material.dart';
import 'package:noseri_app/custom_widgets/charts/chart_card.dart';
import 'package:noseri_app/custom_widgets/charts/future_bar_chart_buider.dart';
import 'package:noseri_app/custom_widgets/charts/future_circular_chart_builder.dart';
import 'package:noseri_app/custom_widgets/info_summary_card.dart';
import 'package:noseri_app/models/circular_chart_series.dart';
import 'package:noseri_app/utilities/constants.dart';

class SummaryChartScreen extends StatefulWidget {
  final data = [
    CircularChartSeries(load: 'Ar-condicionado', kwh: 190),
    CircularChartSeries(load: 'MIT', kwh: 230),
    CircularChartSeries(load: 'Iluminacao', kwh: 150),
    CircularChartSeries(load: 'Outros', kwh: 73),
  ];

  @override
  _SummaryChartScreenState createState() => _SummaryChartScreenState();
}

class _SummaryChartScreenState extends State<SummaryChartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("NOSERI - UFMT")),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          SizedBox(height: kSpaceBetweenCols),
          info_summary_card(title: "Consumo este mes: ", value: "300"),
          SizedBox(height: kSpaceBetweenCols),
          info_summary_card(title: "Media diaria: ", value: "13"),
          SizedBox(height: kSpaceBetweenCols),
          Container(
            child: ChartCard(
              title: "Hoje",
              child: FutureBarChartBuilder(
                url:
                    'http://noseri-api.herokuapp.com/api/flutter/kwh?fixedPeriod=day',
              ),
            ),
          ),
          Container(
            child: ChartCard(
              title: "Esta semana",
              child: FutureBarChartBuilder(
                url:
                    'http://noseri-api.herokuapp.com/api/flutter/kwh?fixedPeriod=week',
              ),
            ),
          ),
          Container(
            child: ChartCard(
              title: "Este mes",
              child: FutureBarChartBuilder(
                url: 'http://noseri-api.herokuapp.com/api/flutter/kwh',
              ),
            ),
          ),
          Container(
            child: ChartCard(
              title: "------",
              child: FutureCircularChartBuilder(
                url: 'http://noseri-api.herokuapp.com/api/flutter/kwh',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
