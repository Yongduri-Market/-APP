import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../data/notification_item.dart';

class NotificationScreen extends StatefulWidget {
  static const route = 'notification_screen';

  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  bool isEditMode = false;

  List<NotificationItem> notificationList = List.generate(
    12,
    (index) => NotificationItem(
      title: '${index + 1}월의 가계부가 도착했어요 !',
      content: '#용용이 #축제 #따뜻한 거래',
      date: DateTime.now(),
    ),
  );

  @override
  Widget build(BuildContext context) {
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
        centerTitle: true,
        title: const Text('알림'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              onPressed: () {
                setState(() {
                  isEditMode = !isEditMode;
                });
              },
              icon: Icon(isEditMode ? Icons.check_rounded : Icons.settings),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(

            height: 1.5,
            color: const Color(0x80ffffff),
            margin: const EdgeInsets.symmetric(horizontal: 32),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: notificationList.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  horizontalTitleGap: 16,
                  leading: SvgPicture.asset(
                    'assets/icons/ic_main.svg',
                    width: 48,
                    height: 48,
                  ),
                  title: Text(notificationList[index].title),
                  titleTextStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black),
                  subtitle: Text(notificationList[index].content),
                  subtitleTextStyle: const TextStyle(fontWeight: FontWeight.normal, fontSize: 14, color: Colors.black),
                  trailing: isEditMode
                      ? IconButton(
                          onPressed: () {
                            setState(() {
                              notificationList.removeAt(index);
                            });
                          },
                          icon: const Icon(
                            Icons.close_rounded,
                            color: Colors.white,
                            size: 28,
                          ),
                        )
                      : null,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
