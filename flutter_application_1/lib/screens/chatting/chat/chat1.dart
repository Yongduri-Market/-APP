// ignore_for_file: unnecessary_to_list_in_spreads, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../chat appointment/appointment.dart';
import 'chat_notice.dart'; // Import the ChatNotice widget
import 'chat_notice2.dart'; // Import the ChatNotice2 widget

class Chatmainpage extends StatefulWidget {
  const Chatmainpage({super.key});

  @override
  State<Chatmainpage> createState() => _ChatmainpageState();
}

class _ChatmainpageState extends State<Chatmainpage> {
  List<Map<String, dynamic>> messages = [
    {'text': '안녕하세요!', 'isUserMessage': false},
    {'text': '거래 가능하실까요?', 'isUserMessage': false},
  ];
  String? appointmentMessage;

  final TextEditingController _controller = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  void _addMessage(String message, {File? image}) {
    setState(() {
      messages.add({'text': message, 'isUserMessage': true, 'image': image});
    });
    _controller.clear();
  }

  Future<void> _createAppointment(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AppointmentPage()),
    );
    if (result != null) {
      setState(() {
        appointmentMessage =
            '약속을 만들었어요!\n날짜: ${result['date'].year}-${result['date'].month}-${result['date'].day}, 시간: ${result['time']}';
      });
    }
  }

  Future<void> _pickImage() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      _addMessage('사진을 보냈습니다.', image: File(pickedFile.path));
    }
  }

  void _showChatNotice() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const ChatNotice(
          message: "용가리님과 '용용이 인형' 물품을 거래하셨나요?",
          backgroundColor: Color.fromARGB(255, 184, 224, 247),
          buttonColor: Color.fromARGB(255, 136, 195, 227),
          cancelButtonColor: Colors.black,
        );
      },
    );
  }

  void _showChatNotice2() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const ChatNotice2(
          message: "실시간 위치 공유 서비스 동의하십니까?",
          backgroundColor: Color.fromARGB(255, 184, 224, 247),
          buttonColor: Color.fromARGB(255, 136, 195, 227),
          cancelButtonColor: Colors.black,
        );
      },
    );
  }

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
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text(
                          '판매중',
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(width: 1),
                        DropdownButton<String>(
                          items: <String>['판매중', '예약중', '거래완료']
                              .map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            if (newValue == '거래완료') {
                              _showChatNotice();
                            } else if (newValue == '예약중') {
                              _showChatNotice2();
                            }
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 2),
                    const Text(
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
            bottom: 550, // 하단으로 이동
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
                  child: GestureDetector(
                    onTap: () {
                      _createAppointment(context);
                    },
                    child: const Text(
                      '약속잡기',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
              ],
            ),
          ),
          Positioned(
            bottom: 490, // 둥근 직사각형과 구분선 사이의 간격
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
            right: 20, // 오른쪽에도 위치
            bottom: 70, // 텍스트 입력 필드 위에 위치
            child: ListView(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.white,
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                        const SizedBox(height: 5),
                        Container(
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
                      ],
                    ),
                  ],
                ),
                if (appointmentMessage != null)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 167, 212, 236),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        appointmentMessage!,
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ...messages.skip(2).map((message) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Row(
                      mainAxisAlignment: message['isUserMessage']
                          ? MainAxisAlignment.end
                          : MainAxisAlignment.start,
                      children: [
                        if (!message['isUserMessage'])
                          const CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.white,
                          ),
                        const SizedBox(width: 10),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          decoration: BoxDecoration(
                            color: message['isUserMessage']
                                ? const Color.fromARGB(255, 167, 212, 236)
                                : const Color.fromARGB(255, 167, 212, 236),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                message['text'],
                                style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                ),
                              ),
                              if (message['image'] != null)
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Image.file(
                                    message['image'],
                                    width: 100,
                                    height: 100,
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ],
            ),
          ),
          Positioned(
            bottom: 20, // 아래쪽에 위치
            left: 20, // 왼쪽에 위치
            right: 20,
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.camera_alt),
                  color: Colors.white,
                  onPressed: _pickImage,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Container(
                    height: 40, // 새 메시지 입력 필드의 높이 줄이기
                    child: TextField(
                      controller: _controller,
                      decoration: const InputDecoration(
                        labelText: '새 메시지',
                        filled: true,
                        fillColor: Color.fromARGB(255, 167, 212, 236),
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                      onSubmitted: (value) {
                        if (value.isNotEmpty) {
                          _addMessage(value);
                        }
                      },
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                IconButton(
                  icon: const Icon(Icons.send),
                  color: Colors.white,
                  onPressed: () {
                    if (_controller.text.isNotEmpty) {
                      _addMessage(_controller.text);
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(home: Chatmainpage()));
}
