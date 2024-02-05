import 'package:flutter/material.dart';

class CountDown extends StatelessWidget {
  const CountDown({super.key, required this.minuteRemaining, required this.value});
  final int minuteRemaining;
  final double value;

  @override
  Widget build(BuildContext context) {
    TextStyle? textStyle = Theme.of(context).textTheme.titleMedium?.copyWith(
          color: Colors.black,
        );

    if (value == 1) {
      return Text(
        'Go grab your coffee ☕️☕️!',
        style: textStyle,
      );
    }

    if (minuteRemaining == 0) {
      return Text(
        'Less than a minute left',
        style: textStyle,
      );
    }

    return Text(
      '${(minuteRemaining + 1)} minutes left',
      style: textStyle,
    );
  }
}
