import 'package:coffe_shop_ui_challenge/datas/temporary_data.dart';
import 'package:flutter/material.dart';

import 'acceuil_colum.dart';

class AcceuilScrollView extends StatelessWidget {
  final ScrollController scrollController;
  final BoxConstraints constraints;
  final Function(int) onTap;
  final CoffeeCategory category;

  const AcceuilScrollView({
    super.key,
    required this.scrollController,
    required this.constraints,
    required this.onTap,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      controller: scrollController,
      child: AcceuilColumn(
        constraints: constraints,
        onTap: onTap,
        category: category,
      ),
    );
  }
}
