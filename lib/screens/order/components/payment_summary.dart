import 'package:coffe_shop_ui_challenge/provider/order_provider.dart';
import 'package:coffe_shop_ui_challenge/utils/constants.dart';
import 'package:coffe_shop_ui_challenge/widgets/small_padding.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PaymentSummary extends StatelessWidget {
  const PaymentSummary({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<OrderProvider>(
      builder: (BuildContext context, OrderProvider orderProvider, Widget? child) {
        return Padding(
          padding: EdgeInsets.all(kPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Payment summary",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              paddingVertical,
              Row(
                children: [
                  Text(
                    "Price",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const Spacer(),
                  Text(
                    "\$ ${orderProvider.bagPrice.toStringAsFixed(2)}",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
              smallPaddingVertical,
              Row(
                children: [
                  Text(
                    "Delivery fee",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const Spacer(),
                  Text(
                    "\$2.00",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(decoration: TextDecoration.lineThrough, fontWeight: FontWeight.w400),
                  ),
                  smallPaddingHorizontal,
                  Text(
                    "\$1.00",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
              const Divider(),
              Row(
                children: [
                  Text(
                    "Total payment",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const Spacer(),
                  Text(
                    "\$ ${orderProvider.total.toStringAsFixed(2)}",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
