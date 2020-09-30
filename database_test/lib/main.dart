import 'package:database_test/ui/my_home.dart';
import 'package:flutter/material.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const String _title = "Moor Database Test";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(
        primaryColor: Colors.blueAccent
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}
