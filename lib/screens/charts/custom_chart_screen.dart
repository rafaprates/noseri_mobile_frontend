import 'package:flutter/material.dart';
import 'package:noseri_app/custom_widgets/date_range_picker.dart';
import 'package:noseri_app/custom_widgets/load_dropdown_button.dart';
import 'package:noseri_app/services/networking.dart';
import 'package:noseri_app/utilities/constants.dart';

class CustomChartScreen extends StatefulWidget {
  //HomeScreen(this.kwhData);
  //final kwhData;

  @override
  _CustomChartScreenState createState() => _CustomChartScreenState();
}

class _CustomChartScreenState extends State<CustomChartScreen> {
  NetworkHelper? networkHelper = NetworkHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text("NOSERI - UFMT"),
      ),
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
                onPressed: () {
                  /*
                  print('.../api/Usuario/kwh?load=${networkHelper?.load}&tsStart=${networkHelper?.from}&tsEnd=${networkHelper?.until}');
                  print('data: $data');
                  print('kwhData: ${widget.kwhData}');
                  */
                  Navigator.pop(context);
                },
                child: Text('Atualizar gráfico')),
            SizedBox(height: kSpaceBetweenCols),
            //Expanded(child:Container(decoration: BoxDecoration(border: Border.all()))),
            //Expanded(
            //child: KwhChart(data: widget.kwhData),
            //),
          ],
        ),
      ),
    );
  }
}
