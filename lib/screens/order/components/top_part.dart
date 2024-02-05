import 'package:coffe_shop_ui_challenge/provider/order_provider.dart';
import 'package:coffe_shop_ui_challenge/screens/order/components/add_note_to_order.dart';
import 'package:coffe_shop_ui_challenge/screens/order/components/card_coffee.dart';
import 'package:coffe_shop_ui_challenge/utils/colors.dart';
import 'package:coffe_shop_ui_challenge/utils/snackbar.dart';
import 'package:coffe_shop_ui_challenge/widgets/small_padding.dart';
import 'package:coffe_shop_ui_challenge/widgets/stadium_buttons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TopPart extends StatelessWidget {
  const TopPart({
    super.key,
    required this.imageUrl,
    required this.coffeeName,
  });

  final String imageUrl;
  final String coffeeName;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Delivery address",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          smallPaddingVertical,
          Text(
            "Jl. Pahlawan, No. 1, Malang",
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
          ),
          smallPaddingVertical,
          Text(
            "Jl. Pahlawan, No. 1, Malang",
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: hintColor),
          ),
          paddingVertical,
          Row(
            children: [
              StadiumButton(
                onTap: () => showSnackBarBuildLater(context),
                title: 'Edit address',
                svgPath: 'assets/icons/edit.svg',
              ),
              paddingHorizontal,
              StadiumButton(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const AddNoteToOrderScreen(),
                  ),
                ),
                title: 'Add note',
                svgPath: 'assets/icons/note.svg',
              ),
            ],
          ),
          Visibility(
            visible: Provider.of<OrderProvider>(context).detail.isNotEmpty,
            child: Text(
              Provider.of<OrderProvider>(context).detail,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          paddingVertical,
          const Divider(
            color: dividerColor,
          ),
          CardCoffee(
            imageUrl: imageUrl,
            name: coffeeName,
          )
        ],
      ),
    );
  }
}
