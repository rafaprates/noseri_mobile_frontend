import 'package:flutter/material.dart';
import 'package:noseri_app/custom_widgets/charts/chartCard.dart';
import 'package:noseri_app/custom_widgets/charts/futureVerticalBarChartBuilder.dart';
import 'package:noseri_app/custom_widgets/dateRangePicker.dart';
import 'package:noseri_app/custom_widgets/header.dart';
import 'package:noseri_app/custom_widgets/loadsDropdownButton.dart';
import 'package:noseri_app/models/Load.dart';
import 'package:noseri_app/services/networking.dart';
import 'package:noseri_app/utilities/constants.dart';

class CustomChartScreen extends StatefulWidget {
  @override
  _CustomChartScreenState createState() => _CustomChartScreenState();
}

class _CustomChartScreenState extends State<CustomChartScreen> {
  NetworkHelper? networkHelper = NetworkHelper();
  String url = "http://noseri-api.herokuapp.com/api/flutter/kwh";

  // Resgata, no servidor, a lista de Loads (cargas) para o usuario e retorna
  // como uma lista de Strings, para ser mostrada no botao dropdrown.
  Future<List<String>> loadNames() async {
    List<String> loadNames = [];
    loadNames.clear();
    List<Load> loadList = await networkHelper!.fetchLoadList();

    for (var load in loadList) {
      if (load.isLoadTracked()) {
        String loadName = '';
        loadName = load.loadName.toString();
        loadNames.add(loadName);
      }
    }
    return loadNames;
  }

  @override
  Widget build(BuildContext context) {
    return Header(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text('Carga: ', style: kLabelTextStyle),
              Expanded(
                child: FutureBuilder<List<String>>(
                  future: loadNames(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasData) {
                        return LoadsDropdownButton(snapshot.requireData);
                      }
                      return Text("snapshot.data: ${snapshot.data}");
                    } else if (snapshot.hasError) {
                      return Text("Erro");
                    } else {
                      return Text("--");
                    }
                  },
                ),
              ),
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
              child: FutureVerticalBarChartBuilder(url: url),
            ),
          ),
        ],
      ),
    );
  }
}
