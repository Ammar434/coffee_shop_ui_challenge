import 'package:coffe_shop_ui_challenge/datas/temporary_data.dart';
import 'package:coffe_shop_ui_challenge/utils/colors.dart';
import 'package:coffe_shop_ui_challenge/utils/constants.dart';
import 'package:flutter/material.dart';

class TabBarAcceuilScreen extends StatelessWidget {
  const TabBarAcceuilScreen({
    super.key,
    required this.onTap,
  });
  final Function(int) onTap;
  @override
  Widget build(BuildContext context) {
    return TabBar(
      isScrollable: true,
      padding: EdgeInsets.zero,
      tabAlignment: TabAlignment.start,
      labelColor: Colors.white,
      unselectedLabelColor: Colors.black,
      indicatorSize: TabBarIndicatorSize.tab,
      dividerHeight: 0,
      indicatorPadding: EdgeInsets.all(kSmallPadding),
      indicator: BoxDecoration(
        borderRadius: kBorderRadius,
        color: primaryColor,
      ),
      splashBorderRadius: kBorderRadius,
      splashFactory: NoSplash.splashFactory,
      onTap: onTap,
      labelPadding: EdgeInsets.symmetric(horizontal: kPadding),
      labelStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w600),
      unselectedLabelStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w400),
      tabs: List.generate(
        coffeeCategoryNames.length,
        (index) => Tab(
          text: coffeeCategoryNames.values.toList()[index],
        ),
      ),
    );
  }
}
