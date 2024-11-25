import 'package:flutter/material.dart';
import 'package:yongduri_market/screens/auth_screen.dart';
import 'package:yongduri_market/screens/main/mypage/purchase_history.dart';
import 'package:yongduri_market/screens/main/mypage/sales_history.dart';
import 'package:yongduri_market/screens/main_screen.dart';
import 'package:yongduri_market/screens/notification_screen.dart';
import 'package:yongduri_market/screens/search_screen.dart';
import 'package:yongduri_market/screens/sell_screen.dart';
import 'package:yongduri_market/theme.dart';

void main() {
  runApp(const MyApp());
}

ValueNotifier<bool> isLoggedIn = ValueNotifier<bool>(false);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '용두리 마켓',
      routes: {
        'auth_screen': (context) => const AuthScreen(),
        'main_screen': (context) => const MainScreen(),
        'sell_screen': (context) => const SellScreen(),
        'search_screen': (context) => const SearchScreen(),
        'notification_screen': (context) => const NotificationScreen(),
        'sales_history': (context) => const SalesHistory(),
        'purchase_history': (context) => const PurchaseHistory(),
      },
      debugShowCheckedModeBanner: false,
      theme: theme(),
      
      /// StreamBuilder로 로그인 상태 감지하도록 수정 추천
      home: ValueListenableBuilder(
        valueListenable: isLoggedIn,
        builder: (BuildContext context, bool value, Widget? child) {
          if (value) {
            return const MainScreen();
          } else {
            return const AuthScreen();
          }
        },
      ),
    );
  }
}
