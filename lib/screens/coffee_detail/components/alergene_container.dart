import 'package:coffe_shop_ui_challenge/models/ingredient.dart';
import 'package:coffe_shop_ui_challenge/utils/colors.dart';
import 'package:coffe_shop_ui_challenge/utils/constants.dart';
import 'package:coffe_shop_ui_challenge/widgets/icon_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllergeneContainer extends StatelessWidget {
  const AllergeneContainer({
    super.key,
    required this.ingredient,
  });
  final Ingredient ingredient;
  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: ingredient.name,
      triggerMode: TooltipTriggerMode.tap,
      child: Container(
        width: 44.sp,
        height: 44.sp,
        margin: EdgeInsets.symmetric(horizontal: kSmallPadding * 0.5),
        decoration: BoxDecoration(
          color: hintColor.withOpacity(0.1),
          borderRadius: kBorderRadius,
        ),
        child: Center(
          child: IconSvg(
            svgPath: ingredient.svgPath,
            size: 24.sp,
            color: primaryColor,
          ),
        ),
      ),
    );
  }
}
