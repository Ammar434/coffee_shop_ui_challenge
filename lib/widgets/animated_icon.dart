import 'package:coffe_shop_ui_challenge/utils/colors.dart';
import 'package:coffe_shop_ui_challenge/widgets/icon_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../datas/temporary_user_data.dart';

class AnimatedIconCustom extends StatefulWidget {
  const AnimatedIconCustom({super.key, required this.name});

  final String name;
  @override
  _AnimatedIconCustomState createState() => _AnimatedIconCustomState();
}

class _AnimatedIconCustomState extends State<AnimatedIconCustom> {
  late bool isTapped;
  @override
  void initState() {
    super.initState();
    isTapped = coffeeLike.contains(widget.name);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isTapped = !isTapped;
          if (isTapped) {
            coffeeLike.add(widget.name);
          } else {
            coffeeLike.remove(widget.name);
          }
        });
      },
      child: AnimatedCrossFade(
        firstCurve: Curves.easeInOut,
        secondCurve: Curves.easeIn,
        duration: const Duration(milliseconds: 300),
        firstChild: IconSvg(
          svgPath: "assets/icons/heart2.svg",
          size: 30.sp,
          color: hintColor,
        ),
        secondChild: IconSvg(
          svgPath: "assets/icons/heart2.svg",
          size: 30.sp,
          color: Colors.red,
        ),
        crossFadeState: isTapped ? CrossFadeState.showSecond : CrossFadeState.showFirst,
      ),
    );
  }
}
