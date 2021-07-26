import 'package:flutter/material.dart';
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

  //Template Data
  List<BarChartSeries> chartData = [
    BarChartSeries(date: "", kwh: 0.0),
    BarChartSeries(date: "", kwh: 0.0),
  ];

  String url = "http://noseri-api.herokuapp.com/api/flutter/kwh";

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
                // Updates the Url to fetch the right data.
                String? load = networkHelper!.load;

                String formatDate(String date) {
                  List<String> splitDate = date.split("-");
                  String day = splitDate[0];
                  String month = splitDate[1];
                  String year = splitDate[2];

                  if (day.length < 2) {
                    day = "0" + day;
                  }

                  if (month.length < 2) {
                    month = "0" + month;
                  }

                  return "${year}-${month}-${day}";
                }

                String from = formatDate(networkHelper!.from!.split(" ")[0]);
                String until = formatDate(networkHelper!.until!.split(" ")[0]);

                url =
                    "http://noseri-api.herokuapp.com/api/flutter/kwh?load=${load}&ti=${from}&tf=${until}&aggregator=by_day_month_year&unidade=kwh";
                setState(() {});
              },
            ),
            SizedBox(height: kSpaceBetweenCols),
            Container(
              child: ChartCard(
                title: "Titulo",
                child: FutureBarChartBuilder(url: url),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
