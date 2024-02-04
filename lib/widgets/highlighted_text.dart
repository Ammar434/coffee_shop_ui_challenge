import '../utils/constants.dart';
import 'package:flutter/material.dart';

class HighlightedText extends StatelessWidget {
  const HighlightedText({
    super.key,
    required this.text,
    required this.textStyle,
    this.padding = 15,
  });
  final String text;
  final TextStyle textStyle;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: FittedBox(
        // fit: BoxFit.scaleDown,
        child: Stack(
          children: [
            Positioned(
              top: padding,
              left: kSmallPadding,
              right: 0,
              child: Container(
                color: Colors.black, // Highlight color
                height: textStyle.fontSize! * 0.9,
              ),
            ),
            // Actual text
            Text(
              text,
              style: textStyle,
            ),
          ],
        ),
      ),
    );
  }
}
