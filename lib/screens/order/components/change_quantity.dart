import 'package:coffe_shop_ui_challenge/provider/order_provider.dart';
import 'package:coffe_shop_ui_challenge/utils/colors.dart';
import 'package:coffe_shop_ui_challenge/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChangeQuantity extends StatelessWidget {
  const ChangeQuantity({
    super.key,
    required this.isIncrease,
  });
  final bool isIncrease;
  @override
  Widget build(BuildContext context) {
    onTap() {
      if (isIncrease) {
        Provider.of<OrderProvider>(context, listen: false).increaseItemQuantity();
      } else {
        Provider.of<OrderProvider>(context, listen: false).decreaseItemQuantity();
      }
    }

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          kRadius,
        ),
        color: scaffoldColor,
        border: Border.all(
          color: Colors.grey.withOpacity(0.5),
        ),
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Icon(
          isIncrease ? Icons.add : Icons.remove,
          size: iconSize * 1.3,
        ),
      ),
    );
  }
}
