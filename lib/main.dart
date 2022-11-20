import 'package:flutter/material.dart';
import 'package:flutter_application_project_software/login/Login_Page.dart';

void main() {
  runApp(MyApp());
}

// StatelessWidget
// StatefulWidget

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      home: login_page(),
    );
  }
}
