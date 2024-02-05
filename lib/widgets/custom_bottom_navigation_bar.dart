import 'package:coffe_shop_ui_challenge/provider/navigation_provider.dart';
import 'package:coffe_shop_ui_challenge/provider/order_provider.dart';
import 'package:coffe_shop_ui_challenge/utils/colors.dart';
import 'package:coffe_shop_ui_challenge/utils/constants.dart';
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

class BottomNavigationBarDetailScreeen extends StatelessWidget {
  const BottomNavigationBarDetailScreeen({
    super.key,
    required this.onTap,
  });
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.symmetric(vertical: kPadding, horizontal: kPadding * 1.5),
      padding: EdgeInsets.only(
        bottom: kPadding * 1,
        left: kPadding * 1.5,
        right: kPadding * 1.5,
        top: kPadding * 1.2,
      ),
      height: 100.sp,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.sp),
          topRight: Radius.circular(24.sp),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 2,
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Price',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: hintColor,
                      ),
                  textAlign: TextAlign.start,
                ),
                Consumer<OrderProvider>(
                  builder: (context, provider, child) {
                    return Text(
                      "\$${provider.price}",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: primaryColor,
                          ),
                    );
                  },
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: GestureDetector(
              onTap: onTap,
              child: Container(
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: kBorderRadius,
                ),
                child: Center(
                  child: Text(
                    "Add to cart",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Colors.white,
                        ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
