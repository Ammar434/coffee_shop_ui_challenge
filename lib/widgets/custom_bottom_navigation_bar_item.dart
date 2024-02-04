import '../utils/colors.dart';
import 'icon_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'active_svg_icon.dart';

class CustomBottomNavigationBarItem extends BottomNavigationBarItem {
  CustomBottomNavigationBarItem({
    required String svgPath,
  }) : super(
          icon: IconSvg(
            svgPath: svgPath,
            size: 24.sp,
            color: hintColor,
          ),
          activeIcon: ActiveSvgIcon(
            iconSvg: IconSvg(
              svgPath: svgPath,
              size: 24.sp,
              color: primaryColor,
            ),
          ),
          label: '',
        );
}
