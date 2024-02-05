import 'package:coffe_shop_ui_challenge/screens/coffee_detail/components/card_review.dart';
import 'package:coffe_shop_ui_challenge/screens/coffee_detail/components/description.dart';
import 'package:coffe_shop_ui_challenge/screens/coffee_detail/components/product_image.dart';
import 'package:coffe_shop_ui_challenge/screens/coffee_detail/components/size_select.dart';
import 'package:coffe_shop_ui_challenge/widgets/animated_icon.dart';

import '../../models/coffee.dart';
import 'package:coffe_shop_ui_challenge/provider/order_provider.dart';
import 'package:coffe_shop_ui_challenge/screens/order/order_screen.dart';
import 'package:coffe_shop_ui_challenge/utils/constants.dart';
import 'package:coffe_shop_ui_challenge/widgets/small_padding.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/custom_bottom_navigation_bar.dart';

class CoffeeDetailScreen extends StatelessWidget {
  const CoffeeDetailScreen({super.key, required this.coffee});
  final Coffee coffee;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<OrderProvider>(context, listen: false).setPrice(coffee.price);
    });
    return Scaffold(
      appBar: _buildAppBar(),
      bottomNavigationBar: _buildBottomNavigationBar(context),
      body: _buildBody(context),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text("Detail"),
      titleSpacing: 0,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: AnimatedIconCustom(
            name: coffee.name,
          ),
        ),
      ],
    );
  }

  BottomNavigationBarDetailScreeen _buildBottomNavigationBar(BuildContext context) {
    return BottomNavigationBarDetailScreeen(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => OrderScreen(coffee: coffee),
        ),
      ),
    );
  }

  SingleChildScrollView _buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(kPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ProductImage(
              url: coffee.imageUrl,
            ),
            paddingVertical,
            CardReview(
              coffee: coffee,
            ),
            smallPaddingVertical,
            Description(
              description: coffee.description,
            ),
            paddingVertical,
            const SizeSelect(),
          ],
        ),
      ),
    );
  }
}
