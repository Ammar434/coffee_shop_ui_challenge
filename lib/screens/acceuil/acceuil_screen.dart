import 'package:coffe_shop_ui_challenge/models/coffee.dart';
import 'package:coffe_shop_ui_challenge/screens/acceuil/components/acceuil_scroll_view.dart';
import 'package:coffe_shop_ui_challenge/screens/acceuil/components/coffee_grid_view.dart';
import 'package:coffe_shop_ui_challenge/screens/acceuil/components/tab_bar_acceuil_screen.dart';
import 'package:coffe_shop_ui_challenge/screens/coffee_detail/coffee_detail_screen.dart';
import 'package:coffe_shop_ui_challenge/utils/colors.dart';
import 'package:coffe_shop_ui_challenge/utils/constants.dart';
import 'package:coffe_shop_ui_challenge/utils/snackbar.dart';
import 'package:coffe_shop_ui_challenge/widgets/icon_svg.dart';
import 'package:coffe_shop_ui_challenge/widgets/small_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../datas/temporary_data.dart';
import 'components/top_part.dart';

class AcceuilScreen extends StatefulWidget {
  const AcceuilScreen({super.key});

  @override
  _AcceuilScreenState createState() => _AcceuilScreenState();
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
      builder: (context, constraints) => AcceuilScrollView(
        scrollController: scrollController,
        constraints: constraints,
        onTap: onTap,
        category: category,
      ),
    );
  }
}
