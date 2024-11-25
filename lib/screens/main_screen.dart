import 'package:flutter/material.dart';
import 'package:yongduri_market/screens/main/main_chat.dart';
import 'package:yongduri_market/screens/main/main_mypage.dart';

import 'package:yongduri_market/screens/main/main_home.dart';

class MainScreen extends StatefulWidget {
  static const route = 'main_screen';
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: const [
          MainHome(),
          MainChat(),
          MainMypage(),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        height: 80,
        child: Column(
          children: [
            Container(
              height: 2,
              color: Colors.white,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _selectedIndex = 0;
                      });
                    },
                    icon: const Icon(
                      Icons.edit_square,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _selectedIndex = 1;
                      });
                    },
                    icon: const Icon(
                      Icons.forum,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _selectedIndex = 2;
                      });
                    },
                    icon: const Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
