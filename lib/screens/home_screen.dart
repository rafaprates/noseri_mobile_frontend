import 'package:flutter/material.dart';
import 'package:noseri_app/custom_widgets/load_dropdown_button.dart';
import 'package:noseri_app/utilities/constants.dart';
import 'package:noseri_app/custom_widgets/date_range_picker.dart';
import 'package:noseri_app/services/networking.dart';
import 'package:noseri_app/custom_widgets/chart.dart';
import 'package:charts_flutter/flutter.dart';

class HomeScreen extends StatelessWidget {
  NetworkHelper? networkHelper = NetworkHelper();
  String? de;
  String? para;
  String? load;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Image.network(
            'https://www.ufmt.br/assets/images/icons/Logos/logo_vertical.png',
          ),
        ),
        title: Text('NOSERI - UFMT'),
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
            SizedBox(height: 15.0),
            Text('Intervalo de Tempo:', style: kLabelTextStyle),
            SizedBox(height: 5.0),
            DateRangePicker(networkHelper),
            SizedBox(height: 15.0),
            ElevatedButton(onPressed: () {}, child: Text('Atualizar gráfico')),
            SizedBox(height: 15.0),
            Expanded(child: Container(color: Colors.white)),
            //SimpleBarChart(animate: false),
          ],
        ),
      ),
    );
  }
}
