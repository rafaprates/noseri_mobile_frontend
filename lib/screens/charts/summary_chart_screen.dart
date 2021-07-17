import 'package:flutter/material.dart';
import 'package:noseri_app/custom_widgets/chart_card.dart';
import 'package:noseri_app/custom_widgets/charts/bar_chart.dart';
import 'package:noseri_app/custom_widgets/info_summary_card.dart';
import 'package:noseri_app/models/bar_chart_series.dart';
import 'package:noseri_app/models/circular_chart_series.dart';
import 'package:noseri_app/utilities/constants.dart';

class SummaryChartScreen extends StatefulWidget {
  final List<BarChartSeries> weekData = [
    BarChartSeries(
      day: "Dom",
      kwh: 2,
    ),
    //barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    BarChartSeries(
      day: "Seg",
      kwh: 17,
    ),
    //barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    BarChartSeries(
      day: "Ter",
      kwh: 13,
    ),
    //barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    BarChartSeries(
      day: "Qua",
      kwh: 12,
    ),
    //barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    BarChartSeries(
      day: "Qui",
      kwh: 20,
    ),
    //barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    BarChartSeries(
      day: "Sex",
      kwh: 22,
    ),
    //barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    BarChartSeries(
      day: "Sab",
      kwh: 8,
    ),
    //barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
  ];

/*  final List<KwhSeries> monthData = [
    KwhSeries(
        day: "01",
        kwh: 2,
    KwhSeries(
        day: "02",
        kwh: 17,
    KwhSeries(
        day: "03",
        kwh: 13,
    KwhSeries(
        day: "04",
        kwh: 12,
    KwhSeries(
        day: "05",
        kwh: 20,
    KwhSeries(
        day: "06",
        kwh: 22,
    KwhSeries(
        day: "07",
        kwh: 8,
    KwhSeries(
        day: "08",
        kwh: 15,
    KwhSeries(
        day: "09",
        kwh: 15,
    KwhSeries(
        day: "10",
        kwh: 19,
    KwhSeries(
        day: "11",
        kwh: 27,
    KwhSeries(
        day: "12",
        kwh: 17,
    KwhSeries(
        day: "13",
        kwh: 16,
    KwhSeries(
        day: "14",
        kwh: 18,
    KwhSeries(
        day: "15",
        kwh: 15,
    KwhSeries(
        day: "16",
        kwh: 12,
    KwhSeries(
        day: "17",
        kwh: 8,
    KwhSeries(
        day: "18",
        kwh: 10,
    KwhSeries(
        day: "19",
        kwh: 21,
    KwhSeries(
        day: "20",
        kwh: 13,
    KwhSeries(
        day: "21",
        kwh: 14,
    KwhSeries(
        day: "22",
        kwh: 9,
    KwhSeries(
        day: "23",
        kwh: 14,
    KwhSeries(
        day: "24",
        kwh: 17,
    KwhSeries(
        day: "25",
        kwh: 12,
    KwhSeries(
        day: "26",
        kwh: 11,
    KwhSeries(
        day: "27",
        kwh: 22,
    KwhSeries(
        day: "28",
        kwh: 12,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    KwhSeries(
        day: "29",
        kwh: 17,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    KwhSeries(
        day: "30",
        kwh: 18,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    KwhSeries(
        day: "31",
        kwh: 19,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
  ];

  final List<KwhSeries> todayData = [
    KwhSeries(
        day: "00",
        kwh: 2,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    KwhSeries(
        day: "01",
        kwh: 3,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    KwhSeries(
        day: "02",
        kwh: 2,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    KwhSeries(
        day: "03",
        kwh: 4,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    KwhSeries(
        day: "04",
        kwh: 1,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    KwhSeries(
        day: "05",
        kwh: 2,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    KwhSeries(
        day: "06",
        kwh: 3,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    KwhSeries(
        day: "07",
        kwh: 1,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    KwhSeries(
        day: "08",
        kwh: 2,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    KwhSeries(
        day: "09",
        kwh: 5,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    KwhSeries(
        day: "10",
        kwh: 2,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    KwhSeries(
        day: "11",
        kwh: 3,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    KwhSeries(
        day: "12",
        kwh: 1,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    KwhSeries(
        day: "13",
        kwh: 3,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    KwhSeries(
        day: "14",
        kwh: 1,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    KwhSeries(
        day: "15",
        kwh: 2,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    KwhSeries(
        day: "16",
        kwh: 5,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    KwhSeries(
        day: "17",
        kwh: 1,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    KwhSeries(
        day: "18",
        kwh: 1,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    KwhSeries(
        day: "19",
        kwh: 2,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    KwhSeries(
        day: "20",
        kwh: 3,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    KwhSeries(
        day: "21",
        kwh: 4,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    KwhSeries(
        day: "22",
        kwh: 1,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    KwhSeries(
        day: "23",
        kwh: 3,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
  ];*/

  final data = [
    kWhPerLoadData('Ar-condicionado', 190),
    kWhPerLoadData('MIT', 230),
    kWhPerLoadData('Iluminacao', 150),
    kWhPerLoadData('Outros', 73),
  ];

  @override
  _SummaryChartScreenState createState() => _SummaryChartScreenState();
}

class _SummaryChartScreenState extends State<SummaryChartScreen> {
  @override
  Widget build(BuildContext context) {
    print("########################################################");
    print(widget.weekData);
    print(widget.weekData.runtimeType);
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
          /*ChartCard(
            title: "Hoje",
            child: BarChart(data: widget.todayData),
          ),*/
          ChartCard(
              title: "Ultimos 7 dias", child: BarChart(data: widget.weekData)),
          /*ChartCard(
              title: "Ultimos 30 dias",
              child: BarChart(data: widget.monthData)),
          ChartCard(
            title: "Consumo por carga (ultimos 30 dias)",
            child: CircularChart(data: widget.data),
          ),*/
        ],
      ),
    );
  }
}
