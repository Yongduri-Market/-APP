// ignore_for_file: unnecessary_import, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../theme.dart';

class MyCarrotHeader extends StatelessWidget {
  const MyCarrotHeader(
      {super.key,
      required String buttonText,
      required Null Function() onProfileButtonPressed});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 184, 224, 247),
      elevation: 0.5,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Column(
          children: [
            _buildProfileRow(),
            const SizedBox(height: 30),
            _buildProfileButton(),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileRow() {
    return Row(
      children: [
        Stack(
          children: [
            SizedBox(
              width: 65,
              height: 65,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(32.5),
                child: const Image(
                  image: AssetImage('assets/main.png'), // :TODO 04 사진수정
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey[100]),
                child: Icon(
                  Icons.camera_alt_outlined,
                  size: 15,
                ),
              ),
            ),
          ],
        ),
        SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('용가리', style: textTheme().displayMedium), // :TODO 04수정
            SizedBox(height: 10),
            Text('좌동 #00912'),
          ],
        )
      ],
    );
  }

  Widget _buildProfileButton() {
    return InkWell(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 171, 212, 234),
          border: Border.all(
            color: Color.fromARGB(255, 184, 224, 247),
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(6.0),
        ),
        height: 45,
        child: Center(
          child: Text(
            '프로필 보기', // :TODO 04수정 (오타)
            style: textTheme().titleMedium, // :TODO 04수정
          ),
        ),
      ),
    );
  }

  // ignore: unused_element
  Widget _buildRoundTextButton(String title, IconData iconData) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              color: Color.fromRGBO(255, 226, 208, 1),
              border: Border.all(
                  color: Color.fromARGB(255, 184, 224, 247), width: 0.5)),
        ),
      ],
    );
  }
}
