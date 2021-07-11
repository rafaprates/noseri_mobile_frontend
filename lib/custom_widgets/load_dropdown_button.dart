import 'package:flutter/material.dart';
import 'package:noseri_app/services/networking.dart';
import 'package:noseri_app/utilities/constants.dart';

class loadDropdownButton extends StatefulWidget {
  NetworkHelper? networkHelper;
  loadDropdownButton(this.networkHelper);

  @override
  _loadDropdownButtonState createState() => _loadDropdownButtonState();
}

class _loadDropdownButtonState extends State<loadDropdownButton> {
  String dropdownValue = 'Geladeira';
  @override
  Widget build(BuildContext context) {
    widget.networkHelper?.load = dropdownValue;
    return DropdownButton<String>(
      isExpanded: true,
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: kDropdownButtonTextStyle,
      underline: Container(
        height: 1,
        color: Colors.black,
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: <String>[
        'Geladeira',
        'Ar-condicionado',
        'Refrigerador',
        'Computador'
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: kLoadDropdownTextStyle,
            textAlign: TextAlign.right,
          ),
        );
      }).toList(),
    );
  }
}
