/// ***
/// This class consists of the DateWidget that is used in the ListView.builder
///
/// Author: Vivek Kaushik <me@vivekkasuhik.com>
/// github: https://github.com/iamvivekkaushik/
/// ***


import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'gestures/tap.dart';

class DateWidget extends StatelessWidget {
  final double? width;
  final DateTime date;
  final TextStyle? monthTextStyle, dayTextStyle, dateTextStyle;
  final Color selectionColor;
  final DateSelectionCallback? onDateSelected;
  final String? locale;

  DateWidget({
    required this.date,
    required this.monthTextStyle,
    required this.dayTextStyle,
    required this.dateTextStyle,
    required this.selectionColor,
    this.width,
    this.onDateSelected,
    this.locale,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: width,
        margin: const EdgeInsets.all(3.0),

        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // Text(new DateFormat("MMM", locale).format(date).toUpperCase(), // Month
              //     style: monthTextStyle),

              Text(new DateFormat("E", locale).format(date).toUpperCase(), // WeekDay
                  style: dayTextStyle),
              SizedBox(height: 10,),
              Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  color: selectionColor,
                ),
                child: InkWell(
                  onTap: () {
                    onDateSelected?.call(this.date);

                  },

                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(date.day.toString(), // Date
                        style: dateTextStyle),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),

    );
  }
}
