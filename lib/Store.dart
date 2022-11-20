import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Store_page extends StatefulWidget {
  const Store_page({super.key});

  @override
  State<Store_page> createState() => _Store_pageState();
}

class _Store_pageState extends State<Store_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text('Home Page')),
    );
  }
}
