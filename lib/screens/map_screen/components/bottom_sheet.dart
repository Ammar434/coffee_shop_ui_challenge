import 'package:coffe_shop_ui_challenge/screens/map_screen/components/driver_card.dart';
import 'package:coffe_shop_ui_challenge/screens/map_screen/components/progressBar.dart';
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
