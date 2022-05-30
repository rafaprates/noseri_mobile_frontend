import 'package:flutter/material.dart';
import 'package:noseri_app/utilities/constants.dart';

// Botao que oferece ao usuario uma lista de cargas para que este escolha
// uma entre as opcoes listadas.
class LoadsDropdownButton extends StatefulWidget {
  List<String> loadNames = [];
  //NetworkHelper? networkHelper;
  LoadsDropdownButton(this.loadNames);

  @override
  _LoadsDropdownButtonState createState() => _LoadsDropdownButtonState();
}

class _LoadsDropdownButtonState extends State<LoadsDropdownButton> {
  @override
  Widget build(BuildContext context) {
    //widget.networkHelper?.load = dropdownValue;
    String dropdownValue;
    dropdownValue = widget.loadNames.first;
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
      items: widget.loadNames.map<DropdownMenuItem<String>>((String value) {
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
