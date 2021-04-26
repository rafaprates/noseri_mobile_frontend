import 'package:flutter/material.dart';
import 'package:noseri_app/services/networking.dart';

class Teste extends StatefulWidget {

  NetworkHelper? networkHelper;
  Teste(this.networkHelper);

  @override
  _TesteState createState() => _TesteState();
}

class _TesteState extends State<Teste> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: () {
      print(widget.networkHelper?.load);
      print('until:');
      print(widget.networkHelper?.until);
      print('from:');
      print(widget.networkHelper?.from);
    }, child: Text('print(net'));
  }
}
