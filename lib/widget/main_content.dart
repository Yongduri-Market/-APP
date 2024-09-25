import 'package:flutter/material.dart';

class MainContent extends StatefulWidget {
  const MainContent({super.key});

  @override
  State<MainContent> createState() => _MainContentState();
}

class _MainContentState extends State<MainContent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 128,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.all(16),
      child:Row(
        children: [
          Container(
            width: 112,
            height: 96,
            color: const Color(0xffE0EFF4),
          ),
        ],
      ),
    );
  }
}
