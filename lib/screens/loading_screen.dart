import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:noseri_app/services/kwh_series.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:noseri_app/screens/home_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:noseri_app/services/networking.dart';



class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  NetworkHelper networkHelper = NetworkHelper();

  var kwhData;
  var responseData;

  void getData() async {
    var kwh;
    var timestamp;
    List<KwhSeries> kwhData = [];

    responseData = await networkHelper.getData();

      // TODO: encontrar um critério de parada do loop em função da responseData
      for (var i = 0; i < 6; i++) {

        kwh = jsonDecode(responseData)[i]["kwh"];
        timestamp = jsonDecode(responseData)[i]["timestamp"];
        timestamp = timestamp.substring(5, 10);

        KwhSeries kwhSeries = KwhSeries(
          day: timestamp,
          kwh: kwh,
          color: charts.ColorUtil.fromDartColor(Colors.blue),
        );
        kwhData.add(kwhSeries);
      }

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(kwhData),
        ),
      );
    }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      body: Center(
        child: SpinKitWave(
          color: Colors.black,
          size: 50.0,
        ),
      ),
    );
  }
}
