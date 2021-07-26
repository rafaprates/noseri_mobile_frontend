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

String unidade = "kwh";

class _SummaryChartScreenState extends State<SummaryChartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(title: Text("NOSERI - UFMT")),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          SizedBox(height: kSpaceBetweenCols),
          info_summary_card(title: "Consumo este mes: ", value: "300"),
          SizedBox(height: kSpaceBetweenCols),
          info_summary_card(title: "Media diaria: ", value: "13"),
          SizedBox(height: kSpaceBetweenCols),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    "Unidade",
                  ),
                ),
              ),
              Expanded(child: Container()),
              ElevatedButton(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text("kWh"),
                ),
                onPressed: () {
                  unidade = "kwh";
                  setState(() {});
                },
              ),
              SizedBox(width: 8.0),
              ElevatedButton(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(" R\$"),
                ),
                onPressed: () {
                  unidade = "reais";
                  setState(() {});
                },
              ),
            ],
          ),
          Container(
            child: ChartCard(
              title: "Hoje",
              child: FutureBarChartBuilder(
                url:
                    'http://noseri-api.herokuapp.com/api/flutter/kwh?aggregator=by_hours_in_a_day&unidade=${unidade}',
              ),
            ),
          ),
          Container(
            child: ChartCard(
              title: "Esta semana",
              child: FutureBarChartBuilder(
                url:
                    'http://noseri-api.herokuapp.com/api/flutter/kwh?aggregator=by_days_in_a_week&unidade=${unidade}',
              ),
            ),
          ),
          Container(
            child: ChartCard(
              title: "Este mes",
              child: FutureBarChartBuilder(
                url:
                    'http://noseri-api.herokuapp.com/api/flutter/kwh?aggregator=by_days_in_a_month&unidade=${unidade}',
              ),
            ),
          ),
          Container(
            child: ChartCard(
              title: "Pro carga neste mes",
              child: FutureCircularChartBuilder(
                url:
                    'http://noseri-api.herokuapp.com/api/flutter/kwh?aggregator=by_load_in_a_month',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
