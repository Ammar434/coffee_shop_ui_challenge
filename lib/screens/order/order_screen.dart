import 'package:coffe_shop_ui_challenge/screens/order/components/discount_box.dart';
import 'package:coffe_shop_ui_challenge/screens/order/components/payment_summary.dart';
import 'package:coffe_shop_ui_challenge/screens/order/components/top_part.dart';
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
        bottomNavigationBar: _buildBottomNavigationBar(context),
        appBar: _buildAppBar(),
        body: _buildBody(context),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
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
            color: Colors.grey[200],
            borderRadius: BorderRadius.all(
              Radius.circular(kRadius),
            ),
          ),
          child: _buildTabBar(),
        ),
      ),
    );
  }

  TabBar _buildTabBar() {
    return TabBar(
      labelColor: Colors.white,
      unselectedLabelColor: Colors.black,
      indicatorSize: TabBarIndicatorSize.tab,
      dividerHeight: 0,
      indicatorPadding: EdgeInsets.all(kSmallPadding),
      splashBorderRadius: kBorderRadius,
      indicator: BoxDecoration(
        borderRadius: kBorderRadius,
        color: primaryColor,
      ),
      tabs: const [
        Tab(
          text: 'Delivery',
        ),
        Tab(
          text: 'Pick Up',
        )
      ],
    );
  }

  Widget _buildBody(BuildContext context) {
    return TabBarView(
      children: [
        _buildBasicTab(context),
        const Pending(
          isAppBarVisible: false,
        ),
      ],
    );
  }

  Widget _buildBasicTab(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: Column(
          children: [
            paddingVertical,
            TopPart(
              imageUrl: coffee.imageUrl,
              coffeeName: coffee.name,
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
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        bottom: kPadding * 1,
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
          _buildPaymentRow(context),
          _buildAddToCartButton(context),
        ],
      ),
    );
  }

  Widget _buildPaymentRow(BuildContext context) {
    return Row(
      children: [
        IconSvg(
          svgPath: 'assets/icons/money.svg',
          size: iconSize * 1.4,
          color: primaryColor,
        ),
        smallPaddingHorizontal,
        _buildPaymentContainer(context),
        const Spacer(),
        _buildMoreOptionsButton(context),
      ],
    );
  }

  Widget _buildPaymentContainer(BuildContext context) {
    return Container(
      height: 30.sp,
      decoration: ShapeDecoration(
        color: scaffoldColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Row(
        children: [
          _buildCashContainer(context),
          smallPaddingHorizontal,
          _buildTotalPriceText(context),
          smallPaddingHorizontal,
        ],
      ),
    );
  }

  Widget _buildCashContainer(BuildContext context) {
    return Container(
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
    );
  }

  Widget _buildTotalPriceText(BuildContext context) {
    return Center(
      child: Text(
        '\$ ${Provider.of<OrderProvider>(context).total.toStringAsFixed(2)}',
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }

  Widget _buildMoreOptionsButton(BuildContext context) {
    return GestureDetector(
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
    );
  }

  Widget _buildAddToCartButton(BuildContext context) {
    return GestureDetector(
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
    );
  }
}
