import 'package:coffe_shop_ui_challenge/models/coffee.dart';
import 'package:coffe_shop_ui_challenge/screens/acceuil/components/rating_box.dart';
import 'package:coffe_shop_ui_challenge/utils/constants.dart';
import 'package:flutter/material.dart';

class CoffeeImage extends StatelessWidget {
  final Coffee coffee;

  const CoffeeImage({
    super.key,
    required this.coffee,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: kBorderRadius,
        image: DecorationImage(
          image: NetworkImage(coffee.imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: RatingBox(rating: coffee.rating),
          ),
        ],
      ),
    );
  }
}
