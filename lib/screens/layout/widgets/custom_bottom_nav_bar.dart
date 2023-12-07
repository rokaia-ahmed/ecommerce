import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import '../../../core/utilites/colors.dart';

class CustomNavBar extends StatelessWidget {
  CustomNavBar({super.key,
    required this.onTap,
    required this.activeIndex});

  final Function(int) onTap;
  final int activeIndex;
  final List icons = [
    LineIcons.home,
    LineIcons.search,
    LineIcons.shoppingCart,
    LineIcons.user,
  ];
  @override
  Widget build(BuildContext context) {
    return AnimatedBottomNavigationBar.builder(
      itemCount: 4,
      activeIndex: activeIndex,
      gapLocation: GapLocation.none,
      height: 50,
      notchSmoothness: NotchSmoothness.verySmoothEdge,
      onTap: onTap,
      tabBuilder: (int index, bool isActive) {
        return Icon(
          icons[index],
          color: isActive ? AppColors.primaryColor
              : AppColors.lightGreyColor,
          size: 30,
        );
      },
    );
  }
}
