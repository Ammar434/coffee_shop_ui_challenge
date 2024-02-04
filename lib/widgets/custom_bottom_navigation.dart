import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends BottomNavigationBar {
  CustomBottomNavigationBar({
    Key? key,
    required List<BottomNavigationBarItem> items,
    required int currentIndex,
    required ValueChanged<int> onTap,
  }) : super(
          key: key,
          items: items,
          currentIndex: currentIndex,
          onTap: onTap,
        );

  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: BottomNavigationBar(
        key: key,
        items: items,
        currentIndex: currentIndex,
        onTap: onTap,
        backgroundColor: Colors.red,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
