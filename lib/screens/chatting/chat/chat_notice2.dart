import 'package:flutter/material.dart';

class ChatNotice2 extends StatelessWidget {
  final String message;
  final Color buttonColor;
  final Color cancelButtonColor;

  const ChatNotice2({
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
              Navigator.of(context).pop();
              // 여기에 실시간 위치 공유 서비스 동의 시 동작할 코드 추가
            },
            child: const Text('예'),
          ),
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: cancelButtonColor, // 취소 버튼 색상 지정
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              '아니요',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
