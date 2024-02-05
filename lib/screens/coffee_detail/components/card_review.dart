import 'package:coffe_shop_ui_challenge/models/coffee.dart';
import 'package:coffe_shop_ui_challenge/screens/coffee_detail/components/alergene_container.dart';
import 'package:coffe_shop_ui_challenge/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardReview extends StatelessWidget {
  const CardReview({
    super.key,
    required this.coffee,
  });
  final Coffee coffee;
  @override
  Widget build(BuildContext context) {
    List<String> nameParts = coffee.name.split(' ');
    String name = nameParts[0];
    String name2 = nameParts.sublist(1).join(' ');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 20.sp),
        ),
        Text(
          name2,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: hintColor),
        ),
        Row(
          children: [
            Icon(
              Icons.star,
              color: Colors.amber,
              size: 24.sp,
            ),
            Row(
              children: [
                Text(
                  "${coffee.rating}",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  " (${coffee.review})",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
            const Spacer(),
            ...List.generate(
              coffee.ingredients.length,
              (index) => AllergeneContainer(
                ingredient: coffee.ingredients[index],
              ),
            ),
          ],
        ),
        const Divider(
          color: dividerColor,
        ),
      ],
    );
  }
}
