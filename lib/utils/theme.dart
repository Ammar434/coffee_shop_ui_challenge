import 'package:coffe_shop_ui_challenge/datas/temporary_map_data.dart';
import 'package:coffe_shop_ui_challenge/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors.dart';
import 'constants.dart';

TextTheme textTheme() {
  return TextTheme(
    bodySmall: TextStyle(
      fontFamily: 'Sora',
      color: Colors.black,
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
    ),
    bodyLarge: TextStyle(
      fontFamily: 'Sora',
      color: Colors.black,
      fontSize: 16.sp,
      fontWeight: FontWeight.w600,
    ),
    bodyMedium: TextStyle(
      fontFamily: 'Sora',
      color: Colors.black87,
      fontSize: 14.sp,
    ),
    titleLarge: TextStyle(
      fontFamily: 'Sora',
      color: Colors.white,
      fontSize: 32.sp,
      fontWeight: FontWeight.w600,
    ),
    titleMedium: const TextStyle(
      fontFamily: 'Sora',
      color: Colors.white,
      fontSize: 14,
      fontWeight: FontWeight.w600,
    ),
    titleSmall: const TextStyle(
      fontFamily: 'Sora',
      color: Colors.black,
      fontSize: 12,
      fontWeight: FontWeight.bold,
    ),
    displayLarge: const TextStyle(
      fontFamily: 'Sora',
      color: Colors.black,
      fontSize: 32,
      fontWeight: FontWeight.bold,
    ),
    displayMedium: TextStyle(
      fontFamily: 'Sora',
      color: textColor2,
      fontSize: 14.sp,
      fontWeight: FontWeight.w600,
    ),
    displaySmall: TextStyle(
      fontFamily: 'Sora',
      color: textColor1,
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
    ),
  );
}

ThemeData appThemeData = ThemeData(
  appBarTheme: AppBarTheme(
    color: const Color(0xffF9F9F9),
    titleTextStyle: TextStyle(
      fontFamily: 'Sora',
      color: Colors.black,
      fontSize: 18.sp,
      fontWeight: FontWeight.w600,
    ),
  ),
  scaffoldBackgroundColor: scaffoldColor,
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color(0xffC67C4E),
  ),
  useMaterial3: true,
  textTheme: textTheme(),
);
