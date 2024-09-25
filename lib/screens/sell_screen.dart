import 'package:flutter/material.dart';

class SellScreen extends StatefulWidget {
  static const route = 'sell_screen';

  const SellScreen({super.key});

  @override
  State<SellScreen> createState() => _SellScreenState();
}

class _SellScreenState extends State<SellScreen> {
  bool isChecked = false;

  int tradingMethodIndex = -1;

  final List<String> tradingMethods = [
    '판매하기',
    '나눔하기',
    '구하기',
  ];

  int categoryMethodIndex = -1;

  final List<String> categoryMethods = [
    '책',
    '의류',
    '전자기기',
    '부동산',
    '기타',
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
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
          centerTitle: true,
          title: const Text('내 물건 팔기'),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.restore_rounded),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: SingleChildScrollView(
            clipBehavior: Clip.none,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 1.5,
                  color: const Color(0x80ffffff),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.symmetric(vertical: 32),
                  child: Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Icon(
                      Icons.camera_alt_rounded,
                      color: Colors.white,
                      size: 32,
                    ),
                  ),
                ),
                const Text('제목'),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(),
                const SizedBox(
                  height: 16,
                ),
                const Text('거래 방식'),
                const SizedBox(
                  height: 8,
                ),
                SizedBox(
                  width: double.infinity,
                  child: SingleChildScrollView(
                    clipBehavior: Clip.none,
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        ...List.generate(
                          tradingMethods.length,
                          (index) => GestureDetector(
                            onTap: () {
                              setState(() {
                                if (index == tradingMethodIndex) {
                                  tradingMethodIndex = -1;
                                } else {
                                  tradingMethodIndex = index;
                                }
                              });
                            },
                            child: Card(
                              color: index == tradingMethodIndex ? const Color(0xff86C3D8) : const Color(0xffB1E2F1),
                              elevation: index == tradingMethodIndex ? 4 : 0,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 8,
                                  horizontal: 24,
                                ),
                                child: Text(
                                  tradingMethods[index],
                                  style: const TextStyle(fontSize: 14),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text('카테고리'),
                const SizedBox(
                  height: 8,
                ),
                SizedBox(
                  width: double.infinity,
                  child: SingleChildScrollView(
                    clipBehavior: Clip.none,
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        ...List.generate(
                          categoryMethods.length,
                              (index) => GestureDetector(
                            onTap: () {
                              setState(() {
                                if (index == categoryMethodIndex) {
                                  categoryMethodIndex = -1;
                                } else {
                                  categoryMethodIndex = index;
                                }
                              });
                            },
                            child: Card(
                              color: index == categoryMethodIndex ? const Color(0xff86C3D8) : const Color(0xffB1E2F1),
                              elevation: index == categoryMethodIndex ? 4 : 0,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 8,
                                  horizontal: 24,
                                ),
                                child: Text(
                                  categoryMethods[index],
                                  style: const TextStyle(fontSize: 14),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text('가격'),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Checkbox(
                      activeColor: const Color(0xff86C3D8),
                      checkColor: Colors.white,
                      side: const BorderSide(
                        color: Colors.white,
                        width: 2.0,
                      ),
                      value: isChecked,
                      onChanged: (value) {
                        setState(() {
                          isChecked = value!;
                        });
                      },
                    ),
                    const Text(
                      '가격 제안 받기',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text('자세한 설명'),
                const SizedBox(
                  height: 8,
                ),
                SizedBox(
                  height: 256,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 32),
                    child: TextFormField(
                      maxLines: null,
                      expands: true,
                      textAlignVertical: TextAlignVertical.top,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: (true)
            ? Container(
                width: 112,
                height: 36,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff86C3D8),
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22), // 모서리 둥글기
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        Navigator.of(context).pop();
                      });
                    },
                    child: const Icon(
                      Icons.check_rounded,
                      color: Colors.white,
                      size: 24,
                    )),
              )
            : null,
      ),
    );
  }
}
