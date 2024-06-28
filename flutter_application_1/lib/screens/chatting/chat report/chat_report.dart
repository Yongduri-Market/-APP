import 'package:flutter/material.dart';

class Chatmainpage extends StatefulWidget {
  const Chatmainpage({super.key});

  @override
  State<Chatmainpage> createState() => _ChatmainpageState();
}

class _ChatmainpageState extends State<Chatmainpage> {
  final List<String> _texts = [
    '반말을 사용해요',
    '불친절해요',
    '노쇼',
    '시간 약속을 잘 안지켜요',
    '거래와 관련 없는 대화를 해요',
    '원하지 않는 가격을 계속 요구해요',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 184, 224, 247),
      appBar: AppBar(
        title: const Center(
          child: Text(
            '비매너 신고하기',
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
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    '용가리',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(30.0),
              child: Text(
                '어떤 점이 불편했나요?',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Column(
                children: List.generate(_texts.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: Row(
                      children: [
                        Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 184, 224, 247),
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(color: Colors.white),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          _texts[index],
                          style: const TextStyle(
                              fontSize: 16, color: Colors.black),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
              child: Container(
                width: double.infinity,
                height: 300,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 184, 224, 247),
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(color: Colors.white),
                ),
                child: const Center(
                  child: Text(
                    'Additional Information',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10), // 직사각형과 버튼 사이의 간격 조절

            Container(
              width: 340,
              height: 40,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 166, 206, 227), // 버튼 배경 색상
                borderRadius: BorderRadius.circular(10), // 둥근 모양 설정
              ),
              child: const Center(
                child: Text(
                  '신고하기',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
            ),
            const SizedBox(height: 10), // 버튼 사이의 간격 조절
            Container(
              width: 340,
              height: 40,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 184, 224, 247), // 버튼 배경 색상
                borderRadius: BorderRadius.circular(10), // 둥근 모양 설정
              ),
              child: const Center(
                child: Text(
                  '취소',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
