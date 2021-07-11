import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:noseri_app/custom_widgets/chart_card.dart';
import 'package:noseri_app/services/circular_chart_series.dart';
import 'package:noseri_app/services/kwh_series.dart';
import 'package:noseri_app/utilities/constants.dart';

class SummaryChartScreen extends StatefulWidget {
  final List<KwhSeries> weekData = [
    KwhSeries(
        day: "Dom",
        kwh: 2,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    KwhSeries(
        day: "Seg",
        kwh: 17,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    KwhSeries(
        day: "Ter",
        kwh: 13,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    KwhSeries(
        day: "Qua",
        kwh: 12,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    KwhSeries(
        day: "Qui",
        kwh: 20,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    KwhSeries(
        day: "Sex",
        kwh: 22,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    KwhSeries(
        day: "Sab",
        kwh: 8,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
  ];

  final List<KwhSeries> monthData = [
    KwhSeries(
        day: "01",
        kwh: 2,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    KwhSeries(
        day: "02",
        kwh: 17,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    KwhSeries(
        day: "03",
        kwh: 13,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    KwhSeries(
        day: "04",
        kwh: 12,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    KwhSeries(
        day: "05",
        kwh: 20,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    KwhSeries(
        day: "06",
        kwh: 22,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    KwhSeries(
        day: "07",
        kwh: 8,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    KwhSeries(
        day: "08",
        kwh: 15,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    KwhSeries(
        day: "09",
        kwh: 15,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    KwhSeries(
        day: "10",
        kwh: 19,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    KwhSeries(
        day: "11",
        kwh: 27,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    KwhSeries(
        day: "12",
        kwh: 17,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    KwhSeries(
        day: "13",
        kwh: 16,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    KwhSeries(
        day: "14",
        kwh: 18,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    KwhSeries(
        day: "15",
        kwh: 15,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    KwhSeries(
        day: "16",
        kwh: 12,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    KwhSeries(
        day: "17",
        kwh: 8,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    KwhSeries(
        day: "18",
        kwh: 10,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    KwhSeries(
        day: "19",
        kwh: 21,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    KwhSeries(
        day: "20",
        kwh: 13,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    KwhSeries(
        day: "21",
        kwh: 14,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    KwhSeries(
        day: "22",
        kwh: 9,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    KwhSeries(
        day: "23",
        kwh: 14,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    KwhSeries(
        day: "24",
        kwh: 17,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    KwhSeries(
        day: "25",
        kwh: 12,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    KwhSeries(
        day: "26",
        kwh: 11,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    KwhSeries(
        day: "27",
        kwh: 22,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
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
  ];

  final data = [
    GradesData('Ar-condicionado', 190),
    GradesData('Motor Induçao Trifasico', 230),
    GradesData('Iluminacao', 150),
    GradesData('Outros', 73),
  ];

  _getSeriesData() {
    List<charts.Series<GradesData, String>> series = [
      charts.Series(
          id: "Grades",
          data: data,
          labelAccessorFn: (GradesData row, _) =>
              '${row.gradeSymbol}: ${row.numberOfStudents}',
          domainFn: (GradesData grades, _) => grades.gradeSymbol,
          measureFn: (GradesData grades, _) => grades.numberOfStudents)
    ];
    return series;
  }

  @override
  _SummaryChartScreenState createState() => _SummaryChartScreenState();
}

class _SummaryChartScreenState extends State<SummaryChartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NOSERI - UFMT"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          SizedBox(height: kSpaceBetweenCols),
          info_summary_card(title: "Consumo este mes: ", value: "300"),
          SizedBox(height: kSpaceBetweenCols),
          info_summary_card(title: "Media diaria: ", value: "13"),
          SizedBox(height: kSpaceBetweenCols),
          ChartCard(title: "Hoje", data: widget.todayData),
          ChartCard(title: "Ultimos 7 dias", data: widget.weekData),
          ChartCard(title: "Ultimos 30 dias", data: widget.monthData),
          Container(
            height: 200.0,
            width: 200.0,
            child: new charts.PieChart(
              widget._getSeriesData(),
              animate: true,
              defaultRenderer: new charts.ArcRendererConfig(
                  arcWidth: 60,
                  arcRendererDecorators: [new charts.ArcLabelDecorator()]),
            ),
          ),
        ],
      ),
    );
  }
}

class info_summary_card extends StatelessWidget {
  final String title;
  final String value;
  const info_summary_card({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            Text(title, style: kLabelTextStyle),
            Text(value, style: kLabelTextStyle),
            Text(" kWh", style: kLabelTextStyle),
          ],
        ),
      ),
    );
  }
}
