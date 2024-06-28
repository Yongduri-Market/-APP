import 'package:flutter/material.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  // 각 아이콘에 대응하는 텍스트 리스트
  final List<String> _texts = [
    '판매자가 사기/배상 신고 방법?',
    '채팅창 오른쪽 상단 신고하기 탭 클릭',
    '위치 변경은 어떻게 하나요?',
    '채팅창 상단 바 중 약속잡기 들어가 변경',
    '게시글 삭제는 어떻게 하나요?',
    '마이패이지 들어가서 판매내역 삭제',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 184, 224, 247),
      appBar: AppBar(
        title: const Center(
          child: Text(
            '자주 묻는 Q/A',
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
      body: ListView.builder(
        padding: const EdgeInsets.all(20.0),
        itemCount: (_texts.length / 2).ceil(), // 리스트를 두 개씩 나누어 표시
        itemBuilder: (BuildContext context, int index) {
          final int firstIndex = index * 2;
          final int secondIndex = index * 2 + 1;

          return Column(
            children: [
              _buildQARow(Icons.person, _texts[firstIndex], size: 35.0),
              if (secondIndex < _texts.length)
                _buildQARow(Icons.support_agent, _texts[secondIndex],
                    size: 35.0),
              Divider(
                  color: Colors.white.withOpacity(0.5),
                  height: 20,
                  thickness: 1),
            ],
          );
        },
      ),
    );
  }

  Widget _buildQARow(IconData iconData, String text, {double size = 24.0}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(iconData, size: size, color: Colors.white),
          const SizedBox(width: 20.0), // 아이콘과 텍스트 사이의 간격 조절
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 16, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
