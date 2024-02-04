import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconSvg extends StatelessWidget {
  final String svgPath;
  final double size;
  final Color color;

  const IconSvg({
    Key? key,
    required this.svgPath,
    this.size = 10,
    this.color = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      svgPath,
      width: size,
      height: size,
      colorFilter: ColorFilter.mode(
        color,
        BlendMode.srcIn,
      ),
    );
  }
}
