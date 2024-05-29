// ignore_for_file: use_key_in_widget_constructors, sized_box_for_whitespace, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

import '../../../models/icon_menu.dart';
import '../../../theme.dart';

class CardIconMenu extends StatelessWidget {
  final List<IconMenu> iconMenuList;

  CardIconMenu({required this.iconMenuList});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 184, 224, 247),
      elevation: 0.5,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: List.generate(
            iconMenuList.length,
            (index) => _buildRowIconItem(
                iconMenuList[index].title, iconMenuList[index].iconData),
          ),
        ),
      ),
    );
  }

  Widget _buildRowIconItem(String title, IconData iconData) {
    return Container(
      height: 50,
      child: Row(
        children: [
          Icon(iconData, size: 20, color: Colors.white),
          const SizedBox(width: 30),
          Text(title, style: textTheme().titleMedium)
        ], // :TODO 04수정
      ),
    );
  }
}
