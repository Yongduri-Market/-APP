import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../chat appointment/appointment.dart';
import 'chat_notice.dart'; // Import the ChatNotice widget
import 'chat_notice2.dart'; // Import the ChatNotice2 widget
import 'chat_mypage.dart'; // Import the ChatMypage widget

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
          buttonColor: Color.fromARGB(255, 136, 195, 227),
          cancelButtonColor: Colors.black,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
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
                          underline: Container(), // 밑줄 제거
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
                    const SizedBox(height: 10),
                    // Row에서 Expanded를 제거하고 정렬을 위해 crossAxisAlignment를 사용합니다.
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start, // 왼쪽 정렬 추가
                      children: [
                        GestureDetector(
                          onTap: () {
                            _createAppointment(context);
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
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
                        ),
                        const SizedBox(width: 10),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ChatMypage(),
                              ),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 167, 212, 236),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Text(
                              '신고하기',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
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
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(20),
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
                }),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.camera_alt),
                  color: Colors.white,
                  onPressed: _pickImage,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: '새 메시지',
                      filled: true,
                      fillColor: Color.fromARGB(255, 167, 212, 236),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                    ),
                    onSubmitted: (value) {
                      if (value.isNotEmpty) {
                        _addMessage(value);
                      }
                    },
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
