import 'package:coffe_shop_ui_challenge/utils/colors.dart';
import 'package:coffe_shop_ui_challenge/utils/constants.dart';
import 'package:coffe_shop_ui_challenge/widgets/icon_svg.dart';
import 'package:coffe_shop_ui_challenge/widgets/small_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'line_progress_bar.dart';

// Constants

class ProgressBar extends StatelessWidget {
  const ProgressBar({super.key, required this.animationController});
  final AnimationController animationController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedBar(controller: animationController),
        smallPaddingVertical,
        AnimatedContainerSwitcher(controller: animationController),
        smallPaddingVertical,
      ],
    );
  }
}

class AnimatedBar extends StatelessWidget {
  final AnimationController controller;

  const AnimatedBar({Key? key, required this.controller}) : super(key: key);

  Animation<double> createProgressBarAnimation(double begin, double end) {
    return Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(begin, end, curve: Curves.linear),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final progressBarAnimations = [
      createProgressBarAnimation(0.0, 0.25),
      createProgressBarAnimation(0.25, 0.5),
      createProgressBarAnimation(0.5, 0.75),
      createProgressBarAnimation(0.75, 1.0),
    ];

    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget? child) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: progressBarAnimations
                .map((progressBar) => LineProgressBar(
                      progressBar: progressBar,
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}

class AnimatedContainerSwitcher extends StatefulWidget {
  const AnimatedContainerSwitcher({Key? key, required this.controller}) : super(key: key);
  final AnimationController controller;

  @override
  _AnimatedContainerSwitcherState createState() => _AnimatedContainerSwitcherState();
}

class _AnimatedContainerSwitcherState extends State<AnimatedContainerSwitcher> {
  String getTitle() {
    if (widget.controller.value <= 0.25) {
      return "Searching";
    } else if (widget.controller.value <= 0.5) {
      return "Ammar is your driver"; // Corresponds to progressBarTwo
    } else if (widget.controller.value <= 0.75) {
      return "Delivered your order"; // Corresponds to progressBarThree
    } else {
      return "Please meet Ammar outside"; // Corresponds to progressBarFour
    }
  }

  String getSubtitle() {
    if (widget.controller.value <= 0.25) {
      return "We are searching for a driver";
    } else if (widget.controller.value <= 0.5) {
      return "Ammar is on his way to the coffee shop";
    } else if (widget.controller.value <= 0.75) {
      return "Ammar is delivering your order";
    } else {
      return "Ammar is waiting outside";
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.controller,
      builder: (BuildContext context, Widget? child) {
        final String title = getTitle();
        final String subtitle = getSubtitle();
        return Center(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return FadeTransition(opacity: animation, child: child);
            },
            child: OrderStatus(
              title: title,
              subtitle: subtitle,
            ),
          ),
        );
      },
    );
  }
}

class OrderStatus extends StatelessWidget {
  const OrderStatus({
    super.key,
    required this.title,
    required this.subtitle,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: ValueKey<String>(title),
      width: double.infinity,
      height: 80.sp,
      margin: EdgeInsets.all(kSmallPadding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kRadius),
        border: Border.all(
          color: dividerColor,
        ),
      ),
      child: Row(
        children: [
          Container(
            height: 80.sp,
            width: 80.sp,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(kRadius),
              border: Border.all(
                color: dividerColor,
              ),
            ),
            child: IconSvg(
              svgPath: "assets/icons/delivery.svg",
              color: primaryColor,
              size: 40.sp,
            ),
          ),
          paddingHorizontal,
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.black),
                ),
                smallPaddingVertical,
                Text(
                  subtitle,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.black),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
