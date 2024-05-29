// ignore_for_file: unnecessary_import, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/icon_menu.dart';
import 'components/card_icon_menu.dart';
import 'components/my_carrot_header.dart';

class MyCarrotScreen extends StatelessWidget {
  const MyCarrotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 184, 224, 247),
      appBar: AppBar(
        title: const Image(
            image: AssetImage('assets/main_font.png'),
            width: 130,
            height: 50,
            fit: BoxFit.fill),
      ),
      body: ListView(
        children: [
          MyCarrotHeader(),
          const SizedBox(height: 3.0),
          CardIconMenu(
            iconMenuList: iconMenu1,
          ),
          const SizedBox(height: 3.0),
          CardIconMenu(iconMenuList: iconMenu2),
        ],
      ),
    );
  }
}
