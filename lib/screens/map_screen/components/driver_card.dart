import 'package:coffe_shop_ui_challenge/screens/acceuil/components/custom_app_bar.dart';
import 'package:coffe_shop_ui_challenge/utils/colors.dart';
import 'package:coffe_shop_ui_challenge/utils/constants.dart';
import 'package:coffe_shop_ui_challenge/utils/snackbar.dart';
import 'package:coffe_shop_ui_challenge/widgets/small_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DriverCard extends StatelessWidget {
  const DriverCard({
    super.key,
    required this.animationController,
  });

  final AnimationController animationController;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: animationController.value > 0.25,
      child: Row(
        children: [
          const ProfileImage(
            url: 'https://i.imgur.com/uTjWuc8.jpg',
          ),
          paddingHorizontal,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "HOUSSENBAY Ammar",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.black,
                    ),
              ),
              smallPaddingVertical,
              Text(
                "Computer science student",
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
          const Spacer(),
          GestureDetector(
            onTap: () => showSnackBarBuildLater(context),
            child: Container(
              height: 50.sp,
              width: 50.sp,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(kRadius),
                border: Border.all(
                  color: dividerColor,
                ),
              ),
              child: const Center(
                child: Icon(
                  Icons.call,
                  color: primaryColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
