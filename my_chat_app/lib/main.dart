import 'package:flutter/material.dart';
import 'package:mychatapp/screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Chat Ui",
      theme: ThemeData(
        primaryColor: Colors.red,
        accentColor: Color(0xFFFEF9EB),
      ),
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}


