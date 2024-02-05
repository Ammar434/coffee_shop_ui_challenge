import 'package:coffe_shop_ui_challenge/datas/temporary_data.dart';
import 'package:coffe_shop_ui_challenge/models/coffee.dart';
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

import 'top_part.dart';

class AcceuilColumn extends StatelessWidget {
  final BoxConstraints constraints;
  final Function(int) onTap;
  final CoffeeCategory category;

  const AcceuilColumn({
    super.key,
    required this.constraints,
    required this.onTap,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
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
    );
  }
}
