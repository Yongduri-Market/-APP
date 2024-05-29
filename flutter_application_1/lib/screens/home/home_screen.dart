// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

import '../../models/product.dart';
import 'components/product_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Image(
            image: AssetImage('assets/main_font.png'),
            width: 130,
            height: 50,
            fit: BoxFit.fill),
        actions: [
          IconButton(
              icon: const Icon(Icons.search, color: Colors.white),
              onPressed: () {}),
          IconButton(
              icon: const Icon(Icons.notifications, color: Colors.white),
              onPressed: () {})
        ],
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => Divider(
          height: 0,
          indent: 16,
          endIndent: 16,
          color: Colors.grey,
        ),
        itemBuilder: (context, index) {
          return ProductItem(
            product: productList[index],
          );
        },
        itemCount: productList.length,
      ),
    );
  }
}
