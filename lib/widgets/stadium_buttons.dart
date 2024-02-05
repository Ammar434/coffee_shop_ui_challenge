//TODO : Change this to dynamic value

import 'package:coffe_shop_ui_challenge/utils/colors.dart';
import 'package:coffe_shop_ui_challenge/utils/constants.dart';
import 'package:coffe_shop_ui_challenge/widgets/icon_svg.dart';
import 'package:coffe_shop_ui_challenge/widgets/small_padding.dart';
import 'package:flutter/material.dart';

class StadiumButton extends StatelessWidget {
  const StadiumButton({
    super.key,
    required this.onTap,
    required this.title,
    required this.svgPath,
  });
  final Function() onTap;
  final String title;
  final String svgPath;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5,
        ),
        decoration: BoxDecoration(
          borderRadius: kBorderRadius,
          color: scaffoldColor,
          border: Border.all(
            color: Colors.grey.withOpacity(0.5),
          ),
        ),
        child: Row(
          children: [
            IconSvg(
              svgPath: svgPath,
              size: iconSize,
            ),
            smallPaddingHorizontal,
            Text(
              title,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
