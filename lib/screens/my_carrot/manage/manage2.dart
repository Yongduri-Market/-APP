import 'package:flutter/material.dart';

class MyCarrotScreen extends StatefulWidget {
  const MyCarrotScreen({super.key});

  @override
  State<MyCarrotScreen> createState() => _MyCarrotScreenState();
}

class _MyCarrotScreenState extends State<MyCarrotScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 184, 224, 247),
      appBar: AppBar(
        title: const Center(
          child: Text(
            '질문과 답변',
            style: TextStyle(fontSize: 15, color: Colors.black),
          ),
        ),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Divider(
            color: Color.fromARGB(255, 175, 217, 240),
            height: 2.0,
          ),
        ),
      ),
      body: Column(
        children: [
          Align(
            alignment: Alignment.topCenter, // 직사각형을 위쪽으로 정렬
            child: Container(
              margin: const EdgeInsets.only(top: 20), // 상단 여백 조절
              width: 350, // 직사각형의 너비
              height: 500, // 직사각형의 높이
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 184, 224, 247),
                borderRadius: BorderRadius.circular(10), // 직사각형의 색상
                border: Border.all(
                  color: Colors.white, // 테두리 색상
                  width: 0.7, // 테두리 두께
                ),
              ),
            ),
          ),
          const SizedBox(height: 20), // 직사각형과 버튼 사이의 간격 조절
          Container(
            width: 350,
            height: 40,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 166, 206, 227), // 버튼 배경 색상
              borderRadius: BorderRadius.circular(10), // 둥근 모양 설정
            ),
            child: const Center(
              child: Text(
                '등록하기',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
          ),
          const SizedBox(height: 10), // 버튼 사이의 간격 조절
          Container(
            width: 350,
            height: 40,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 184, 224, 247), // 버튼 배경 색상
              borderRadius: BorderRadius.circular(10), // 둥근 모양 설정
            ),
            child: const Center(
              child: Text(
                '취소',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
