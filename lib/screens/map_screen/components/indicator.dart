import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/constants.dart';

class Indicator extends StatelessWidget {
  const Indicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 5.sp,
        width: 50.sp,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(kRadius),
        ),
      ),
    );
  }
}
