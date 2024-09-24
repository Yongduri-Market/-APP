import 'package:flutter/material.dart';
import 'appbug2.dart'; // appbug2.dart import
import 'appbug3.dart'; // appbug3.dart import

class AppBugScreen extends StatefulWidget {
  const AppBugScreen({super.key});

  @override
  State<AppBugScreen> createState() => _AppBugScreenState();
}

class _AppBugScreenState extends State<AppBugScreen> {
  final List<String> _imagePaths = [
    'assets/main.png',
    'assets/main.png',
    'assets/main.png',
    'assets/main.png',
  ];

  final List<String> _mainTexts = [
    '질문',
    '질문',
    '질문',
    '질문',
  ];

  final List<String> _subTexts = [
    '앱이 자꾸 꺼졌다 버그 걸리네요,,',
    '앱이 자꾸 재시동 됬다 버벅 거리네요,,',
    '앱이 자꾸 꺼졌다 버그 걸리네요',
    '앱이 시작조차 안되는데요?',
  ];

  final List<String> _sideTexts = [
    '<완료>',
    '<대기중>',
    '<완료>',
    '<대기중>',
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
      body: ListView.builder(
        padding: const EdgeInsets.all(30.0),
        itemCount: _imagePaths.length * 2 - 1, // 이미지와 구분선의 총 개수
        itemBuilder: (BuildContext context, int index) {
          if (index.isEven) {
            // 짝수 인덱스는 이미지 아이템 생성
            final imageIndex = index ~/ 2; // 짝수 인덱스를 통해 이미지 인덱스 계산
            return InkWell(
              onTap: () {
                if (imageIndex == 0) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AppBug2Screen()),
                  );
                }
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        _imagePaths[imageIndex],
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
                                _mainTexts[imageIndex],
                                style: const TextStyle(
                                    fontSize: 16, color: Colors.black),
                              ),
                              const SizedBox(
                                  width: 10), // 첫 번째 텍스트와 두 번째 텍스트 사이의 간격 조절
                              Text(
                                _sideTexts[imageIndex],
                                style: const TextStyle(
                                    fontSize: 14,
                                    color: Color.fromARGB(255, 117, 117, 117)),
                              ),
                            ],
                          ),
                          Text(
                            _subTexts[imageIndex],
                            style: const TextStyle(
                                fontSize: 12, color: Colors.black54),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 30), // 이미지 사이의 간격 조절
                  if (index < _imagePaths.length * 2 - 2) // 마지막 구분선 제외
                    Divider(
                      color: Colors.white.withOpacity(0.5),
                      height: 30,
                      thickness: 1,
                    ),
                ],
              ),
            );
          } else {
            // 홀수 인덱스는 구분선을 생성
            return const SizedBox(height: 30); // 이미지와 구분선 사이의 간격 조절
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AppBug3Screen()),
          );
        },
        backgroundColor: const Color.fromARGB(255, 168, 214, 251),
        child: const Icon(Icons.add), // 버튼 배경색 변경 가능
      ),
    );
  }
}
