import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/colors.dart';
import '../../../utils/constants.dart';

class LineProgressBar extends StatelessWidget {
  const LineProgressBar({
    super.key,
    required this.progressBar,
  });

  final Animation<double> progressBar;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.sp),
        child: SizedBox(
          height: 4.sp,
          child: LinearProgressIndicator(
            backgroundColor: hintColor,
            value: progressBar.value,
            borderRadius: BorderRadius.circular(kRadius),
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
          ),
        ),
      ),
    );
  }
}
