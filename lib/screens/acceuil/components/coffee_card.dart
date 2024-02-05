import 'package:coffe_shop_ui_challenge/models/coffee.dart';
import 'package:coffe_shop_ui_challenge/screens/acceuil/components/coffee_grid_view.dart';
import 'package:coffe_shop_ui_challenge/screens/acceuil/components/coffee_image.dart';
import 'package:coffe_shop_ui_challenge/utils/constants.dart';
import 'package:coffe_shop_ui_challenge/widgets/small_padding.dart';
import 'package:flutter/material.dart';

class CoffeeCard extends StatelessWidget {
  final Coffee coffee;
  final String name;
  final String name2;

  const CoffeeCard({
    super.key,
    required this.coffee,
    required this.name,
    required this.name2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.all(kSmallPadding),
      decoration: BoxDecoration(
        borderRadius: kBorderRadius,
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 1,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(kSmallPadding),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: CoffeeImage(coffee: coffee),
            ),
            smallPaddingVertical,
            Expanded(
              child: CoffeeDetails(
                coffee: coffee,
                name: name,
                name2: name2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
