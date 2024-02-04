import 'package:coffe_shop_ui_challenge/models/coffee.dart';
import 'package:coffe_shop_ui_challenge/screens/coffee_detail/coffee_detail_screen.dart';
import 'package:coffe_shop_ui_challenge/utils/colors.dart';
import 'package:coffe_shop_ui_challenge/utils/constants.dart';
import 'package:coffe_shop_ui_challenge/utils/snackbar.dart';
import 'package:coffe_shop_ui_challenge/widgets/icon_svg.dart';
import 'package:coffe_shop_ui_challenge/widgets/small_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../datas/temporary_data.dart';
import 'components/top_part/top_part.dart';

class AcceuilScreen extends StatefulWidget {
  const AcceuilScreen({super.key});

  @override
  State<AcceuilScreen> createState() => _AcceuilScreenState();
}

class _AcceuilScreenState extends State<AcceuilScreen> with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  late final ScrollController scrollController;
  CoffeeCategory category = CoffeeCategory.macchiato;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: coffeeCategoryNames.length, vsync: this);
    scrollController = ScrollController();
  }

  @override
  void dispose() {
    _tabController.dispose();
    scrollController.dispose();

    super.dispose();
  }

  void onTap(int index) {
    setState(() {
      category = coffeeCategoryNames.keys.toList()[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        controller: scrollController,
        child: DefaultTabController(
          length: coffeeCategoryNames.length,
          child: Column(
            children: [
              TopPart(height: constraints.maxHeight * .5),
              smallPaddingVertical,
              TabBarAcceuilScreen(
                onTap: onTap,
              ),
              CoffeeGridView(
                category: category,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TabBarAcceuilScreen extends StatelessWidget {
  const TabBarAcceuilScreen({
    super.key,
    required this.onTap,
  });
  final Function(int) onTap;
  @override
  Widget build(BuildContext context) {
    return TabBar(
      isScrollable: true,
      padding: EdgeInsets.zero,
      tabAlignment: TabAlignment.start,
      labelColor: Colors.white,
      unselectedLabelColor: Colors.black,
      indicatorSize: TabBarIndicatorSize.tab,
      dividerHeight: 0,
      indicatorPadding: EdgeInsets.all(kSmallPadding),
      indicator: BoxDecoration(
        borderRadius: kBorderRadius,
        color: primaryColor,
      ),
      splashBorderRadius: kBorderRadius,
      splashFactory: NoSplash.splashFactory,
      onTap: onTap,
      labelPadding: EdgeInsets.symmetric(horizontal: kPadding),
      labelStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w600),
      unselectedLabelStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w400),
      tabs: List.generate(
        coffeeCategoryNames.length,
        (index) => Tab(
          text: coffeeCategoryNames.values.toList()[index],
        ),
      ),
    );
  }
}

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
          child: Container(
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
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: kBorderRadius,
                        image: DecorationImage(
                          image: NetworkImage(list[index].imageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            top: 0,
                            left: 0,
                            child: Container(
                              padding: EdgeInsets.all(kSmallPadding),
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.2),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(kRadius),
                                  bottomRight: Radius.circular(kRadius),
                                ),
                              ),
                              child: Row(
                                children: [
                                  const IconSvg(
                                    svgPath: "assets/icons/star.svg",
                                    color: Colors.yellow,
                                  ),
                                  smallPaddingVertical,
                                  Text(
                                    list[index].rating.toString(),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  smallPaddingVertical,
                  Expanded(
                    child: Column(
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
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "\$ ${list[index].price}",
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
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
