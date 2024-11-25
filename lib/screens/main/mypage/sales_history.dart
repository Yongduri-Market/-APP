import 'package:flutter/material.dart';
import 'package:yongduri_market/widget/sales_history_item.dart';
import '../../../widget/completed_sale_item.dart';
import 'sales_post.dart'; // SalesPost import 추가

class SalesHistory extends StatefulWidget {
  static const route = 'sales_history';

  const SalesHistory({super.key});

  @override
  State<SalesHistory> createState() => _SalesHistoryState();
}

class _SalesHistoryState extends State<SalesHistory> {
  int tabIndex = 0;

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
              child: Text('나의 판매내역'),
            ),
            Container(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                ...List.generate(
                  2,
                      (index) => GestureDetector(
                    onTap: () {
                      setState(() {
                        if (index != tabIndex) {
                          tabIndex = index;
                        }
                      });
                    },
                    child: Card(
                      color: index == tabIndex ? const Color(0xff86C3D8) : const Color(0xffB1E2F1),
                      elevation: index == tabIndex ? 4 : 0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 24,
                        ),
                        child: Text(
                          index == 0 ? '판매중' : '거래 완료',
                          style: const TextStyle(fontSize: 14),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: tabIndex == 0
                  ? ListView.separated(
                itemCount: 8,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const SalesPost()),
                    );
                  },
                  child: SalesHistoryItem(comments: index, likes: index * 2),
                ),
                separatorBuilder: (BuildContext context, int index) => Container(
                  height: 1.5,
                  color: const Color(0x80ffffff),
                ),
              )
                  : ListView.separated(
                itemCount: list.length,
                itemBuilder: (context, index) => CompletedSaleItem(
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
