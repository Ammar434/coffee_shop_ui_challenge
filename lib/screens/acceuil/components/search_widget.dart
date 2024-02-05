import 'package:coffe_shop_ui_challenge/models/coffee.dart';
import 'package:coffe_shop_ui_challenge/screens/coffee_detail/coffee_detail_screen.dart';
import 'package:coffe_shop_ui_challenge/services/search_services.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import '../../../utils/colors.dart';
import 'package:coffe_shop_ui_challenge/utils/constants.dart';
import 'package:coffe_shop_ui_challenge/widgets/icon_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double height = 60.sp;
    return Container(
      height: height,
      padding: EdgeInsets.only(left: kSmallPadding, right: 4.sp),
      decoration: BoxDecoration(
        color: searchBarColor,
        borderRadius: BorderRadiusDirectional.all(Radius.circular(kRadius)),
      ),
      child: const Row(
        children: [
          Expanded(
            child: SearchField(),
          ),
        ],
      ),
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TypeAheadField<Coffee>(
      suggestionsCallback: (search) => SearchMethods.find(search),
      builder: (context, controller, focusNode) {
        return TextField(
          controller: controller,
          focusNode: focusNode,
          autofocus: false,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Colors.white,
              ),
          decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.never,
            border: InputBorder.none,
            labelText: 'Search coffee',
            alignLabelWithHint: false,
            labelStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Colors.white,
                ),
            prefixIconConstraints: BoxConstraints(
              maxHeight: iconSize * 2,
              maxWidth: iconSize * 2,
              minHeight: iconSize * 2,
              minWidth: iconSize * 2,
            ),
            prefixIcon: const Padding(
              padding: EdgeInsets.all(8.0),
              child: IconSvg(
                svgPath: "assets/icons/search-normal-1.svg",
                color: Colors.white,
              ),
            ),
            suffixIcon: Container(
              height: iconSize * 3,
              width: iconSize * 3,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(kRadius),
              ),
              child: Align(
                alignment: Alignment.center,
                child: IconSvg(
                  svgPath: "assets/icons/setting-4.svg",
                  color: Colors.white,
                  size: iconSize,
                ),
              ),
            ),
          ),
        );
      },
      itemBuilder: (context, coffee) {
        return ListTile(
          title: Text(
            coffee.name,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.black),
          ),
          subtitle: Text(
            coffee.category.name,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.black),
          ),
        );
      },
      emptyBuilder: (context) {
        return ListTile(
          title: Text(
            "We couldn't find any coffee",
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Colors.black,
                ),
          ),
          subtitle: Text(
            "Try another search term",
            style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.black),
          ),
        );
      },
      onSelected: (coffee) {
        Navigator.of(context).push<void>(
          MaterialPageRoute(
            builder: (context) => CoffeeDetailScreen(coffee: coffee),
          ),
        );
      },
    );
  }
}
