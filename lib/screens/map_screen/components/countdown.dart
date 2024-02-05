import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/delivery_provider.dart';

class CountDown extends StatelessWidget {
  const CountDown({super.key, required this.minuteRemaining, required this.value});
  final int minuteRemaining;
  final double value;

  @override
  Widget build(BuildContext context) {
    if (value == 1) {
      return const Text('Go grab your coffee ☕️☕️!');
    }

    return Text(
      '${minuteRemaining * 10} minutes left',
      style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: Colors.black,
          ),
    );
  }
}
