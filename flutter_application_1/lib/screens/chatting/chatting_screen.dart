// ignore_for_file: prefer_const_constructors, unused_import

import 'package:flutter/material.dart';

import '../../models/chat_message.dart';
// import '../components/appbar_prefreed_size.dart';
import '../chatting/components/chat_container.dart';
import '../chatting/chatting2.dart';

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
          (index) => ChatContainer(
            chatMessage: chatMessageList[index],
          ),
        ),
      ),
    );
  }
}
