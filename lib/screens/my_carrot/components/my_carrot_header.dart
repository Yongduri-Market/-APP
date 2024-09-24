// ignore_for_file: unnecessary_import, unused_element

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../theme.dart';

class MyCarrotHeader extends StatelessWidget {
  final String buttonText;
  final VoidCallback onProfileButtonPressed;

  const MyCarrotHeader({
    super.key,
    required this.buttonText,
    required this.onProfileButtonPressed,
  });

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
            _buildProfileButton(context),
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
                child: const Icon(
                  Icons.camera_alt_outlined,
                  size: 15,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('용가리', style: textTheme().displayMedium), // :TODO 04수정
            const SizedBox(height: 10),
            const Text('좌동 #00912'),
          ],
        )
      ],
    );
  }

  Widget _buildProfileButton(BuildContext context) {
    return InkWell(
      onTap: onProfileButtonPressed,
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 171, 212, 234),
          border: Border.all(
            color: const Color.fromARGB(255, 184, 224, 247),
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(6.0),
        ),
        height: 45,
        child: Center(
          child: Text(
            buttonText,
            style: textTheme().titleMedium,
          ),
        ),
      ),
    );
  }

  Widget _buildRoundTextButton(String title, IconData iconData) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              color: const Color.fromRGBO(255, 226, 208, 1),
              border: Border.all(
                  color: const Color.fromARGB(255, 184, 224, 247), width: 0.5)),
        ),
      ],
    );
  }
}
