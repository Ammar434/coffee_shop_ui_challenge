import 'custom_app_bar.dart';
import 'search_widget.dart';
import '../../../utils/constants.dart';
import '../../../widgets/highlighted_text.dart';
import '../../../widgets/small_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopPart extends StatelessWidget {
  const TopPart({
    super.key,
    required this.height,
  });
  final double height;

  @override
  Widget build(BuildContext context) {
    double containerHeight = (height * 0.8);
    double promoContainerHeight = (containerHeight * 0.5);

    return SizedBox(
      height: height,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.bottomCenter,
        children: [
          TopPartPositioned(
            containerHeight: containerHeight,
            promoContainerHeight: promoContainerHeight,
          ),
          BottomPartPositioned(
            promoContainerHeight: promoContainerHeight,
          ),
        ],
      ),
    );
  }
}

class TopPartPositioned extends StatelessWidget {
  final double containerHeight;
  final double promoContainerHeight;

  const TopPartPositioned({
    super.key,
    required this.containerHeight,
    required this.promoContainerHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        color: Colors.black,
        height: containerHeight,
        child: SafeArea(
          child: Padding(
            padding: kPaddingEdgeInsets,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                smallPaddingVertical,
                const CustomAppBar(),
                paddingVertical,
                const SearchWidget(),
                SizedBox(
                  height: (promoContainerHeight * 0.4).sp,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BottomPartPositioned extends StatelessWidget {
  final double promoContainerHeight;

  const BottomPartPositioned({
    super.key,
    required this.promoContainerHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: kPadding,
      right: kPadding,
      child: Container(
        height: promoContainerHeight,
        padding: EdgeInsets.all(kPadding),
        decoration: BoxDecoration(
          borderRadius: kBorderRadius,
          image: const DecorationImage(
            image: NetworkImage("https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg"),
            fit: BoxFit.fitWidth,
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              spreadRadius: 0,
              blurRadius: 5,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            smallPaddingVertical,
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: kSmallPadding,
                vertical: kSmallPadding,
              ),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: kSmallBorderRadius,
              ),
              child: Text(
                "Promo",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            HighlightedText(
              text: 'Buy one get',
              textStyle: Theme.of(context).textTheme.titleLarge!,
            ),
            HighlightedText(
              text: 'one free',
              textStyle: Theme.of(context).textTheme.titleLarge!,
            ),
          ],
        ),
      ),
    );
  }
}
