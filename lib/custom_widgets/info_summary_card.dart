import 'package:flutter/material.dart';
import 'package:noseri_app/utilities/constants.dart';

class info_summary_card extends StatelessWidget {
  final String title;
  final String value;
  const info_summary_card({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            Text(title, style: kLabelTextStyle),
            Text(value, style: kLabelTextStyle),
            Text(" kWh", style: kLabelTextStyle),
          ],
        ),
      ),
    );
  }
}
