import '../../datas/temporary_user_data.dart';
import '../../models/coffee.dart';
import '../../models/ingredient.dart';
import 'package:coffe_shop_ui_challenge/provider/order_provider.dart';
import 'package:coffe_shop_ui_challenge/screens/order/order_screen.dart';
import 'package:coffe_shop_ui_challenge/utils/colors.dart';
import 'package:coffe_shop_ui_challenge/utils/constants.dart';
import 'package:coffe_shop_ui_challenge/widgets/expandable_text.dart';
import 'package:coffe_shop_ui_challenge/widgets/icon_svg.dart';
import 'package:coffe_shop_ui_challenge/widgets/small_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CoffeeDetailScreen extends StatelessWidget {
  const CoffeeDetailScreen({super.key, required this.coffee});
  final Coffee coffee;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<OrderProvider>(context, listen: false).setPrice(coffee.price);
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail"),
        titleSpacing: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: AnimatedIconExample(
              name: coffee.name,
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBarDetailScreeen(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => OrderScreen(coffee: coffee),
          ),
        ),
      ),
      body: SingleChildScrollView(
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
      ),
    );
  }
}

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

class BottomNavigationBarDetailScreeen extends StatelessWidget {
  const BottomNavigationBarDetailScreeen({
    super.key,
    required this.onTap,
  });
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.symmetric(vertical: kPadding, horizontal: kPadding * 1.5),
      padding: EdgeInsets.only(
        bottom: kPadding * 2,
        left: kPadding * 1.5,
        right: kPadding * 1.5,
        top: kPadding,
      ),
      height: 120.sp,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.sp),
          topRight: Radius.circular(24.sp),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 2,
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Price',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: hintColor,
                      ),
                  textAlign: TextAlign.start,
                ),
                Consumer<OrderProvider>(
                  builder: (context, provider, child) {
                    return Text(
                      "\$${provider.price}",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: primaryColor,
                          ),
                    );
                  },
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: GestureDetector(
              onTap: onTap,
              child: Container(
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: kBorderRadius,
                ),
                child: Center(
                  child: Text(
                    "Add to cart",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Colors.white,
                        ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    var buttonStateProvider = Provider.of<OrderProvider>(context, listen: false);

    return Expanded(
      child: GestureDetector(
        onTap: () => buttonStateProvider.selectButton(text),
        child: Consumer<OrderProvider>(builder: (context, buttonStateProvider, child) {
          bool isSelected = buttonStateProvider.selectedButton == text;

          return Container(
            margin: EdgeInsets.symmetric(horizontal: kSmallPadding),
            decoration: BoxDecoration(
              color: isSelected ? primaryColor.withOpacity(0.1) : Colors.white,
              borderRadius: kBorderRadius,
              border: Border.all(
                width: 1.sp,
                color: isSelected ? primaryColor : hintColor,
              ),
            ),
            child: Center(
              child: Text(
                text,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: isSelected ? primaryColor : hintColor,
                    ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

class AnimatedIconExample extends StatefulWidget {
  const AnimatedIconExample({super.key, required this.name});

  final String name;
  @override
  _AnimatedIconExampleState createState() => _AnimatedIconExampleState();
}

class _AnimatedIconExampleState extends State<AnimatedIconExample> {
  late bool isTapped;
  @override
  void initState() {
    super.initState();
    isTapped = coffeeLike.contains(widget.name);
    print(isTapped);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isTapped = !isTapped;
          if (isTapped) {
            coffeeLike.add(widget.name);
          } else {
            coffeeLike.remove(widget.name);
          }
        });
      },
      child: AnimatedCrossFade(
        firstCurve: Curves.easeInOut,
        secondCurve: Curves.easeIn,
        duration: const Duration(milliseconds: 300),
        firstChild: IconSvg(
          svgPath: "assets/icons/heart2.svg",
          size: 30.sp,
          color: hintColor,
        ),
        secondChild: IconSvg(
          svgPath: "assets/icons/heart2.svg",
          size: 30.sp,
          color: Colors.red,
        ),
        crossFadeState: isTapped ? CrossFadeState.showSecond : CrossFadeState.showFirst,
      ),
    );
  }
}

class Description extends StatelessWidget {
  const Description({
    super.key,
    required this.description,
  });

  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Description",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        smallPaddingVertical,
        ExpandableText(
          description,
          style: Theme.of(context).textTheme.bodyMedium,
        )
      ],
    );
  }
}

class ProductImage extends StatelessWidget {
  const ProductImage({
    super.key,
    required this.url,
  });

  final String url;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3 / 2,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: kBorderRadius,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              url,
            ),
          ),
        ),
      ),
    );
  }
}

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

class AllergeneContainer extends StatelessWidget {
  const AllergeneContainer({
    super.key,
    required this.ingredient,
  });
  final Ingredient ingredient;
  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: ingredient.name,
      triggerMode: TooltipTriggerMode.tap,
      child: Container(
        width: 44.sp,
        height: 44.sp,
        margin: EdgeInsets.symmetric(horizontal: kSmallPadding * 0.5),
        decoration: BoxDecoration(
          color: hintColor.withOpacity(0.1),
          borderRadius: kBorderRadius,
        ),
        child: Center(
          child: IconSvg(
            svgPath: ingredient.svgPath,
            size: 24.sp,
            color: primaryColor,
          ),
        ),
      ),
    );
  }
}
