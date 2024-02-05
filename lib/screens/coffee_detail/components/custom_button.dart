import 'package:coffe_shop_ui_challenge/provider/order_provider.dart';
import 'package:coffe_shop_ui_challenge/utils/colors.dart';
import 'package:coffe_shop_ui_challenge/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    var buttonStateProvider = Provider.of<OrderProvider>(context, listen: false);

    return Expanded(
      child: GestureDetector(
        onTap: () => buttonStateProvider.selectButton(text),
        child: Consumer<OrderProvider>(builder: (context, buttonStateProvider, child) {
          bool isSelected = buttonStateProvider.selectedButton == text;

          return Container(
            margin: EdgeInsets.symmetric(horizontal: kSmallPadding),
            decoration: BoxDecoration(
              color: isSelected ? primaryColor.withOpacity(0.1) : Colors.white,
              borderRadius: kBorderRadius,
              border: Border.all(
                width: 1.sp,
                color: isSelected ? primaryColor : hintColor,
              ),
            ),
            child: Center(
              child: Text(
                text,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: isSelected ? primaryColor : hintColor,
                    ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
