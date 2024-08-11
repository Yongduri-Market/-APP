// ignore_for_file: unnecessary_import, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/icon_menu.dart';
import 'components/card_icon_menu.dart';
import 'components/my_carrot_header.dart';
//import '../my_carrot/my_carrot q/question_screen.dart'; // question_screen.dart import
import '../my_carrot/profile/mypage_profile.dart'; // mypage_profile.dart import
//import '../my_carrot/my_carrot q/report.dart'; // report.dart import

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
          MyCarrotHeader(
            buttonText: '프로필 보기', // 버튼 텍스트를 '프로필 보기'로 설정
            onProfileButtonPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const MyPageProfile(
                          reviews: [],
                        )),
              );
            },
          ),
          const SizedBox(height: 3.0),
          CardIconMenu(
            iconMenuList: iconMenu1,
          ),
          const SizedBox(height: 3.0),
          CardIconMenu(
            iconMenuList: iconMenu2,
          ),
        ],
      ),
    );
  }
}
