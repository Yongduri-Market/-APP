import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class AppBug3Screen extends StatefulWidget {
  const AppBug3Screen({super.key});

  @override
  State<AppBug3Screen> createState() => _AppBug3ScreenState();
}

class _AppBug3ScreenState extends State<AppBug3Screen> {
  // 각 아이콘에 대응하는 텍스트 리스트
  final List<String> _texts = [
    '앱이 잘 작동하지 않거나 튕겨요',
    '업데이트 버전 및 전원 재작동',
  ];

  File? _imageFile; // 선택된 이미지를 저장할 변수
  final TextEditingController _textController =
      TextEditingController(); // 텍스트 입력 컨트롤러

  Future<void> _pickImage() async {
    // ignore: deprecated_member_use
    final pickedFile = await ImagePicker().getImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 184, 224, 247),
      appBar: AppBar(
        title: const Center(
          child: Text(
            '앱 버그 및 신고',
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
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(20.0),
              itemCount: (_texts.length / 2).ceil(),
              itemBuilder: (BuildContext context, int index) {
                final int firstIndex = index * 2;
                final int secondIndex = index * 2 + 1;

                return Column(
                  children: [
                    _buildQARow(Icons.person, _texts[firstIndex], size: 35.0),
                    if (secondIndex < _texts.length)
                      _buildQARow(Icons.support_agent, _texts[secondIndex],
                          size: 35.0),
                    Divider(
                      color: Colors.white.withOpacity(0.5),
                      height: 20,
                      thickness: 1,
                    ),
                  ],
                );
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 10.0),
            child: Text(
              '이외의 신고는 아래에 작성해 주세요',
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
          ),
          Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  margin: const EdgeInsets.only(top: 10),
                  width: 350,
                  height: 350,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 184, 224, 247),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.white,
                      width: 0.7,
                    ),
                  ),
                  child: _imageFile != null
                      ? Image.file(
                          _imageFile!,
                          fit: BoxFit.cover,
                        )
                      : TextField(
                          controller: _textController,
                          maxLines: null,
                          decoration: const InputDecoration(
                            hintText: '신고 내용을 입력하세요',
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(10.0),
                          ),
                        ),
                ),
              ),
              Positioned(
                bottom: 20,
                left: 40,
                child: IconButton(
                  icon: const Icon(
                    Icons.camera_alt,
                    color: Colors.white,
                    size: 30,
                  ),
                  onPressed: _pickImage,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Container(
            width: 350,
            height: 40,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 166, 206, 227),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Center(
              child: Text(
                '신고하기',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            width: 350,
            height: 40,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 184, 224, 247),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Center(
              child: Text(
                '취소',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildQARow(IconData iconData, String text, {double size = 24.0}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(iconData, size: size, color: Colors.white),
          const SizedBox(width: 20.0),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 16, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
