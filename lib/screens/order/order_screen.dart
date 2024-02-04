import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../models/coffee.dart';
import '../../provider/order_provider.dart';
import '../../utils/colors.dart';
import '../../utils/constants.dart';
import '../../widgets/icon_svg.dart';
import '../../widgets/small_padding.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key, required this.coffee});
  final Coffee coffee;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(topRight: Radius.circular(30), topLeft: Radius.circular(30)),
            boxShadow: [
              BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 1),
            ],
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
            child: BottomAppBar(
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(
                            10,
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            'Total payment',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.pink,
                          borderRadius: BorderRadius.circular(
                            10,
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            'Checkout',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        appBar: AppBar(
          elevation: 0,
          title: const Text('Order'),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(AppBar().preferredSize.height),
            child: Container(
              height: 60.sp,
              margin: EdgeInsets.symmetric(
                horizontal: kPadding,
              ),
              decoration: BoxDecoration(
                borderRadius: kBorderRadius,
                color: Colors.grey[200],
              ),
              child: TabBar(
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black,
                indicatorSize: TabBarIndicatorSize.tab,
                dividerHeight: 0,
                indicatorPadding: const EdgeInsets.all(5),
                indicator: BoxDecoration(
                  borderRadius: kBorderRadius,
                  color: primaryColor,
                ),
                tabs: const [
                  Tab(
                    text: 'Basic',
                  ),
                  Tab(
                    text: 'Advanced',
                  )
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            Column(
              children: [
                paddingVertical,
                TopPart(
                  imageUrl: coffee.imageUrl,
                ),
                Divider(
                  color: Colors.grey[200],
                  thickness: 5.sp,
                ),
                const Column(
                  children: [
                    DiscountBox(),
                    Text(
                      "Payment summary",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text("Price"),
                        Spacer(),
                        Text("\$0.00"),
                      ],
                    ),
                    Row(
                      children: [
                        Text("Price"),
                        Spacer(),
                        Text(
                          "\$0.00",
                          style: TextStyle(decoration: TextDecoration.lineThrough),
                        ),
                        Text("\$0.00"),
                      ],
                    ),
                    Divider(),
                    Row(
                      children: [
                        Text("Total payment"),
                        Spacer(),
                        Text(
                          "\$0.00",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
            const Center(
              child: Text('Advanced'),
            ),
          ],
        ),
      ),
    );
  }
}

class DiscountBox extends StatelessWidget {
  const DiscountBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.sp,
      margin: EdgeInsets.symmetric(
        horizontal: kPadding * 1,
        vertical: kPadding,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: kSmallPadding,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          kRadius,
        ),
        border: Border.all(
          color: Colors.grey,
        ),
      ),
      child: Row(
        children: [
          IconSvg(
            svgPath: 'assets/icons/discount.svg',
            size: iconSize * 1.5,
            color: primaryColor,
          ),
          smallPaddingHorizontal,
          Text(
            'One discount is applied',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const Spacer(),
          Icon(
            Icons.arrow_forward_ios,
            size: iconSize,
          ),
        ],
      ),
    );
  }
}

class TopPart extends StatelessWidget {
  const TopPart({
    super.key,
    required this.imageUrl,
  });

  final String imageUrl;

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
                onTap: () {},
                title: 'Edit address',
                svgPath: 'assets/icons/edit.svg',
              ),
              paddingHorizontal,
              StadiumButton(
                onTap: () {},
                title: 'Add note',
                svgPath: 'assets/icons/note.svg',
              ),
            ],
          ),
          paddingVertical,
          const Divider(
            color: dividerColor,
          ),
          CardCoffee(imageUrl: imageUrl)
        ],
      ),
    );
  }
}

class CardCoffee extends StatelessWidget {
  const CardCoffee({
    super.key,
    required this.imageUrl,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
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
              //TODO : Change this to dynamic value

              'Item name',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
            ),
            Text(
              'Item description',
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

class StadiumButton extends StatelessWidget {
  const StadiumButton({
    super.key,
    required this.onTap,
    required this.title,
    required this.svgPath,
  });
  final Function() onTap;
  final String title;
  final String svgPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        borderRadius: kBorderRadius,
        color: scaffoldColor,
        border: Border.all(
          color: Colors.grey.withOpacity(0.5),
        ),
      ),
      child: Row(
        children: [
          IconSvg(
            svgPath: svgPath,
            size: iconSize,
          ),
          smallPaddingHorizontal,
          Text(
            title,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
