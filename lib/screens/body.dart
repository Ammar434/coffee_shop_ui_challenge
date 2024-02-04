import 'acceuil/acceuil_screen.dart';
import '../widgets/pending.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../provider/navigation_provider.dart';
import '../widgets/custom_bottom_navigation_bar_item.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: const CustomBottomNavigationBar(),
        body: IndexedStack(
          index: Provider.of<NavigationProvider>(context).currentIndex,
          children: const [
            AcceuilScreen(),
            Pending(),
            Pending(),
            Pending(),
          ],
        ),
      ),
    );
  }
}

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(24.sp),
        topRight: Radius.circular(24.sp),
      ),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        elevation: 2,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: Provider.of<NavigationProvider>(context).currentIndex,
        onTap: (index) {
          Provider.of<NavigationProvider>(context, listen: false).currentIndex = index;
        },
        items: <BottomNavigationBarItem>[
          CustomBottomNavigationBarItem(svgPath: 'assets/icons/home.svg'),
          CustomBottomNavigationBarItem(svgPath: 'assets/icons/heart.svg'),
          CustomBottomNavigationBarItem(svgPath: 'assets/icons/bag.svg'),
          CustomBottomNavigationBarItem(svgPath: 'assets/icons/notification.svg'),
        ],
      ),
    );
  }
}
