import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/constants.dart';
import 'icon_svg.dart';

class ActiveSvgIcon extends StatelessWidget {
  const ActiveSvgIcon({
    super.key,
    required this.iconSvg,
  });
  final IconSvg iconSvg;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.bottomCenter,
      children: [
        iconSvg,
        Positioned(
          // top: 0,
          // right: 0,
          bottom: -kSmallPadding,
          child: Container(
            width: kPadding,
            height: 3,
            decoration: const BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.all(Radius.circular(4)),
            ),
          ),
        ),
      ],
    );
  }
}
