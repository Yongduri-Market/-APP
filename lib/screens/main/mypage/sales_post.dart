import 'package:flutter/material.dart';
import 'dart:math' as math;

class SalesPost extends StatefulWidget {
  const SalesPost({super.key});

  @override
  _SalesPostState createState() => _SalesPostState();
}

class _SalesPostState extends State<SalesPost> {
  @override
  Widget build(BuildContext context) {
    // 화면 크기를 가져오기 위해 MediaQuery 사용
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 24,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: screenWidth,
          height: screenHeight,
          decoration: const BoxDecoration(),
          child: Stack(
            children: <Widget>[
              _buildBackground(screenWidth, screenHeight),
              _buildTopSection(screenWidth),
              _buildProfilePicture(),
              _buildRotatedDivider(492.04),
              _buildRotatedDivider(857.04),
              _buildUserName(),
              _buildSmallImage(),
              _buildStatusContainer(),
              _buildTemperatureContainer(),
              _buildTemperatureText(),
              _buildButton(503, 31, 116, 44, '판매중', 'assets/images/Image178.png'),
              _buildButton(870, 254, 157, 44, '대화중인 채팅방', null, isChat: true),
              _buildGoodsText(),
              _buildPriceText(),
              _buildCategoryText(),
              _buildDivider(),
              _buildDescriptionText(),
              _buildSmallIcon(),
              _buildRotatedSmallDivider(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBackground(double width, double height) {
    return Positioned(
      top: 0,
      left: 0,
      child: Container(
        width: width,
        height: height,
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.25),
              offset: Offset(0, 4),
              blurRadius: 4,
            ),
          ],
          color: Color.fromRGBO(196, 235, 248, 1),
        ),
      ),
    );
  }

  Widget _buildTopSection(double width) {
    return Positioned(
      top: 0,
      left: 0,
      child: Container(
        width: width,
        height: 364,
        decoration: const BoxDecoration(
          color: Color.fromRGBO(223, 239, 243, 1),
        ),
      ),
    );
  }

  Widget _buildProfilePicture() {
    return Positioned(
      top: 397,
      left: 23,
      child: Container(
        width: 60,
        height: 60,
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.25),
              offset: Offset(0, 4),
              blurRadius: 4,
            ),
          ],
          color: Color.fromRGBO(255, 255, 255, 1),
          borderRadius: BorderRadius.all(Radius.circular(60)),
        ),
      ),
    );
  }

  Widget _buildRotatedDivider(double top) {
    return Positioned(
      top: top,
      left: 24,
      child: Transform.rotate(
        angle: 0.3059745731999865 * (math.pi / 180),
        child: const Divider(
          color: Color.fromRGBO(198, 241, 255, 1),
          thickness: 5,
        ),
      ),
    );
  }

  Widget _buildUserName() {
    return const Positioned(
      top: 412,
      left: 98,
      child: Text(
        '용용토끼',
        textAlign: TextAlign.left,
        style: TextStyle(
          color: Color.fromRGBO(0, 0, 0, 1),
          fontFamily: 'Inter',
          fontSize: 20,
          fontWeight: FontWeight.normal,
          height: 1,
        ),
      ),
    );
  }

  Widget _buildSmallImage() {
    return Positioned(
      top: 407,
      left: 374,
      child: Container(
        width: 37,
        height: 37,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Image176.png'),
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
    );
  }

  Widget _buildStatusContainer() {
    return Positioned(
      top: 416,
      left: 275,
      child: Container(
        width: 87,
        height: 21,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(70),
          color: const Color.fromRGBO(255, 255, 255, 1),
        ),
      ),
    );
  }

  Widget _buildTemperatureContainer() {
    return Positioned(
      top: 416,
      left: 275,
      child: Container(
        width: 38,
        height: 21,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(70),
          color: const Color.fromRGBO(135, 194, 212, 1),
        ),
      ),
    );
  }

  Widget _buildTemperatureText() {
    return const Positioned(
      top: 391,
      left: 290,
      child: Text(
        '36.9',
        textAlign: TextAlign.left,
        style: TextStyle(
          color: Color.fromRGBO(0, 0, 0, 1),
          fontFamily: 'Inter',
          fontSize: 14,
          fontWeight: FontWeight.normal,
          height: 1,
        ),
      ),
    );
  }

  Widget _buildButton(double top, double left, double width, double height, String text, String? imagePath, {bool isChat = false}) {
    return Positioned(
      top: top,
      left: left,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(isChat ? 10 : 15),
          color: const Color.fromRGBO(177, 224, 239, 1),
        ),
        child: isChat
            ? Center(
          child: Text(
            text,
            textAlign: TextAlign.left,
            style: const TextStyle(
              color: Color.fromRGBO(0, 0, 0, 1),
              fontFamily: 'Inter',
              fontSize: 15,
              fontWeight: FontWeight.normal,
              height: 1,
            ),
          ),
        )
            : Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(width: 10),
            Text(
              text,
              textAlign: TextAlign.left,
              style: const TextStyle(
                color: Color.fromRGBO(0, 0, 0, 1),
                fontFamily: 'Inter',
                fontSize: 18,
                fontWeight: FontWeight.normal,
                height: 1,
              ),
            ),
            if (imagePath != null)
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(imagePath),
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildGoodsText() {
    return const Positioned(
      top: 567,
      left: 35,
      child: Text(
        '용용이 굿즈',
        textAlign: TextAlign.left,
        style: TextStyle(
          color: Color.fromRGBO(0, 0, 0, 1),
          fontFamily: 'Inter',
          fontSize: 20,
          fontWeight: FontWeight.normal,
          height: 1,
        ),
      ),
    );
  }

  Widget _buildPriceText() {
    return const Positioned(
      top: 877,
      left: 93,
      child: Text(
        '4,000원',
        textAlign: TextAlign.left,
        style: TextStyle(
          color: Color.fromRGBO(0, 0, 0, 1),
          fontFamily: 'Inter',
          fontSize: 20,
          fontWeight: FontWeight.normal,
          height: 1,
        ),
      ),
    );
  }

  Widget _buildCategoryText() {
    return const Positioned(
      top: 600,
      left: 36,
      child: Text(
        '잡화',
        textAlign: TextAlign.left,
        style: TextStyle(
          color: Color.fromRGBO(63, 61, 61, 0.89),
          fontFamily: 'Inter',
          fontSize: 13,
          fontWeight: FontWeight.normal,
          height: 1,
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Positioned(
      top: 617.02,
      left: 33.97,
      child: Transform.rotate(
        angle: 0.09613259960105416 * (math.pi / 180),
        child: const Divider(
          color: Color.fromRGBO(41, 44, 51, 1),
          thickness: 1,
        ),
      ),
    );
  }

  Widget _buildDescriptionText() {
    return const Positioned(
      top: 663,
      left: 33,
      child: Text(
        '작년에 새학기 때 받은 인형이에요\n\n사용감 전혀 없고 좋아요 :)\n\n저렴히 가져가세용!',
        textAlign: TextAlign.left,
        style: TextStyle(
          color: Color.fromRGBO(0, 0, 0, 1),
          fontFamily: 'Inter',
          fontSize: 13,
          fontWeight: FontWeight.normal,
          height: 1,
        ),
      ),
    );
  }

  Widget _buildSmallIcon() {
    return Positioned(
      top: 877,
      left: 16,
      child: Container(
        width: 30,
        height: 30,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Image211.png'),
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
    );
  }

  Widget _buildRotatedSmallDivider() {
    return Positioned(
      top: 864,
      left: 63,
      child: Transform.rotate(
        angle: -90 * (math.pi / 180),
        child: const Divider(
          color: Color.fromRGBO(198, 241, 255, 1),
          thickness: 5,
        ),
      ),
    );
  }
}
