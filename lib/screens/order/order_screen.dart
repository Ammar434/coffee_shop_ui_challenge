import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../models/coffee.dart';
import '../../provider/order_provider.dart';
import '../../utils/colors.dart';
import '../../utils/constants.dart';
import '../../utils/snackbar.dart';
import '../../widgets/icon_svg.dart';
import '../../widgets/pending.dart';
import '../../widgets/small_padding.dart';
import '../map_screen/map_screen.dart';
import 'components/add_note_to_order.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key, required this.coffee});
  final Coffee coffee;
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<OrderProvider>(context, listen: false).setPrice(coffee.price);
      Provider.of<OrderProvider>(context, listen: false).setBagPrice();
    });
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        bottomNavigationBar: Container(
          // padding: const EdgeInsets.symmetric(vertical: kPadding, horizontal: kPadding * 1.5),
          padding: EdgeInsets.only(
            bottom: kPadding * 2,
            left: kPadding * 1.5,
            right: kPadding * 1.5,
            top: kPadding,
          ),
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
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  IconSvg(
                    svgPath: 'assets/icons/money.svg',
                    size: iconSize * 1.4,
                    color: primaryColor,
                  ),
                  smallPaddingHorizontal,
                  Container(
                    height: 30.sp,
                    decoration: ShapeDecoration(
                      color: scaffoldColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 30.sp,
                          padding: EdgeInsets.symmetric(
                            horizontal: kPadding,
                          ),
                          decoration: ShapeDecoration(
                            color: primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(kRadius),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Cash',
                              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: Colors.white,
                                  ),
                            ),
                          ),
                        ),
                        smallPaddingHorizontal,
                        Center(
                          child: Text(
                            '\$ ${Provider.of<OrderProvider>(context).total.toStringAsFixed(2)}',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                        smallPaddingHorizontal,
                      ],
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () => showSnackBarBuildLater(context),
                    child: Container(
                      height: 20.sp,
                      width: 20.sp,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey,
                      ),
                      child: Icon(
                        Icons.more_horiz,
                        color: Colors.white,
                        size: 20.sp,
                      ),
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const MapScreen()));
                },
                child: Container(
                  margin: EdgeInsets.symmetric(
                    vertical: kPadding * 1,
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: kPadding * 1.2,
                  ),
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
            ],
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
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    paddingVertical,
                    TopPart(
                      imageUrl: coffee.imageUrl,
                    ),
                    Divider(
                      color: Colors.grey[200],
                      thickness: 5.sp,
                    ),
                    const DiscountBox(),
                    const PaymentSummary()
                  ],
                ),
              ),
            ),
            const Pending(
              isAppBarVisible: false,
            ),
          ],
        ),
      ),
    );
  }
}

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
                    "Price",
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

class DiscountBox extends StatelessWidget {
  const DiscountBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showSnackBarBuildLater(context),
      child: Container(
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
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              size: iconSize,
            ),
          ],
        ),
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
                onTap: () => showSnackBarBuildLater(context),
                title: 'Edit address',
                svgPath: 'assets/icons/edit.svg',
              ),
              paddingHorizontal,
              StadiumButton(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const AddNoteToOrderScreen())),
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
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
      ),
    );
  }
}
