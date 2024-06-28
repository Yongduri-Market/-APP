// ignore_for_file: unnecessary_import

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Chatmainpage extends StatefulWidget {
  const Chatmainpage({super.key});

  @override
  State<Chatmainpage> createState() => _ChatmainpageState();
}

class _ChatmainpageState extends State<Chatmainpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 184, 224, 247),
      appBar: AppBar(
        title: const Center(
          child: Text(
            '용가리',
            style: TextStyle(fontSize: 15, color: Colors.black),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // 설정 아이콘을 눌렀을 때 실행할 코드 작성
            },
          ),
        ],
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Divider(
            color: Color.fromARGB(255, 175, 217, 240),
            height: 2.0,
          ),
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            top: 30, // 상단으로 이동
            left: 30, // 왼쪽으로 이동
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 70,
                  height: 70,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                      image: NetworkImage('https://via.placeholder.com/100'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          '판매중',
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(width: 5),
                        Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.white,
                          size: 28,
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Text(
                      '5000원',
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 500, // 하단으로 이동
            left: 20, // 왼쪽에 위치
            child: Row(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 167, 212, 236),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    '약속잡기',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 167, 212, 236),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: const Text(
                    '위치잡기',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 440, // 둥근 직사각형과 구분선 사이의 간격
            left: 0,
            right: 0,
            child: Column(
              children: [
                const Divider(
                  color: Color.fromARGB(255, 215, 240, 245),
                  thickness: 1.0,
                  height: 20,
                  indent: 20,
                  endIndent: 20,
                ),
                const SizedBox(height: 10),
                Text(
                  '2024년 7월 1일',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 250, // 날짜 밑으로 이동
            left: 20, // 왼쪽 상단에 위치
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                        color: Colors.white, // 색상 설정
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 167, 212, 236),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        '안녕하세요!',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 50.0), // 오른쪽으로 이동
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 167, 212, 236),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      '거래 가능하실까요?',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 200.0), // 오른쪽으로 이동
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 167, 212, 236),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '날짜: 7월 2일 (금)',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          '시간: 오후 10:00',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          alignment: Alignment.centerRight,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 145, 192, 221),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Text(
                              '약속 보기',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 20, // 아래쪽에 위치
            left: 20, // 왼쪽에 위치
            child: Row(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 130),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 167, 212, 236),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Text(
                    '새 메시지',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                const SizedBox(
                  width: 40,
                  height: 40,
                  child: Icon(
                    Icons.check,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
