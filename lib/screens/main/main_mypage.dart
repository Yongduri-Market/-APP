import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yongduri_market/screens/main/mypage/purchase_history.dart';
import 'package:yongduri_market/screens/main/mypage/sales_history.dart';
import 'package:yongduri_market/screens/my_carrot/my_carrot%20q/question_screen.dart';
import 'package:yongduri_market/screens/my_carrot/my_carrot%20q/report.dart';
import 'package:yongduri_market/screens/my_carrot/profile/mypage_profile.dart';

import '../../main.dart';

class MainMypage extends StatefulWidget {
  const MainMypage({super.key});

  @override
  State<MainMypage> createState() => _MainMypageState();
}

class _MainMypageState extends State<MainMypage> {
  final double gap = 16;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 16,
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              horizontalTitleGap: 16,
              leading: SvgPicture.asset(
                'assets/icons/ic_main.svg',
                width: 64,
                height: 64,
              ),
              title: const Text(
                '닉네임',
                style: TextStyle(fontSize: 16),
              ),
              titleTextStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black),
              trailing: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MyPageProfile(
                        reviews: [],
                      ),
                    ),
                  );
                },
                child: const Text(
                  '프로필 보기',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),
            const Text('나의 거래'),
            SizedBox(height: gap),
            ListTile(
              leading: const Icon(
                Icons.favorite,
                color: Colors.white,
                size: 32,
              ),
              title: const Text(
                '관심목록',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {},
            ),
            SizedBox(height: gap),
            ListTile(
              leading: const Icon(
                Icons.receipt,
                color: Colors.white,
                size: 32,
              ),
              title: const Text(
                '판매내역',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.of(context).pushNamed(SalesHistory.route);
              },
            ),
            SizedBox(height: gap),
            ListTile(
              leading: const Icon(
                Icons.thumb_up_alt_outlined,
                color: Colors.white,
                size: 32,
              ),
              title: const Text(
                '구매 내역',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.of(context).pushNamed(PurchaseHistory.route);
              },
            ),
            SizedBox(height: gap),
            Container(
              height: 1.5,
              color: const Color(0x80ffffff),
            ),
            SizedBox(height: gap),
            ListTile(
              leading: const Icon(
                Icons.support_agent_rounded,
                color: Colors.white,
                size: 32,
              ),
              title: const Text(
                '자주 묻는 Q&A',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                      const QuestionScreen()), // Q/A 화면으로 이동
                );
              },
            ),
            SizedBox(height: gap),
            ListTile(
              leading: const Icon(
                Icons.warning,
                color: Colors.white,
                size: 32,
              ),
              title: const Text(
                '신고하기',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ReportScreen()), // 신고하기로 이동
                );
              },
            ),
            SizedBox(height: gap),
            Container(
              height: 1.5,
              color: const Color(0x80ffffff),
            ),
            SizedBox(height: gap),
            ListTile(
              leading: const Icon(
                Icons.logout_rounded,
                color: Colors.white,
                size: 32,
              ),
              title: const Text(
                '로그아웃',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                isLoggedIn.value = false;
              },
            ),
          ],
        ),
      ),
    );
  }
}
