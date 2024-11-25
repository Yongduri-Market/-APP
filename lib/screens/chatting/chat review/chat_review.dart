import 'package:flutter/material.dart';
import "package:yongduri_market/screens/my_carrot/profile/mypage_profile.dart";

class ChatReviewPage extends StatefulWidget {
  const ChatReviewPage({super.key});

  @override
  State<ChatReviewPage> createState() => _ChatReviewPageState();
}

class _ChatReviewPageState extends State<ChatReviewPage> {
  final List<String> _imagePaths = [
    'assets/main.png',
    'assets/main.png',
    'assets/main.png',
    'assets/main.png',
    'assets/main.png',
  ];
  final List<String> _texts = [
    '제가 있는 곳까지 와서 거래했어요',
    '시간 약속을 잘 지켜요',
    '친절하고 매너가 좋아요',
    '응답이 빨라요',
    '적당한 가격에 구매했어요',
  ];
  final List<bool> _selectedImages = List<bool>.filled(5, false);
  final List<bool> _selectedTexts = List<bool>.filled(5, false);
  final List<String> _reviews = [];

  void _toggleTextSelection(int index) {
    setState(() {
      _selectedTexts[index] = !_selectedTexts[index];
    });
  }

  void _submitReview() {
    setState(() {
      for (int i = 0; i < _texts.length; i++) {
        if (_selectedTexts[i] && !_reviews.contains(_texts[i])) {
          _reviews.add(_texts[i]);
        }
      }
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MyPageProfile(reviews: _reviews),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 184, 224, 247),
      appBar: AppBar(
        title: const Center(
          child: Text(
            '거래 후기 보내기',
            style: TextStyle(fontSize: 15, color: Colors.black),
          ),
        ),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Divider(
            color: Color.fromARGB(255, 175, 217, 240),
            height: 2.0,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
              child: Row(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '용용이 인형',
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        '거래한 이웃 용가리',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20, top: 20),
              child: Divider(
                color: Color.fromARGB(255, 215, 240, 245),
                thickness: 1.0,
                height: 30,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(30.0),
              child: Text(
                '용가리님과 거래가 어떠셨나요?',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _imagePaths.asMap().entries.map((entry) {
                  int idx = entry.key;
                  String path = entry.value;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedImages[idx] = !_selectedImages[idx];
                      });
                    },
                    child: Opacity(
                      opacity: _selectedImages[idx] ? 1.0 : 0.5,
                      child: Image.asset(
                        path,
                        width: 50,
                        height: 50,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            if (_selectedImages.contains(true))
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Column(
                  children: List.generate(_texts.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () => _toggleTextSelection(index),
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                color: _selectedTexts[index]
                                    ? Colors.blue
                                    : const Color.fromARGB(255, 184, 224, 247),
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(color: Colors.white),
                              ),
                              child: _selectedTexts[index]
                                  ? const Icon(
                                      Icons.check,
                                      color: Colors.white,
                                    )
                                  : null,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            _texts[index],
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              ),
            const SizedBox(height: 10), // 직사각형과 버튼 사이의 간격 조절
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: _submitReview,
                  child: Container(
                    width: 350,
                    height: 40,
                    decoration: BoxDecoration(
                      color:
                          const Color.fromARGB(255, 166, 206, 227), // 버튼 배경 색상
                      borderRadius: BorderRadius.circular(10), // 둥근 모양 설정
                    ),
                    child: const Center(
                      child: Text(
                        '후기 보내기',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10), // 버튼 사이의 간격 조절
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Divider(
                color: Color.fromARGB(255, 215, 240, 245),
                thickness: 1.0,
                height: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
