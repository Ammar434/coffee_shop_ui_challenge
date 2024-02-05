import 'package:coffe_shop_ui_challenge/screens/acceuil/components/acceuil_scroll_view.dart';
import 'package:flutter/material.dart';

import '../../datas/temporary_data.dart';

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
