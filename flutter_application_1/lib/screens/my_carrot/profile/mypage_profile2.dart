import 'package:flutter/material.dart';

class MyPageProfile2 extends StatefulWidget {
  const MyPageProfile2({super.key});

  @override
  State<MyPageProfile2> createState() => _MyPageProfile2State();
}

class _MyPageProfile2State extends State<MyPageProfile2> {
  final TextEditingController _nicknameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 184, 224, 247),
      appBar: AppBar(
        title: const Center(
          child: Text(
            '프로필 수정',
            style: TextStyle(fontSize: 15, color: Colors.black),
          ),
        ),
        actions: const [
          Icon(Icons.check, color: Colors.white),
          SizedBox(width: 10),
        ],
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Divider(
            color: Color.fromARGB(255, 175, 217, 240),
            height: 2.0,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 50),
          Center(
            child: Stack(
              children: [
                Container(
                  width: 120,
                  height: 120,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                ),
                Positioned(
                  top: 90,
                  left: 90,
                  child: Container(
                    width: 27,
                    height: 27,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromARGB(255, 199, 199, 199),
                    ),
                    child: const Icon(
                      Icons.camera_alt,
                      size: 17,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.only(left: 30.0),
            child: Text(
              '닉네임',
              style: TextStyle(fontSize: 16, color: Colors.black),
              textAlign: TextAlign.left,
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: TextField(
              controller: _nicknameController,
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color.fromARGB(255, 184, 224, 247),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: const BorderSide(color: Colors.white, width: 1.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: const BorderSide(color: Colors.white, width: 1.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: const BorderSide(color: Colors.white, width: 1.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
