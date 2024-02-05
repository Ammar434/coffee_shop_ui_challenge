import 'package:coffe_shop_ui_challenge/provider/order_provider.dart';
import 'package:coffe_shop_ui_challenge/screens/order/components/change_quantity.dart';
import 'package:coffe_shop_ui_challenge/utils/colors.dart';
import 'package:coffe_shop_ui_challenge/utils/constants.dart';
import 'package:coffe_shop_ui_challenge/widgets/small_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CardCoffee extends StatelessWidget {
  const CardCoffee({
    super.key,
    required this.imageUrl,
    required this.name,
  });

  final String imageUrl;
  final String name;

  @override
  Widget build(BuildContext context) {
    List<String> nameParts = name.split(' ');
    String name1 = nameParts[0];
    String name2 = nameParts.sublist(1).join(' ');

    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: kBorderRadius,
            image: DecorationImage(
              image: NetworkImage(imageUrl),
              fit: BoxFit.cover,
            ),
          ),
          height: 50,
          width: 50,
        ),
        paddingHorizontal,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name1,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
            ),
            Text(
              name2,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: hintColor),
            ),
          ],
        ),
        const Spacer(),
        Row(
          children: [
            const ChangeQuantity(
              isIncrease: false,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: kSmallPadding,
              ),
              child: SizedBox(
                width: 25.sp,
                child: Text(
                  Provider.of<OrderProvider>(context).itemQuantity.toString(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const ChangeQuantity(
              isIncrease: true,
            ),
          ],
        )
      ],
    );
  }
}
