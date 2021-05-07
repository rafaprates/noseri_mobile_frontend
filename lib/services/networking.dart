import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {

  String? load;
  String? from;
  String? until;
  String? url;

  NetworkHelper({this.load, this.from, this.until, this.url});

  String getFrom() {
    return '$from';
  }

  String getUntil() {
    return '$until';
  }

  Future getData() async {
    http.Response response = await http.get(
      Uri.parse(
          "https://noseri-app-api.herokuapp.com/api/Rafael/kwh?load=geladeira"),
    );

    if (response.statusCode == 200) {
      //String data = response.body;
      return response.body;
    } //TODO: implement the else clause
  }


}