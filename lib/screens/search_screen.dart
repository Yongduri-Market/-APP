import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  static const route = 'search_screen';

  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<String> searchHistoryList = [
    '토익 기출문제집',
    '용용인형',
    '쉽게 배우는 파이썬',
    '미적분학',
    'lg 그램 2023',
    '태권도 도복',
    '딥러닝을 위한 수학',
    '네잎클로버 키링',
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
        title: const SizedBox(
          height: 40,
          child: TextField(
            cursorColor: Color(0xff86C3D8),
            style: TextStyle(
              fontSize: 14,
            ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 16),
              filled: true,
              fillColor: Color(0xffB1E2F1),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 8,
            ),
            const Text('최근 검색'),
            const SizedBox(
              height: 8,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: searchHistoryList.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: const Icon(
                      Icons.restore_rounded,
                      color: Colors.white,
                      size: 28,
                    ),
                    title: Text(searchHistoryList[index]),
                    trailing: IconButton(
                      onPressed: () {
                        setState(() {
                          searchHistoryList.removeAt(index);
                        });
                      },
                      icon: const Icon(
                        Icons.close_rounded,
                        color: Colors.white,
                        size: 28,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
