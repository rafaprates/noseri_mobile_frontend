import 'package:flutter/material.dart';
import 'package:noseri_app/services/networking.dart';
import 'package:noseri_app/utilities/constants.dart';

class DateRangePicker extends StatefulWidget {
  NetworkHelper? networkHelper;
  DateRangePicker(this.networkHelper);

  @override
  _DateRangePickerState createState() => _DateRangePickerState();
}

class _DateRangePickerState extends State<DateRangePicker> {
  DateTimeRange? dateRange;

  Future pickDateRange(BuildContext context) async {
    final initialDateRange = DateTimeRange(
      start: DateTime.now(),
      end: DateTime.now().add(Duration(hours: 24 * 3)),
    );

    final newDateRange = await showDateRangePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 1),
      initialDateRange: dateRange ?? initialDateRange,
    );

    if (newDateRange == null) return;

    setState(() => dateRange = newDateRange);
  }

  String getFrom() {
    if (dateRange == null) {
      return 'De';
    } else {
      widget.networkHelper?.from =
          '${dateRange?.start?.day}-${dateRange?.start?.month}-${dateRange?.start?.year}';
      print(dateRange?.start);
      return '${dateRange?.start?.day}-${dateRange?.start?.month}-${dateRange?.start?.year}';
    }
  }

  String getUntil() {
    if (dateRange == null) {
      return 'Até';
    } else {
      widget.networkHelper?.until =
          '${dateRange?.end?.day}-${dateRange?.end?.month}-${dateRange?.end?.year}';
      return '${dateRange?.end?.day}-${dateRange?.end?.month}-${dateRange?.end?.year}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'De:',
          style: kHeaderSmallTextStyle,
        ),
        SizedBox(width: 10.0),
        Expanded(
          child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.white)),
            child: Text(getFrom(), style: kElevatedButtonTextStyle),
            onPressed: () => pickDateRange(context),
          ),
        ),
        SizedBox(width: 15.0),
        Text(
          'Até:',
          style: kHeaderSmallTextStyle,
        ),
        SizedBox(width: 10.0),
        Expanded(
          child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.white)),
            child: Text(getUntil(), style: kElevatedButtonTextStyle),
            onPressed: () => pickDateRange(context),
          ),
        ),
      ],
    );
  }
}
