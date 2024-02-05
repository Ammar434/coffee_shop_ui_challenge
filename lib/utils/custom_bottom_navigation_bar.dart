import 'package:coffe_shop_ui_challenge/provider/navigation_provider.dart';
import 'package:coffe_shop_ui_challenge/widgets/custom_bottom_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CustomBottomNavigationBarBody extends StatelessWidget {
  const CustomBottomNavigationBarBody({super.key});
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(24.sp),
        topRight: Radius.circular(24.sp),
      ),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        elevation: 2,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: Provider.of<NavigationProvider>(context).currentIndex,
        onTap: (index) {
          Provider.of<NavigationProvider>(context, listen: false).currentIndex = index;
        },
        items: <BottomNavigationBarItem>[
          CustomBottomNavigationBarItem(svgPath: 'assets/icons/home.svg'),
          CustomBottomNavigationBarItem(svgPath: 'assets/icons/heart.svg'),
          CustomBottomNavigationBarItem(svgPath: 'assets/icons/bag.svg'),
          CustomBottomNavigationBarItem(svgPath: 'assets/icons/notification.svg'),
        ],
      ),
    );
  }
}
