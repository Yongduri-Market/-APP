import 'package:flutter/material.dart';
import '../chat report/chat_report.dart'; // ChatReport 페이지를 import

class ChatMypage extends StatefulWidget {
  const ChatMypage({super.key});

  @override
  State<ChatMypage> createState() => _ChatMypageState();
}

class _ChatMypageState extends State<ChatMypage> {
  final List<Map<String, dynamic>> _items = [
    {'text': '차단하기', 'icon': Icons.sentiment_dissatisfied},
    {'text': '알림끄기', 'icon': Icons.notifications},
    {'text': '신고하기', 'icon': Icons.support_agent},
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
          preferredSize: Size.fromHeight(10.0),
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
              height: 70,
              thickness: 1,
            );
          } else {
            // 짝수 인덱스는 텍스트 아이템 생성
            final itemIndex = index ~/ 2; // 짝수 인덱스를 통해 텍스트 인덱스 계산
            final item = _items[itemIndex];
            return ListTile(
              leading: Icon(item['icon'], size: 35.0, color: Colors.white),
              title: Text(
                item['text'],
                style: const TextStyle(fontSize: 16, color: Colors.black),
              ),
              onTap: () {
                if (item['text'] == '신고하기') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const ChatReport(), // ChatReport 페이지로 이동
                    ),
                  );
                }
              },
            );
          }
        },
      ),
    );
  }
}
