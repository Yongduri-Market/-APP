// ignore_for_file: prefer_const_constructors, unused_import, duplicate_import, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import 'package:flutter_application_1/screens/chatting/chatting_screen.dart';
import 'package:flutter_application_1/screens/home/home_screen.dart';

import 'screens/main_screens.dart';
import 'screens/chatting/chatting_screen.dart';
import 'screens/home/home_screen.dart';
import 'screens/my_carrot/my_carrot_screen.dart';
import 'theme.dart';

void main() {
  runApp(MarketUI());
}

class MarketUI extends StatelessWidget {
  const MarketUI({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'market_ui',
      debugShowCheckedModeBanner: false,
      home: MainScreens(),
      theme: theme(),
    );
  }
}
