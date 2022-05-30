import 'package:flutter/material.dart';
import 'package:noseri_app/custom_widgets/charts/chartCard.dart';
import 'package:noseri_app/custom_widgets/charts/futureHorizontalBarChartBuilder.dart';
import 'package:noseri_app/custom_widgets/charts/futureVerticalBarChartBuilder.dart';
import 'package:noseri_app/custom_widgets/header.dart';
import 'package:noseri_app/services/networking.dart';
import 'package:noseri_app/utilities/constants.dart';

class SummaryChartScreen extends StatefulWidget {
  @override
  _SummaryChartScreenState createState() => _SummaryChartScreenState();
}

String unidade = "kwh";
IconData selectedIcon = Icons.check_outlined;
IconData unselectedIcon = Icons.check_box_outline_blank;
IconData kwhIcon = selectedIcon;
IconData reaisIcon = unselectedIcon;

class _SummaryChartScreenState extends State<SummaryChartScreen> {
  @override
  Widget build(BuildContext context) {
    return Header(
      body: ListView(
        children: <Widget>[
          Expanded(
            child: Row(
              children: [
                Text("Consumo este mes", style: kLabelTextStyle),
                Expanded(child: Container()),
                FutureKwhTotalBuilder(),
                Text(" kWh", style: kLabelTextStyle)
              ],
            ),
          ),
          SizedBox(height: kSpaceBetweenCols),
          Row(
            children: [
              Expanded(
                child: Text("Unidade", style: kLabelTextStyle),
              ),
              Expanded(child: Container()),
              Text("kWh", style: kLabelTextStyle),
              IconButton(
                icon: Icon(kwhIcon),
                onPressed: () {
                  unidade = "kwh";
                  IconData kwhIconBefore = kwhIcon;
                  IconData reaisIconBefore = reaisIcon;
                  reaisIcon = kwhIconBefore;
                  kwhIcon = reaisIconBefore;
                  setState(() {});
                },
              ),
              SizedBox(width: 8.0),
              Text("R\$", style: kLabelTextStyle),
              IconButton(
                icon: Icon(reaisIcon),
                onPressed: () {
                  unidade = "reais";
                  IconData kwhIconBefore = kwhIcon;
                  IconData reaisIconBefore = reaisIcon;
                  reaisIcon = kwhIconBefore;
                  kwhIcon = reaisIconBefore;
                  setState(() {});
                },
              ),
            ],
          ),
          Container(
            child: ChartCard(
              title: "Hoje",
              child: FutureHorizontalBarChartBuilder(
                url:
                    'http://noseri-api.herokuapp.com/api/flutter/kwh?aggregator=by_hours_in_a_day&unidade=${unidade}',
              ),
            ),
          ),
          Container(
            child: ChartCard(
              title: "Esta semana",
              child: FutureHorizontalBarChartBuilder(
                url:
                    'http://noseri-api.herokuapp.com/api/flutter/kwh?aggregator=by_days_in_a_week&unidade=${unidade}',
              ),
            ),
          ),
          Container(
            child: ChartCard(
              title: "Este mes",
              child: FutureHorizontalBarChartBuilder(
                url:
                    'http://noseri-api.herokuapp.com/api/flutter/kwh?aggregator=by_days_in_a_month&unidade=${unidade}',
              ),
            ),
          ),
          Container(
            child: ChartCard(
              title: "Pro carga neste mes",
              child: FutureVerticalBarChartBuilder(
                  url:
                      'http://noseri-api.herokuapp.com/api/flutter/kwh?aggregator=by_load_in_a_month'),
            ),
          ),
        ],
      ),
    );
  }
}

class FutureKwhTotalBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String url =
        'http://127.0.0.1:8000/api/flutter/kwh?unidade=kwh&aggregator=by_total_this_month';
    return FutureBuilder<double>(
      future: NetworkHelper().fetchKwhMonthTotalData(
          'https://noseri-api.herokuapp.com/api/flutter/kwh?unidade=kwh&aggregator=by_total_this_month'),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            return Text(snapshot.requireData.toString(),
                style: kLabelTextStyle);
          }
          return Text("---");
        } else if (snapshot.hasError) {
          return Text("Erro: dados nao encontrados.");
        } else {
          return Center(child: Text("---"));
        }
      },
    );
  }
}
