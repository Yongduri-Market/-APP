// chat_notice.dart

import 'package:flutter/material.dart';
import '../chat review/chat_review.dart';

class ChatNotice extends StatelessWidget {
  final String message;
  final Color buttonColor;
  final Color cancelButtonColor;

  const ChatNotice({
    super.key,
    required this.message,
    required this.buttonColor,
    required this.cancelButtonColor,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            message,
            style: const TextStyle(color: Colors.black),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: buttonColor, // 버튼 색상 지정
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const ChatReviewPage()),
              );
            },
            child: const Text('예, 거래했어요'),
          ),
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: cancelButtonColor, // 취소 버튼 색상 지정
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              '취소',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
