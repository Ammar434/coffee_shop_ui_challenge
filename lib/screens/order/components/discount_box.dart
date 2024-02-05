import 'package:coffe_shop_ui_challenge/utils/colors.dart';
import 'package:coffe_shop_ui_challenge/utils/constants.dart';
import 'package:coffe_shop_ui_challenge/utils/snackbar.dart';
import 'package:coffe_shop_ui_challenge/widgets/icon_svg.dart';
import 'package:coffe_shop_ui_challenge/widgets/small_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DiscountBox extends StatelessWidget {
  const DiscountBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showSnackBarBuildLater(context),
      child: Container(
        height: 50.sp,
        margin: EdgeInsets.symmetric(
          horizontal: kPadding * 1,
          vertical: kPadding,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: kSmallPadding,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            kRadius,
          ),
          border: Border.all(
            color: Colors.grey,
          ),
        ),
        child: Row(
          children: [
            IconSvg(
              svgPath: 'assets/icons/discount.svg',
              size: iconSize * 1.5,
              color: primaryColor,
            ),
            smallPaddingHorizontal,
            Text(
              'One discount is applied',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              size: iconSize,
            ),
          ],
        ),
      ),
    );
  }
}
