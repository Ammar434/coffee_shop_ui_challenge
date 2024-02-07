import 'package:coffe_shop_ui_challenge/utils/constants.dart';
import 'package:coffe_shop_ui_challenge/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'provider/providers.dart';
import 'screens/body.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: ScreenUtilInit(
        designSize: const Size(393, 852),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) => MaterialApp(
          title: 'Coffee shop challenge',
          debugShowCheckedModeBanner: false,
          theme: appThemeData,
          home: const Body(),
        ),
      ),
    );
  }
}
