import 'package:flutter/material.dart';

import '../../../widget/purchase_item.dart';

class PurchaseHistory extends StatefulWidget {
  static const route = 'purchase_history';

  const PurchaseHistory({super.key});

  @override
  State<PurchaseHistory> createState() => _PurchaseHistoryState();
}

class _PurchaseHistoryState extends State<PurchaseHistory> {
  List<({int comments, int likes})> list = [
    (comments: 3, likes: 3),
    (comments: 2, likes: 6),
    (comments: 4, likes: 5),
    (comments: 4, likes: 2),
    (comments: 1, likes: 5),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 24,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text('나의 구매내역'),
            ),
            Container(
              height: 16,
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.separated(
                itemCount: list.length,
                itemBuilder: (context, index) => PurchaseItem(
                  comments: list[index].comments,
                  likes: list[index].likes,
                  onTap: () {
                    setState(() {
                      list.removeAt(index);
                    });
                  },
                ),
                separatorBuilder: (BuildContext context, int index) => Container(
                  height: 1.5,
                  color: const Color(0x80ffffff),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
