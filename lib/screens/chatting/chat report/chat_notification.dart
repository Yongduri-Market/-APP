import 'package:flutter/material.dart';

class Chatmainpage extends StatefulWidget {
  const Chatmainpage({super.key});

  @override
  State<Chatmainpage> createState() => _ChatmainpageState();
}

class _ChatmainpageState extends State<Chatmainpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 184, 224, 247),
      appBar: AppBar(
        title: const Center(
          child: Text(
            '사용자를 신고하는 이유를 선택해주세요.',
            style: TextStyle(fontSize: 15, color: Colors.black),
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop(); // 뒤로 가기 기능 추가
          },
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
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildReasonItem('비매너 사용자에요', Icons.keyboard_arrow_right),
          _buildDivider(),
          _buildReasonItem('전문 판매업자 같아요', Icons.keyboard_arrow_right),
          _buildDivider(),
          _buildReasonItem('사기인 것 같아요', Icons.keyboard_arrow_right),
          _buildDivider(),
          _buildReasonItem('욕설 비방 혐오 표현을 해요', Icons.keyboard_arrow_right),
        ],
      ),
    );
  }

  Widget _buildReasonItem(String text, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: const TextStyle(fontSize: 16, color: Colors.black),
            textAlign: TextAlign.center,
          ),
          const SizedBox(width: 10),
          Icon(
            icon,
            color: Colors.white,
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return const Divider(
      color: Color.fromARGB(255, 200, 226, 239),
      height: 2.0,
      thickness: 2,
    );
  }
}
