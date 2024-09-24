import 'package:flutter/material.dart';

class SalesHistoryItem extends StatelessWidget {
  final int comments;
  final int likes;

  const SalesHistoryItem({super.key, required this.comments, required this.likes});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            width: 112,
            height: 96,
            color: const Color(0xffE0EFF4),
          ),
          const Expanded(child: SizedBox()),
          const Icon(
            Icons.comment_rounded,
            color: Colors.white,
          ),
          Container(
            width: 24,
            alignment: Alignment.center,
            child: Text(
              '$comments',
              style: const TextStyle(fontSize: 16),
            ),
          ),
          const Icon(
            Icons.favorite,
            color: Colors.white,
          ),
          Container(
            width: 24,
            alignment: Alignment.center,
            child: Text(
              '$likes',
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}