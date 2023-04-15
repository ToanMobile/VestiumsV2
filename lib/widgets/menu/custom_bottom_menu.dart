import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/res/theme/theme_service.dart';
import '../../../res/style.dart';
import 'custom_bottom_menu_controller.dart';

class CustomBottomNenu extends StatelessWidget {
  final int index;
  final List<BottomNavigationBarItem> items;
  final Color? selectedItemColor;
  final Color? unselectedItemColor;
  final Color? backgroundColor;
  final BottomNavigationBarType? type;
  final double? unselectedFontSize;
  final double? selectedFontSize;
  final Function(int) onTabChanged;

  CustomBottomNenu(
      {required this.index,
      required this.items,
      this.selectedItemColor,
      this.unselectedItemColor,
      this.backgroundColor,
      this.type,
      this.unselectedFontSize,
      this.selectedFontSize,
      required this.onTabChanged});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CustomBottomMenuController>(
        init: CustomBottomMenuController(),
        builder: (controller) {
          return BottomNavigationBar(
            showSelectedLabels: true,
            showUnselectedLabels: true,
            currentIndex: index,
            type: type ?? BottomNavigationBarType.fixed,
            selectedItemColor: selectedItemColor ?? getColor().themeColorPrimary,
            unselectedItemColor: unselectedItemColor ?? getColor().themeColorB2B2B2,
            backgroundColor: backgroundColor ?? getColor().bgThemeColorWhite,
            onTap: onTabChanged,
            selectedLabelStyle: text12.medium.textColorPrimary,
            unselectedLabelStyle: text12.medium.textColor777777,
            unselectedFontSize: unselectedFontSize ?? 12.ts,
            selectedFontSize: selectedFontSize ?? 12.ts,
            items: items,
          );
        });
  }
}
