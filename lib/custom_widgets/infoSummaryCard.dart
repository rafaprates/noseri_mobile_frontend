import 'package:flutter/material.dart';
import 'package:noseri_app/utilities/constants.dart';

// Cartoes que mostram informacoes a respeito do consumo e da unidade
class InfoSummaryCard extends StatelessWidget {
  final String title;
  final String value;
  final String unidade;
  const InfoSummaryCard(
      {required this.title, required this.value, required this.unidade});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Text(title, style: kLabelTextStyle),
          Expanded(child: Container()),
          Text(value, style: kLabelTextStyle),
          Text(unidade, style: kLabelTextStyle),
        ],
      ),
    );
  }
}
