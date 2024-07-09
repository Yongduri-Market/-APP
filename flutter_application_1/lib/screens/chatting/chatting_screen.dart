import 'package:flutter/material.dart';
import '../../models/chat_message.dart';
import '../chatting/components/chat_container.dart';
import '../chatting/chat/chat1.dart'; // chat1.dart를 import 합니다.

class ChattingScreen extends StatelessWidget {
  const ChattingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Image(
            image: AssetImage('assets/main_font.png'),
            width: 130,
            height: 50,
            fit: BoxFit.fill),
        actions: [
          IconButton(
              icon: const Icon(Icons.notifications, color: Colors.white),
              onPressed: () {}),
        ],
      ),
      body: ListView(
        children: List.generate(
          chatMessageList.length,
          (index) => GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Chatmainpage()),
              );
            },
            child: ChatContainer(
              chatMessage: chatMessageList[index],
            ),
          ),
        ),
      ),
    );
  }
}
