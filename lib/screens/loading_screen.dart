import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:noseri_app/services/kwh_series.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:http/http.dart' as http;
import 'package:noseri_app/screens/home_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';



class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  var kwhData;
  var responseData;

  void getData() async {
    var kwh;
    var timestamp;
    List<KwhSeries> kwhData = [];

    http.Response response = await http.get(
      Uri.parse(
          "https://noseri-app-api.herokuapp.com/api/Rafael/kwh?load=geladeira"),
    );

    print(response.body);
    responseData = response.body;

    if (response.statusCode == 200) {
      for (var i = 0; i < 6; i++) {
        kwh = jsonDecode(response.body)[i]["kwh"];
        timestamp = jsonDecode(response.body)[i]["timestamp"];
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
  } //TODO: implement the else clause

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
