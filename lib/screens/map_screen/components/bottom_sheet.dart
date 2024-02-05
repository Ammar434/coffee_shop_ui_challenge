import 'package:coffe_shop_ui_challenge/screens/acceuil/components/custom_app_bar.dart';
import 'package:coffe_shop_ui_challenge/screens/map_screen/components/progressBar.dart';
import 'package:coffe_shop_ui_challenge/utils/colors.dart';
import 'package:coffe_shop_ui_challenge/utils/snackbar.dart';
import 'package:coffe_shop_ui_challenge/widgets/small_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/constants.dart';
import 'countdown.dart';
import 'indicator.dart';

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget({
    super.key,
    required this.elapsedTimeInSeconds,
    required this.animationController,
  });
  final int elapsedTimeInSeconds;
  final AnimationController animationController;

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.20,
      minChildSize: 0.10,
      maxChildSize: 0.4,
      builder: (BuildContext context, ScrollController scrollController) {
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          controller: scrollController,
          child: Container(
            constraints: BoxConstraints(
              minHeight: 0.3.sh,
              maxHeight: 0.4.sh,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(kRadius),
              ),
            ),
            child: Column(
              children: [
                const Indicator(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: kPadding),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CountDown(
                        minuteRemaining: Duration(seconds: elapsedTimeInSeconds).inMinutes,
                        value: animationController.value,
                      ),
                      smallPaddingVertical,
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Delivery to ',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            TextSpan(
                              text: 'Jl. Kpg Sutoyo',
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      paddingVertical,
                      ProgressBar(
                        animationController: animationController,
                      ),
                      paddingVertical,
                      DriverCard(animationController: animationController)
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

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
