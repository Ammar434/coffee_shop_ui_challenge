import '../../../../../utils/colors.dart';
import 'package:coffe_shop_ui_challenge/utils/constants.dart';
import 'package:coffe_shop_ui_challenge/widgets/icon_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double height = 60.sp;
    return Container(
      height: height,
      padding: EdgeInsets.only(left: kSmallPadding, right: 4.sp),
      decoration: BoxDecoration(
        color: searchBarColor,
        borderRadius: BorderRadiusDirectional.all(Radius.circular(kRadius)),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: IconSvg(
              svgPath: "assets/icons/search-normal-1.svg",
              color: Colors.white,
              size: 20.sp,
            ),
          ),
          Expanded(
            child: TextField(
              cursorColor: Colors.white,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Colors.white,
                  ),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Search coffee',
                hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Colors.white,
                    ),
              ),
            ),
          ),
          Container(
            height: height,
            width: height,
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(kRadius),
            ),
            child: Align(
              alignment: Alignment.center,
              child: IconSvg(
                svgPath: "assets/icons/setting-4.svg",
                color: Colors.white,
                size: height * 0.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
