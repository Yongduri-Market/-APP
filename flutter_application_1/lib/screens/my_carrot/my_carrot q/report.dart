import 'package:flutter/material.dart';
import 'appbug.dart'; // appbug.dart import
import 'person_report.dart'; // person_report.dart import

class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  // 각 아이콘에 대응하는 텍스트 리스트
  final List<Map<String, dynamic>> _items = [
    {'text': '사용자 신고', 'icon': Icons.sentiment_dissatisfied},
    {'text': '앱 버그 및 오류 신고', 'icon': Icons.support_agent},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 184, 224, 247),
      appBar: AppBar(
        title: const Center(
          child: Text(
            '신고하기',
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
        itemCount: _items.length * 2 - 1, // 아이템과 구분선의 총 개수
        itemBuilder: (BuildContext context, int index) {
          if (index.isOdd) {
            // 홀수 인덱스는 구분선을 생성
            return Divider(
              color: Colors.white.withOpacity(0.5),
              height: 20,
              thickness: 1,
            );
          } else {
            // 짝수 인덱스는 텍스트 아이템 생성
            final itemIndex = index ~/ 2; // 짝수 인덱스를 통해 텍스트 인덱스 계산
            final item = _items[itemIndex];
            return InkWell(
              onTap: () {
                if (item['text'] == '앱 버그 및 오류 신고') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AppBugScreen()),
                  );
                } else if (item['text'] == '사용자 신고') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PersonReportScreen()),
                  );
                }
              },
              child: _buildQARow(item['icon'], item['text'], size: 35.0),
            );
          }
        },
      ),
    );
  }

  Widget _buildQARow(IconData iconData, String text, {double size = 24.0}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50.0),
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
