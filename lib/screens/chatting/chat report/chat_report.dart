// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ChatReport extends StatefulWidget {
  const ChatReport({super.key});

  @override
  State<ChatReport> createState() => _ChatReportState();
}

class _ChatReportState extends State<ChatReport> {
  final List<String> _texts = [
    '반말을 사용해요',
    '불친절해요',
    '노쇼',
    '시간 약속을 잘 안지켜요',
    '거래와 관련 없는 대화를 해요',
    '원하지 않는 가격을 계속 요구해요',
  ];

  final Set<int> _selectedIndices = <int>{};
  final TextEditingController _additionalInfoController =
      TextEditingController();

  final ImagePicker _picker = ImagePicker();
  XFile? _image;

  Future<void> _pickImage() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = pickedFile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 167, 212, 236),
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    color: const Color.fromARGB(255, 167, 212, 236),
                  ),
                ),
                child: const Text(
                  '비매너 평가는 상대방에게 노출되지 않아요. '
                  '내용이 사실과 다를 경우 이용 제재를 받을 수 있으니 주의해주세요.',
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 20.0),
              child: Column(
                children: List.generate(_texts.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          if (_selectedIndices.contains(index)) {
                            _selectedIndices.remove(index);
                          } else {
                            _selectedIndices.add(index);
                          }
                        });
                      },
                      child: Row(
                        children: [
                          Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              color: _selectedIndices.contains(index)
                                  ? Colors.blue // 선택된 항목의 색상
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                color: _selectedIndices.contains(index)
                                    ? Colors.blue // 선택된 항목의 테두리 색상
                                    : Colors.white,
                              ),
                            ),
                            child: Center(
                              child: Icon(
                                _selectedIndices.contains(index)
                                    ? Icons.check
                                    : null, // 선택된 항목에 체크 아이콘 추가
                                size: 20,
                                color: Colors.white,
                              ),
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
                    ),
                  );
                }),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 300,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 184, 224, 247),
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: Colors.white),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: _additionalInfoController,
                        maxLines: null, // 자동 줄 바꿈
                        decoration: const InputDecoration(
                          hintText: '추가 정보를 입력하세요',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
                        ),
                        style:
                            const TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: GestureDetector(
                      onTap: _pickImage,
                      child: const SizedBox(
                        width: 40,
                        height: 40,
                        child: Center(
                          child: Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10), // 직사각형과 버튼 사이의 간격 조절

            Align(
              alignment: Alignment.centerRight, // 오른쪽 정렬
              child: Padding(
                padding: const EdgeInsets.only(right: 30.0), // 오른쪽 패딩
                child: Column(
                  children: [
                    Container(
                      width: 340,
                      height: 40,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(
                            255, 166, 206, 227), // 버튼 배경 색상
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
                        color: const Color.fromARGB(
                            255, 184, 224, 247), // 버튼 배경 색상
                        borderRadius: BorderRadius.circular(10), // 둥근 모양 설정
                      ),
                      child: const Center(
                        child: Text(
                          '취소',
                          style: TextStyle(fontSize: 16, color: Colors.black),
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
    );
  }
}
