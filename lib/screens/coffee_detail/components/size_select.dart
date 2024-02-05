import 'package:coffe_shop_ui_challenge/provider/order_provider.dart';
import 'package:coffe_shop_ui_challenge/screens/coffee_detail/components/custom_button.dart';
import 'package:coffe_shop_ui_challenge/widgets/small_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SizeSelect extends StatelessWidget {
  const SizeSelect({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<OrderProvider>(builder: (context, provider, child) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Size",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          smallPaddingVertical,
          SizedBox(
            height: 50.sp,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButton(
                  text: "S",
                ),
                CustomButton(
                  text: "M",
                ),
                CustomButton(
                  text: "L",
                ),
              ],
            ),
          )
        ],
      );
    });
  }
}
