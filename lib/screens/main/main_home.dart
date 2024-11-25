import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../models/product.dart';
import '../notification_screen.dart';
import '../search_screen.dart';
import '../sell_screen.dart';
import '../components/product_item.dart'; // ProductItem 위젯을 임포트하는 부분을 추가해야 합니다.

class MainHome extends StatefulWidget {
  const MainHome({super.key});

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 64,
        title: GestureDetector(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(
              'assets/icons/ic_title.svg',
              height: 64,
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, SearchScreen.route);
            },
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, NotificationScreen.route);
            },
            icon: const Icon(
              Icons.notifications_rounded,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  ...List.generate(
                    5,
                        (index) => const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2),
                      child: Card(
                        color: Color(0xffB1E2F1),
                        elevation: 0,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 24,
                          ),
                          child: Text(
                            '          ',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded( // ListView를 Expanded로 감싸서 가용 공간을 차지하도록 수정
            child: ListView.separated(
              separatorBuilder: (context, index) => const Divider(
                height: 0,
                indent: 16,
                endIndent: 16,
                color: Colors.grey,
              ),
              itemBuilder: (context, index) {
                return ProductItem(
                  product: productList[index], // productList를 사용하는 부분
                );
              },
              itemCount: productList.length, // productList 길이를 사용하는 부분
            ),
          ),
        ],
      ),
      floatingActionButton: Stack(
        alignment: Alignment.bottomRight,
        children: [
          AnimatedContainer(
            width: isActive ? 160 : 0,
            height: 48,
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            margin: EdgeInsets.only(bottom: isActive ? 64 : 0, right: isActive ? 0 : 32),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: SizedBox(
                height: 44,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff86C3D8),
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed(SellScreen.route);
                  },
                  child: const Text(
                    '내 물건 팔기',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          AnimatedContainer(
            width: isActive ? 64 : 112,
            height: 44,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  isActive = !isActive;
                });
              },
              child: Icon(
                isActive ? Icons.close_rounded : Icons.add_rounded,
                color: Colors.white,
                size: isActive ? 28 : 32,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
