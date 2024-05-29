// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'chatting/chatting_screen.dart';
import 'home/home_screen.dart';
import 'my_carrot/my_carrot_screen.dart';

class MainScreens extends StatefulWidget {
  const MainScreens({super.key});

  @override
  _MainScreensState createState() => _MainScreensState();
}

class _MainScreensState extends State<MainScreens> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: [HomeScreen(), ChattingScreen(), MyCarrotScreen()],
      ),
      backgroundColor: const Color.fromARGB(255, 184, 224, 247),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 184, 224, 247),
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          const BottomNavigationBarItem(label: '홈', icon: Icon(Icons.home)),
          const BottomNavigationBarItem(
              label: '채팅', icon: Icon(Icons.question_answer)),
          const BottomNavigationBarItem(
              label: '나의 당근', icon: Icon(Icons.person)),
        ],
      ),
    );
  }
}
