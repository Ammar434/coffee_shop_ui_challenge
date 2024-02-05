import 'package:coffe_shop_ui_challenge/widgets/expandable_text.dart';
import 'package:coffe_shop_ui_challenge/widgets/small_padding.dart';
import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  const Description({
    super.key,
    required this.description,
  });

  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Description",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        smallPaddingVertical,
        ExpandableText(
          description,
          style: Theme.of(context).textTheme.bodyMedium,
        )
      ],
    );
  }
}
