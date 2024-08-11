// ignore_for_file: use_key_in_widget_constructors, sized_box_for_whitespace, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

import '../../../models/icon_menu.dart';
import '../../../theme.dart';
import '../my_carrot q/report.dart'; // report.dart import
import '../my_carrot q/question_screen.dart'; // question_screen.dart import

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
            (index) => InkWell(
              onTap: () {
                if (iconMenuList[index].title == '신고하기') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ReportScreen()), // 신고하기로 이동
                  );
                } else if (iconMenuList[index].title == '자주 묻는 Q/A') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const QuestionScreen()), // Q/A 화면으로 이동
                  );
                } else {
                  // 다른 메뉴의 경우 별도 동작 추가 가능
                }
              },
              child: _buildRowIconItem(
                  iconMenuList[index].title, iconMenuList[index].iconData),
            ),
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
        ],
      ),
    );
  }
}
