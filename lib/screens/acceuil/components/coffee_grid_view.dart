import 'package:coffe_shop_ui_challenge/datas/temporary_data.dart';
import 'package:coffe_shop_ui_challenge/models/coffee.dart';
import 'package:coffe_shop_ui_challenge/screens/acceuil/components/coffee_card.dart';
import 'package:coffe_shop_ui_challenge/screens/coffee_detail/coffee_detail_screen.dart';
import 'package:coffe_shop_ui_challenge/utils/colors.dart';
import 'package:coffe_shop_ui_challenge/utils/constants.dart';
import 'package:coffe_shop_ui_challenge/utils/snackbar.dart';
import 'package:coffe_shop_ui_challenge/widgets/icon_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CoffeeGridView extends StatelessWidget {
  const CoffeeGridView({
    super.key,
    required this.category,
  });
  final CoffeeCategory category;

  @override
  Widget build(BuildContext context) {
    List<Coffee> list = coffeeList.where((element) => element.category == category).toList() as List<Coffee>;
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: list.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: .8),
      padding: EdgeInsets.all(kSmallPadding),
      itemBuilder: (BuildContext context, int index) {
        List<String> nameParts = list[index].name.split(' ');
        String name = nameParts[0];
        String name2 = nameParts.sublist(1).join(' ');

        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CoffeeDetailScreen(
                  coffee: list[index],
                ),
              ),
            );
          },
          child: CoffeeCard(
            coffee: list[index],
            name: name,
            name2: name2,
          ),
        );
      },
    );
  }
}

class CoffeeDetails extends StatelessWidget {
  final Coffee coffee;
  final String name;
  final String name2;

  const CoffeeDetails({
    super.key,
    required this.coffee,
    required this.name,
    required this.name2,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        FittedBox(
          child: Text(
            name2,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(color: hintColor),
            maxLines: 1,
          ),
        ),
        Expanded(
          child: PriceAndAddButton(coffee: coffee),
        ),
      ],
    );
  }
}

class PriceAndAddButton extends StatelessWidget {
  final Coffee coffee;

  const PriceAndAddButton({
    super.key,
    required this.coffee,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "\$ ${coffee.price}",
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 18.sp,
              ),
        ),
        GestureDetector(
          onTap: () => showSnackBarBuildLater(context),
          child: AspectRatio(
            aspectRatio: 1,
            child: Container(
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: kSmallBorderRadius,
              ),
              child: Center(
                child: IconSvg(
                  svgPath: "assets/icons/plus.svg",
                  color: Colors.white,
                  size: 18.sp,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
