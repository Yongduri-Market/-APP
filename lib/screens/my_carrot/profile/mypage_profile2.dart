// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class MyPageProfile2 extends StatefulWidget {
  const MyPageProfile2({super.key});

  @override
  State<MyPageProfile2> createState() => _MyPageProfile2State();
}

class _MyPageProfile2State extends State<MyPageProfile2> {
  final TextEditingController _nicknameController = TextEditingController();
  File? _image;

  Future<void> _pickImage(ImageSource source) async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: source);

    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            '프로필 수정',
            style: TextStyle(fontSize: 15, color: Colors.black),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.check, color: Colors.white),
            onPressed: () {
              // 프로필 저장 로직 추가
            },
          ),
          const SizedBox(width: 10),
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
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    image: _image != null
                        ? DecorationImage(
                            image: FileImage(_image!),
                            fit: BoxFit.cover,
                          )
                        : null,
                  ),
                ),
                Positioned(
                  top: 90,
                  left: 90,
                  child: GestureDetector(
                    onTap: () async {
                      final ImageSource? source = await showDialog<ImageSource>(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('사진 선택'),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ListTile(
                                leading: const Icon(Icons.photo_library),
                                title: const Text('갤러리'),
                                onTap: () => Navigator.of(context)
                                    .pop(ImageSource.gallery),
                              ),
                              ListTile(
                                leading: const Icon(Icons.camera_alt),
                                title: const Text('카메라'),
                                onTap: () => Navigator.of(context)
                                    .pop(ImageSource.camera),
                              ),
                            ],
                          ),
                        ),
                      );

                      if (source != null) {
                        _pickImage(source);
                      }
                    },
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
