import 'package:coffe_shop_ui_challenge/utils/constants.dart';
import 'package:coffe_shop_ui_challenge/widgets/icon_svg.dart';
import 'package:coffe_shop_ui_challenge/widgets/small_padding.dart';
import 'package:flutter/material.dart';

class RatingBox extends StatelessWidget {
  final double rating;

  const RatingBox({
    super.key,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(kSmallPadding),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.2),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(kRadius),
          bottomRight: Radius.circular(kRadius),
        ),
      ),
      child: Row(
        children: [
          const IconSvg(
            svgPath: "assets/icons/star.svg",
            color: Colors.yellow,
          ),
          smallPaddingVertical,
          Text(
            rating.toString(),
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
