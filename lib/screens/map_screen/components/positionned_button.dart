import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../datas/temporary_map_data.dart';
import '../../../utils/colors.dart';
import '../../../utils/constants.dart';

class PositionedButton extends StatelessWidget {
  const PositionedButton({
    super.key,
    required this.isBack,
    required this.mapController,
  });
  final bool isBack;
  final MapController mapController;

  @override
  Widget build(BuildContext context) {
    onTap() {
      if (isBack) {
        Navigator.pop(context);
      } else {
        mapController.move(home, 17);
      }
    }

    return Positioned(
      top: kPadding * 3,
      left: isBack ? kPadding : null,
      right: isBack ? null : kPadding,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 40.sp,
          width: 40.sp,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                spreadRadius: 1,
              ),
            ],
            color: scaffoldColor,
            borderRadius: BorderRadius.circular(kRadius),
          ),
          child: Center(
            child: Icon(
              isBack ? Icons.chevron_left : Icons.my_location,
              size: iconSize,
            ),
          ),
        ),
      ),
    );
  }
}
