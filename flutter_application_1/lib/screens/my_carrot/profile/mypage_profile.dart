import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../components/my_carrot_header.dart'; // MyCarrotHeader 위젯을 불러오기 위해 import
import 'mypage_profile2.dart'; // MyPageProfile2 위젯을 불러오기 위해 import

class MyPageProfile extends StatefulWidget {
  final List<String> reviews; // 후기 데이터를 저장할 리스트

  const MyPageProfile({super.key, required this.reviews});

  @override
  State<MyPageProfile> createState() => _MyPageProfileState();
}

class _MyPageProfileState extends State<MyPageProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 184, 224, 247),
      appBar: AppBar(
        title: const Center(
          child: Text(
            '프로필',
            style: TextStyle(fontSize: 15, color: Colors.black),
          ),
        ),
      ),
      body: ListView(
        children: [
          MyCarrotHeader(
            buttonText: '프로필 수정', // 버튼 텍스트를 '프로필 수정'으로 변경
            onProfileButtonPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MyPageProfile2()),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                const SizedBox(width: 12.0), // 왼쪽 여백 추가
                const Text(
                  '받은 거래 후기',
                  style: TextStyle(fontSize: 15.0, color: Colors.black),
                ),
                const SizedBox(width: 10.0), // 텍스트와 이미지 사이 간격
                Image.asset(
                  'assets/main.png', // 사용자가 저장해놓은 이미지 파일 경로
                  width: 30.0,
                  height: 30.0,
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: widget.reviews.map((review) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Row(
                    children: [
                      const Icon(Icons.star, color: Colors.yellow),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          review,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

TextTheme textTheme() {
  return TextTheme(
    displayLarge: GoogleFonts.openSans(fontSize: 18.0, color: Colors.black),
    displayMedium: GoogleFonts.openSans(
        fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.bold),
    bodyLarge: GoogleFonts.openSans(fontSize: 16.0, color: Colors.black),
    bodyMedium: GoogleFonts.openSans(fontSize: 14.0, color: Colors.grey),
    titleMedium: GoogleFonts.openSans(fontSize: 15.0, color: Colors.black),
  );
}
