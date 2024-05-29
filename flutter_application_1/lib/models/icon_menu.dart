// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IconMenu {
  final String title;
  final IconData iconData;

  IconMenu({required this.title, required this.iconData});
}

final List<IconMenu> iconMenu1 = [
  IconMenu(title: '관심목록', iconData: FontAwesomeIcons.heart),
  IconMenu(title: '판매내역', iconData: FontAwesomeIcons.receipt),
  IconMenu(title: '구매내역', iconData: FontAwesomeIcons.cartShopping),
];

final List<IconMenu> iconMenu2 = [
  IconMenu(title: '자주 묻는 Q/A', iconData: FontAwesomeIcons.question),
  IconMenu(title: '신고하기', iconData: FontAwesomeIcons.triangleExclamation),
];
