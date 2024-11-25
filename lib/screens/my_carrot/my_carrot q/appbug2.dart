import 'package:flutter/material.dart';

class AppBug2Screen extends StatefulWidget {
  const AppBug2Screen({super.key});

  @override
  State<AppBug2Screen> createState() => _AppBug2State();
}

class _AppBug2State extends State<AppBug2Screen> {
  final List<String> _imagePaths = [
    'assets/main.png',
    'assets/main.png',
    'assets/main.png',
    'assets/main.png',
  ];

  final List<String> _mainTexts = [
    '질문',
    '답변',
    '질문',
    '답변',
  ];

  final List<String> _subTexts = [
    '용가리님이 욕설을 퍼 부어요',
    '안녕하세요. 욕설 및 비방 시 패널티가 주어집니다.',
    '사실 것처럼 하다가 노쇼해요',
    '안녕하세요. 노쇼 3회 이상 시 패널티 주어집니다.',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            '앱 버그 및 오류 신고',
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
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: ListView(
          children: [
            for (int i = 0; i < _imagePaths.length; i += 2) ...[
              _buildListItem(i),
              if (i + 1 < _imagePaths.length) _buildListItem(i + 1),
              if (i + 1 < _imagePaths.length)
                Divider(
                  color: Colors.white.withOpacity(0.5),
                  height: 30,
                  thickness: 1,
                ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildListItem(int index) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40.0),
      child: Row(
        children: [
          Image.asset(
            _imagePaths[index],
            width: 45, // 이미지의 너비 조절 가능
            height: 45, // 이미지의 높이 조절 가능
          ),
          const SizedBox(width: 20), // 이미지와 텍스트 사이의 간격 조절
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    _mainTexts[index],
                    style: const TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  const SizedBox(width: 20), // 첫 번째 텍스트와 두 번째 텍스트 사이의 간격 조절
                ],
              ),
              Text(
                _subTexts[index],
                style: const TextStyle(fontSize: 12, color: Colors.black54),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
